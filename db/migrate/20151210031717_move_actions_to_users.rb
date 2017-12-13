class MoveActionsToUsers < ActiveRecord::Migration
	def change
		remove_index :actions, :investment_account_id
		remove_column :actions, :investment_account_id, :integer
		add_column :actions, :user_id, :integer
		add_index :actions, :user_id
	end
end
