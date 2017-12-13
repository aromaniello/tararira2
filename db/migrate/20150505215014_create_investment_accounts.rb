class CreateInvestmentAccounts < ActiveRecord::Migration
  def change
    create_table :investment_accounts do |t|
		t.belongs_to :user, index: true
		t.integer :risk_profile, default: 3
		t.float :current_value, default: 0
		
		t.timestamps null: false
    end
  end
end
