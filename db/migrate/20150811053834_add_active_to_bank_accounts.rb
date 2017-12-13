class AddActiveToBankAccounts < ActiveRecord::Migration
	def change
		add_column :bank_accounts, :active, :boolean, default: false
	end
end
