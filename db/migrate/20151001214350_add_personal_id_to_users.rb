class AddPersonalIdToUsers < ActiveRecord::Migration
	def change
		add_column :users, :personal_id, :string
	end
end
