class CreateAppTokens < ActiveRecord::Migration
	def change
		create_table :app_tokens do |t|
			t.string :token, null: false
			t.boolean :active, default: true

			t.timestamps null: false
		end
	end
end
