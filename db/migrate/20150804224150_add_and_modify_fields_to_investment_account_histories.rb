class AddAndModifyFieldsToInvestmentAccountHistories < ActiveRecord::Migration
	def change
		remove_column :investment_account_histories, :value, :float
		add_column :investment_account_histories, :share_value, :float
		add_column :investment_account_histories, :account_value, :float
	end
end
