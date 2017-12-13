class AddManualUpdateToPortfolios < ActiveRecord::Migration
	def change
		add_column :portfolios, :manual_update, :boolean, default: false
	end
end
