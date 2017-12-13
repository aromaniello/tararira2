class AddDisableUpdateFieldsToPortfoliosAndInvestmentAccounts < ActiveRecord::Migration
	def change
		add_column :investment_accounts, :updates_disabled, :boolean, default: false
		add_column :portfolios, :updates_disabled, :boolean, default: false
	end
end
