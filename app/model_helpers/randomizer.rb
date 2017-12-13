module Randomizer

	def self.seed_investment_account_history!(investment_account)
		investment_account.histories.destroy_all
		
		running_date = Time.now - 1.day
		portfolio = investment_account.current_portfolio
		
		if portfolio.share_value > 0
			last_value = portfolio.share_value
		else
			last_value = 1000
		end
		
		if investment_account.shares > 0
			shares = investment_account.shares
		else
			shares = 100
		end

		for i in 0...365
			change = rand * 10 - 5
			share_value = last_value * (1 + change / 100)
			last_value = share_value
			
			account_value = shares * share_value
			
			iah = investment_account.histories.create!(risk_profile: investment_account.risk_profile, shares: shares, share_value: share_value, account_value: account_value)
			iah.created_at = running_date
			iah.updated_at = running_date
			iah.save!
			
			running_date = running_date - 1.day
		end
	end

	def self.seed_all_portfolio_histories!
		PortfolioHistory.destroy_all
		
		running_date = Time.now - 1.day
		portfolios = Portfolio.current_portfolios
		last_value = { # could use map
			1 => portfolios[1].share_value,
			2 => portfolios[2].share_value,
			3 => portfolios[3].share_value,
			4 => portfolios[4].share_value,
			5 => portfolios[5].share_value
		}
		for i in 0...365
			portfolios.each do |risk_profile, portfolio|
				change = rand * 10 - 5
				share_value = last_value[portfolio.risk_profile] * (1 + change / 100)
				last_value[portfolio.risk_profile] = share_value
			
				ph = PortfolioHistory.create!(name: portfolio.name, risk_profile: portfolio.risk_profile, share_value: share_value, shares: portfolio.shares)
				ph.created_at = running_date
				ph.updated_at = running_date
				ph.save!
			end
			
			running_date = running_date - 1.day
		end
	end

end