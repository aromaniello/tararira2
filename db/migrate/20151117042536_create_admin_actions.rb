class CreateAdminActions < ActiveRecord::Migration
	def change
		create_table :admin_actions do |t|
			t.belongs_to :admin, index: true
			t.belongs_to :user, index: true
			t.string :description

			t.timestamps null: false
		end
	end
end
