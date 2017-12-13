class RemoveCurrentValueFromAssets < ActiveRecord::Migration
	def change
		remove_column :assets, :current_value, :float, default: 0
	end
end
