class CreateMixedPortfolios < ActiveRecord::Migration
	def change
		create_table :mixed_portfolios do |t|
			t.integer :risk_profile

			t.timestamps null: false
		end
	end
end
