class RemoveHolderNameAndIdFromBankAccounts < ActiveRecord::Migration
  def change
  	remove_column :bank_accounts, :holder_first_name, :string
	remove_column :bank_accounts, :holder_last_name, :string
	remove_column :bank_accounts, :holder_id, :string
  end
end
