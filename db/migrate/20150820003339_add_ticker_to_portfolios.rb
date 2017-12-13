class AddTickerToPortfolios < ActiveRecord::Migration
	def change
		add_column :portfolios, :ticker, :string
	end
end
