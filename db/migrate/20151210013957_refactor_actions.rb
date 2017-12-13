class RefactorActions < ActiveRecord::Migration
	def change
		add_column :actions, :action_date, :datetime
		add_column :actions, :status, :string
		remove_column :actions, :old_value, :string
		rename_column :actions, :new_value, :value
	end
end
