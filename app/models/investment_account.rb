class InvestmentAccount < ActiveRecord::Base

	has_many :transactions, dependent: :destroy
	has_many :investment_account_histories
	belongs_to :user

	validates :risk_profile, inclusion: { in: [1,2,3,4,5,nil], message: "%(value) is not a valid risk profile" }

	def current_portfolio
		Portfolio.find_by(risk_profile: self.risk_profile)
	end
	
	def account_value
		self.share_value * self.shares
	end

	def share_value
		if self.risk_profile.nil?
			0
		else
			self.current_portfolio.share_value
		end
	end
	
	def histories
		self.investment_account_histories
	end
	
	def last_history
		self.investment_account_histories.order("created_at DESC").first
	end

	def last_variation
		unless self.last_history.nil?
			self.account_value - h.last_history.account_value - self.transactions_since_last_update
		else
			Log.error(description: "last history is nil for investment account", location: "last_variation in investment_account", context: "user: #{self.user.email}, investment_account: #{self.inspect}")
			0
		end
	end

	def last_variation_percentage
		h = self.last_history
		if !h.nil? && h.account_value != 0
			((self.account_value - h.account_value - self.transactions_since_last_update) / h.account_value) * 100
		else
			Log.error(description: "last history is nil or zero for investment account", location: "last_variation_percentage in investment_account", context: "user: #{self.user.email}, investment_account: #{self.inspect}")
			0
		end
	end

	# list of currently valid risk profiles, hard coded because it's  unlikely to change
	def self.valid_risk_profiles
		[1,2,3,4,5]
	end

	# check if a specific risk profile value is valid
	def self.valid_risk_profile?(test_risk_profile)
		self.valid_risk_profiles.include? test_risk_profile
	end
	
	# get all transactions for this investment account that have been approved but not yet processed
	def unprocessed_transactions
		self.transactions.where(approved: true, processed: false)
	end
	
	def daily_update
		
		if self.user.nil?
			Log.error(description: "investment account does not have an associated user", location: "daily_update in investment_account", context: "investment_account: #{self.inspect}")
		end

		if self.risk_profile.nil? # the account is new and the risk profile hasn't been set yet
			
			# if there is a risk profile pending to be set, do it, and initialize the account's other values
			if self.pending_risk_profile
				
				delta = 0
				self.unprocessed_transactions.each do |t|
					if t.is_deposit?
						delta += t.amount
					elsif t.is_refund?
						Log.error(description: "uninitialized investment account should not have a refund", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.inspect}, transaction: #{t.inspect}")
						return
					else
						Log.error(description: "unknown transaction type", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.inspect}, transaction: #{t.inspect}")
						return
					end
					t.update(processed: true, credited_at: Time.now)
				end
				
				if self.shares != 0 # the account should be new if the risk profile isn't set
					Log.error(description: "shares should be zero if the risk profile isn't set", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.inspect}")
					return
				end
				
				portfolio = Portfolio.current_for_risk_profile(self.pending_risk_profile)
				
				new_account_value = delta # because it's a new account
				new_shares = new_account_value / portfolio.share_value
				
				unless self.update(risk_profile: self.pending_risk_profile, shares: new_shares, transactions_since_last_update: new_account_value, pending_risk_profile: nil, pending_risk_profile_sent_at: nil, last_update: Time.now)
					Log.error(description: "the investment account could not be saved", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.inspect}, errors: #{investment_account.errors}")
				end
			end
			
		else # the account isn't new
			
			portfolio = Portfolio.current_for_risk_profile(self.risk_profile) # get the latest portfolio
			
			pending_transactions = self.unprocessed_transactions # fix the set of transactions in case this changes while this function is running
			delta = 0
			pending_transactions.each do |t|
				if t.is_deposit?
					delta += t.amount
				elsif t.is_refund?
					delta -= t.amount
				else
					Log.error(description: "unknown transaction type", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.inspect}, transaction: #{t.inspect}")
				end
			end
				
			if portfolio.last_update >= self.last_update # the portfolio was updated recently

				old_portfolio = Portfolio.last_for_risk_profile(self.risk_profile) # may not need in future

				history = self.histories.build(risk_profile: self.risk_profile, shares: self.shares, share_value: old_portfolio.share_value, account_value: self.shares * old_portfolio.share_value)

				old_account_value = self.shares * old_portfolio.share_value
				new_account_value = old_account_value + delta # add transactions to account value (if any)

				time = Time.now

				if self.pending_risk_profile.nil? # no change in risk profile
					new_shares = new_account_value / portfolio.share_value # recalculate shares with the updated portfolio's share value

					success = self.update(shares: new_shares, last_update: time, transactions_since_last_update: delta)
				else
					new_portfolio = Portfolio.current_for_risk_profile(self.pending_risk_profile) # get the portfolio the user has changed to
					new_shares = new_account_value / new_portfolio.share_value # recalculate shares with the new (and updated) portfolio's share value

					# create an action to indicate the risk profile was changed, but save it only if the investment account is successfully saved
					portfolio_change_action = self.user.actions.build(action_type: :change_risk_profile, old_value: self.risk_profile, new_value: self.pending_risk_profile)
					
					if success = self.update(shares: new_shares, last_update: time, transactions_since_last_update: delta, pending_risk_profile: nil, pending_risk_profile_sent_at: nil, risk_profile: new_portfolio.risk_profile)
						unless portfolio_change_action.save
							Log.error(description: "the portfolio change action could not be created", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.to_s}, action: #{portfolio_change_action}, errors: #{portfolio_change_action.errors}")
						end
					end
				end

				if success # the investment account was saved successfully
					
					# set all transactions as processed
					pending_transactions.each do |t|
						unless t.update(processed: true, credited_at: time)
							Log.error(description: "a transaction could not be updated", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.to_s}, transaction: #{t.to_s}, errors: #{t.errors}")
						end
					end
					
					# save the investment account's history
					unless history.save
						Log.error(description: "the investment account history could not be saved", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.to_s}, history: #{history.to_s}, errors: #{history.errors}")
					end
					
				else
					Log.error(description: "the investment account could not be updated", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.to_s}, errors: #{self.errors}")
				end

			else # the portfolio wasn't updated, just add all transactions at the current value (! might want to wait for an update or a certain timeframe to do this)

				old_account_value = self.shares * portfolio.share_value
				new_account_value = old_account_value + delta
				
				time = Time.now
				
				if self.pending_risk_profile.nil?
					new_shares = new_account_value / portfolio.share_value
					success = self.update(shares: new_shares, last_update: time, transactions_since_last_update: self.transactions_since_last_update + delta)
				else
					new_portfolio = Portfolio.current_for_risk_profile(self.pending_risk_profile)
					new_shares = new_account_value / new_portfolio.share_value

					# create an action to indicate the risk profile was changed, but save it only if the investment account is successfully saved
					portfolio_change_action = self.get_portfolio_change_action(self.pending_risk_profile)
					if portfolio_change_action 
						portfolio_change_action.status = "complete"
					else # if it doesn't exist
						Log.warning(description: "portfolio change action did not exist already", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.to_s}")
						portfolio_change_action = self.user.actions.build(action_type: :change_risk_profile, value: self.pending_risk_profile, action_date: Time.now, status: "complete")
					end

					if success = self.update(shares: new_shares, last_update: time, transactions_since_last_update: self.transactions_since_last_update + delta, pending_risk_profile: nil, pending_risk_profile_sent_at: nil, risk_profile: new_portfolio.risk_profile)
						unless portfolio_change_action.save
							Log.error(description: "the portfolio change action could not be saved", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.to_s}, action: #{portfolio_change_action}, errors: #{portfolio_change_action.errors}")
						end
					end
				end

				if success
					pending_transactions.each do |t|
						unless t.update(processed: true, credited_at: time)
							Log.error(description: "a transaction could not be updated", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.to_s}, transaction: #{t.to_s}, errors: #{t.errors}")
						end
					end
				else
					Log.error(description: "the investment account could not be updated", location: "daily_update in investment_account", context: "user: #{investment_account.user.email}, investment_account: #{self.to_s}, errors: #{self.errors}")
				end
			end
			
		end
		
	end
	
	def self.daily_update
		self.all.each do |investment_account|
			investment_account.daily_update unless investment_account.updates_disabled
		end
		Log.success(description: "the daily update was run for all investment accounts")
	end

	def get_portfolio_change_action(risk_profile)
		self.user.actions.where(value: risk_profile.to_s, status: "pending").order("created_at DESC").first
	end

	# pending, return a random number for now
	def self.recommend_risk_profile(answers)
		return [1,2,3,4,5].sample
	end

	def enough_for_refund?(amount)
		pending_for_extraction = 0

		self.transactions.each do |t|
			if t.is_refund? && !t.processed
				pending_for_extraction += t.amount
			end
		end

		amount >= 0 && amount <= (self.account_value - pending_for_extraction)
	end

end
