class CreateMixedPortfolioRelationships < ActiveRecord::Migration
	def change
		create_table :mixed_portfolio_relationships do |t|
			t.belongs_to :portfolio, index: true
			t.belongs_to :mixed_portfolio, index: true
			t.decimal :weight
		end
	end
end
