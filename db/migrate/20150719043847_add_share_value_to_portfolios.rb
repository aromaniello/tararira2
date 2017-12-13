class AddShareValueToPortfolios < ActiveRecord::Migration
	def change
		add_column :portfolios, :share_value, :float
	end
end
