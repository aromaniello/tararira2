class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
		t.belongs_to :user, index: true
		t.string :holder_first_name
		t.string :holder_last_name
		t.string :holder_id
		t.string :bank_name
		t.integer :account_type, default: 0, null: false
		t.string :account_number
		t.string :account_cbu

    	t.timestamps null: false
    end
  end
end
