class CreateInvestmentAccountHistories < ActiveRecord::Migration
	def change
		create_table :investment_account_histories do |t|
			t.belongs_to :user, index: true
			t.float :shares
			t.float :value
			t.integer :risk_profile
			
  			t.timestamps null: false
 		end
	end
end
