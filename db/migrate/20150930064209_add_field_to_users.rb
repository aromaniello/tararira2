class AddFieldToUsers < ActiveRecord::Migration
	def change
		add_column :users, :ready_for_processing, :boolean, default: false
	end
end
