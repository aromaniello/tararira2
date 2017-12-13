class CreatePortfolioHistories < ActiveRecord::Migration
	def change
 		create_table :portfolio_histories do |t|
			t.string :name
			t.integer :risk_profile
			t.float :share_value
			t.integer :shares

			t.timestamps null: false
		end
	end
end
