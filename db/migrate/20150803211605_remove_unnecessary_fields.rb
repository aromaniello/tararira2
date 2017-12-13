class RemoveUnnecessaryFields < ActiveRecord::Migration
	def change
		remove_column :assets, :commercial_name, :string
		remove_column :portfolios, :current_value, :float
		remove_column :portfolios, :aum, :float
		remove_column :investment_accounts, :current_value, :float
	end
end
