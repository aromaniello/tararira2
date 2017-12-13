class MakeBankAccountAssociationPolymorphic < ActiveRecord::Migration
	def change
		remove_index :bank_accounts, :user_id
		remove_column :bank_accounts, :user_id, :integer

		add_column :bank_accounts, :bank_account_like_id, :integer
		add_column :bank_accounts, :bank_account_like_type, :string
		
		add_index :bank_accounts, :bank_account_like_id
	end
end
