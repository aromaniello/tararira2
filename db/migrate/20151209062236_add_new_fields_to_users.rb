class AddNewFieldsToUsers < ActiveRecord::Migration
	def change
		add_column :users, :question_4, :boolean, default: false
		add_column :users, :welcome_shown, :boolean, default: false
	end
end
