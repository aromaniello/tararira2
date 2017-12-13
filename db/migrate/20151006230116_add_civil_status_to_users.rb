class AddCivilStatusToUsers < ActiveRecord::Migration
	def change
		add_column :users, :civil_status, :integer
	end
end
