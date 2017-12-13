class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
		t.belongs_to :investment_account, index: true
		t.integer :transaction_type, default: 0
		t.float :amount, default: 0
		t.boolean :approved, default: false
		t.boolean :completed, default: false
		
		t.timestamps null: false
    end
  end
end
