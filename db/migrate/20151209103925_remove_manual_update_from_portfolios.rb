class RemoveManualUpdateFromPortfolios < ActiveRecord::Migration
	def change
		remove_column :portfolios, :manual_update, :boolean, default: false 
	end
end
