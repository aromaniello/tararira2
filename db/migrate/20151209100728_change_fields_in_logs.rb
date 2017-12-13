class ChangeFieldsInLogs < ActiveRecord::Migration
	def change
		remove_column :logs, :target, :string
		rename_column :logs, :function, :location
	end
end
