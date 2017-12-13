class CreateBankAccountHistories < ActiveRecord::Migration
	def change
		create_table :bank_account_histories do |t|
			t.belongs_to :user
			t.string :bank_name
			t.integer :account_type
			t.string :account_number
			t.string :account_cbu

			t.timestamps null: false
		end
	end
end
