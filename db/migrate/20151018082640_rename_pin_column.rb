class RenamePinColumn < ActiveRecord::Migration
	def change
		rename_column :users, :pin_number, :pin_hash
	end
end
