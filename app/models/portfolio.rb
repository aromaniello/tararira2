require 'nokogiri'

class Portfolio < ActiveRecord::Base

	has_many :portfolio_asset_relationships, dependent: :destroy
	has_many :assets, through: :portfolio_asset_relationships

	has_one :bank_account, as: :bank_account_like, dependent: :destroy
	
	def aum
		self.shares * self.share_value
	end
	
	def self.current_for_risk_profile(risk_profile)
		raise "Invalid risk profile: #{risk_profile}" unless InvestmentAccount.valid_risk_profile? risk_profile

		Portfolio.where(risk_profile: risk_profile).order("created_at DESC").first
	end

	def self.last_for_risk_profile(risk_profile)
		raise "Invalid risk profile: #{risk_profile}" unless InvestmentAccount.valid_risk_profile? risk_profile

		PortfolioHistory.where(risk_profile: risk_profile).order("created_at DESC").first
	end
	
	def self.current_portfolios
		(1..5).map { |n| self.current_for_risk_profile(n) }
	end
	
	def histories
		PortfolioHistory.where("risk_profile = ?", self.risk_profile)
	end
	
	def daily_update
		
		portfolio_history = PortfolioHistory.new(name: self.name, risk_profile: self.risk_profile, share_value: self.share_value, shares: self.shares)
		
		if self.update_pending # update the portfolio manually
			unless self.update(share_value: self.new_share_value, update_pending: false, new_share_value: 0, last_update: Time.now)
				Log.error(description: "the portfolio could not be updated", location: "daily_update in portfolio (manual update)", context: "portfolio: #{self.to_s}")
			end
			unless portfolio_history.save
				Log.error(description: "the portfolio history could not be saved", location: "daily_update in portfolio (manual update)", context: "portfolio: #{self.to_s}, portfolio_history: #{portfolio_history}")
			end
		else
			# get share value from external API
			new_share_value = Nokogiri::HTML(open("http://www.bloomberg.com/quote/#{self.ticker}")).css("meta[itemprop='price']")[0]["content"].to_d
			
			if self.share_value != new_share_value
				unless self.update(share_value: new_share_value, last_update: Time.now)
					Log.error(description: "the portfolio could not be updated", location: "daily_update in portfolio (updating from external API)", context: "portfolio: #{self.to_s}")
				end
				unless portfolio_history.save
					Log.error(description: "the portfolio history could not be saved", location: "daily_update in portfolio (updating from external API)", context: "portfolio: #{self.to_s}, portfolio_history: #{portfolio_history}")
				end
			end
		end
	end
	
	def self.daily_update
		self.current_portfolios.each do |risk_profile, portfolio|
			portfolio.daily_update unless portfolio.updates_disabled
		end
		Log.success(description: "the daily update was run for all portfolios")
	end
	
end
