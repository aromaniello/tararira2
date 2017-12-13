class RemoveShareValueFromInvestmentAccounts < ActiveRecord::Migration
	def change
		remove_column :investment_accounts, :share_value, :decimal
	end
end
