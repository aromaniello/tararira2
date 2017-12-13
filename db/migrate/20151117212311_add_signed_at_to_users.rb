class AddSignedAtToUsers < ActiveRecord::Migration
	def change
		add_column :users, :signed_at, :datetime
	end
end
