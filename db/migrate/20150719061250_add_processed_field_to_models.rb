class AddProcessedFieldToModels < ActiveRecord::Migration
	def change
		add_column :actions, :processed, :boolean, default: false
		add_column :transactions, :processed, :boolean, default: false
		remove_column :transactions, :completed, :boolean 
	end
end
