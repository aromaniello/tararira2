class RenameReadyForProcessingInUser < ActiveRecord::Migration
	def change
		rename_column :users, :ready_for_processing, :pending_authorization
	end
end
