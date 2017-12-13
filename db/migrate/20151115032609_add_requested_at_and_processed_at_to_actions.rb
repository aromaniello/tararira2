class AddRequestedAtAndProcessedAtToActions < ActiveRecord::Migration
	def change
		add_column :actions, :requested_at, :datetime
		add_column :actions, :processed_at, :datetime
	end
end
