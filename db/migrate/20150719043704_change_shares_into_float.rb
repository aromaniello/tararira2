class ChangeSharesIntoFloat < ActiveRecord::Migration
	def change
  		remove_column :investment_accounts, :shares, :integer
		add_column :investment_accounts, :shares, :float
	end
end
