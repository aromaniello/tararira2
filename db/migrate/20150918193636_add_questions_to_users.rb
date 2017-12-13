class AddQuestionsToUsers < ActiveRecord::Migration
	def change
		add_column :users, :question_1, :boolean, default: false
		add_column :users, :question_2, :boolean, default: false
		add_column :users, :question_3, :boolean, default: false
	end
end
