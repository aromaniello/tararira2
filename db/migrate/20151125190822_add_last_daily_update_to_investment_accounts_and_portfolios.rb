class AddLastDailyUpdateToInvestmentAccountsAndPortfolios < ActiveRecord::Migration
	def change
		add_column :investment_accounts, :last_daily_update, :datetime
		add_column :portfolios, :last_daily_update, :datetime
	end
end
