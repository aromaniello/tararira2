class AddFieldsToAdminActions < ActiveRecord::Migration
	def change
		add_column :admin_actions, :old_value, :string
		add_column :admin_actions, :new_value, :string
	end
end
