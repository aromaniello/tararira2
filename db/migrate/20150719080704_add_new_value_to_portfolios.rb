class AddNewValueToPortfolios < ActiveRecord::Migration
	def change
		add_column :portfolios, :new_share_value, :float, default: 0
		add_column :portfolios, :update_pending, :boolean, default: false
		add_column :portfolios, :previous_version_id, :integer
		add_column :portfolios, :aum, :float
		add_column :portfolios, :shares, :integer
	end
end
