class AddDefaultsToPortfolios < ActiveRecord::Migration
	def up
		change_column :portfolios, :share_value, :float, default: 0
		change_column :portfolios, :shares, :integer, default: 0
	end
  
	def down
		change_column :portfolios, :share_value, :float, default: nil
		change_column :portfolios, :shares, :integer, default: nil
	end
end
