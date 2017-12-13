class ChangeNameToPortfolioField < ActiveRecord::Migration
	def change
		rename_column :portfolios, :new_share_value, :next_share_value
	end
end
