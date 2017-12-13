class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
	def change
		change_table(:users) do |t|
			t.string :provider, null: false
			t.string :uid, null: false, default: ""
			t.text :tokens
		end

		add_index :users, [:uid, :provider], unique: true
	end
end
