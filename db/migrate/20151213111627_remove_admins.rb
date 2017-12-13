class RemoveAdmins < ActiveRecord::Migration
	def up
		drop_table :admins
	end

	def down
		create_table "admins", force: :cascade do |t|
			t.string   "email",              default: "", null: false
			t.string   "encrypted_password", default: "", null: false
			t.integer  "sign_in_count",      default: 0,  null: false
			t.datetime "current_sign_in_at"
			t.datetime "last_sign_in_at"
			t.inet     "current_sign_in_ip"
			t.inet     "last_sign_in_ip"
			t.integer  "failed_attempts",    default: 0,  null: false
			t.string   "unlock_token"
			t.datetime "locked_at"
			t.datetime "created_at"
			t.datetime "updated_at"
		end

		add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
		add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree
	end
end
