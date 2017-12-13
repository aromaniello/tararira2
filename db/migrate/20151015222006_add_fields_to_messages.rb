class AddFieldsToMessages < ActiveRecord::Migration
	def change
		add_column :messages, :read, :boolean, default: false
		add_column :messages, :replied, :boolean, default: false
	end
end
