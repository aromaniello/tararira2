# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151219051638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string   "value",       null: false
    t.integer  "action_type", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "action_date"
    t.string   "status"
    t.integer  "user_id"
  end

  add_index "actions", ["user_id"], name: "index_actions_on_user_id", using: :btree

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_actions", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "old_value"
    t.string   "new_value"
  end

  add_index "admin_actions", ["admin_id"], name: "index_admin_actions_on_admin_id", using: :btree
  add_index "admin_actions", ["user_id"], name: "index_admin_actions_on_user_id", using: :btree

  create_table "admin_tokens", force: :cascade do |t|
    t.string   "token",                     null: false
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  add_index "admin_users", ["unlock_token"], name: "index_admin_users_on_unlock_token", unique: true, using: :btree

  create_table "app_tokens", force: :cascade do |t|
    t.string   "token",                     null: false
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "assets", force: :cascade do |t|
    t.integer  "asset_type",    default: 0
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "asset_subtype", default: 0
    t.string   "ticker"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "bank_name"
    t.integer  "account_type",           default: 0,     null: false
    t.string   "account_number"
    t.string   "account_cbu"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "active",                 default: false
    t.integer  "bank_account_like_id"
    t.string   "bank_account_like_type"
  end

  add_index "bank_accounts", ["bank_account_like_id"], name: "index_bank_accounts_on_bank_account_like_id", using: :btree

  create_table "investment_account_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "risk_profile"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.decimal  "shares",                precision: 30, scale: 10, default: 0.0
    t.decimal  "share_value",           precision: 30, scale: 10, default: 0.0
    t.decimal  "account_value",         precision: 30, scale: 10, default: 0.0
    t.integer  "investment_account_id"
  end

  add_index "investment_account_histories", ["user_id"], name: "index_investment_account_histories_on_user_id", using: :btree

  create_table "investment_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "risk_profile"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.decimal  "shares",                         precision: 30, scale: 10, default: 0.0
    t.integer  "pending_risk_profile"
    t.datetime "pending_risk_profile_sent_at"
    t.datetime "last_update"
    t.decimal  "transactions_since_last_update",                           default: 0.0
    t.boolean  "updates_disabled",                                         default: false
  end

  add_index "investment_accounts", ["user_id"], name: "index_investment_accounts_on_user_id", using: :btree

  create_table "logs", force: :cascade do |t|
    t.integer  "log_type"
    t.string   "description"
    t.string   "location"
    t.string   "context"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.string   "body"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "read",       default: false
    t.boolean  "replied",    default: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "portfolio_asset_relationships", force: :cascade do |t|
    t.integer  "portfolio_id"
    t.integer  "asset_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "weight",       precision: 30, scale: 10, default: 0.0
  end

  add_index "portfolio_asset_relationships", ["asset_id"], name: "index_portfolio_asset_relationships_on_asset_id", using: :btree
  add_index "portfolio_asset_relationships", ["portfolio_id"], name: "index_portfolio_asset_relationships_on_portfolio_id", using: :btree

  create_table "portfolio_histories", force: :cascade do |t|
    t.string   "name"
    t.integer  "risk_profile"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "share_value",  precision: 30, scale: 10, default: 0.0
    t.decimal  "shares",       precision: 30, scale: 10, default: 0.0
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer  "risk_profile",                               default: 3
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "name",                                       default: ""
    t.boolean  "update_pending",                             default: false
    t.decimal  "share_value",      precision: 30, scale: 10, default: 0.0
    t.decimal  "next_share_value", precision: 30, scale: 10, default: 0.0
    t.decimal  "shares",           precision: 30, scale: 10, default: 0.0
    t.string   "ticker"
    t.datetime "last_update"
    t.boolean  "updates_disabled",                           default: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "investment_account_id"
    t.integer  "transaction_type",                                default: 0
    t.boolean  "approved",                                        default: false
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.string   "proof_file_name"
    t.string   "proof_content_type"
    t.integer  "proof_file_size"
    t.datetime "proof_updated_at"
    t.boolean  "processed",                                       default: false
    t.decimal  "amount",                precision: 30, scale: 10, default: 0.0
    t.datetime "credited_at"
  end

  add_index "transactions", ["investment_account_id"], name: "index_transactions_on_investment_account_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                 default: "",    null: false
    t.string   "encrypted_password",                    default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "gender",                                default: 0
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "zip_code"
    t.string   "phone_number"
    t.string   "tax_id"
    t.integer  "employment_status",                     default: 0
    t.string   "provider",                                              null: false
    t.string   "uid",                                   default: "",    null: false
    t.text     "tokens"
    t.string   "pin_hash"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "authorized",                            default: false
    t.string   "spouse_first_name"
    t.string   "spouse_last_name"
    t.integer  "spouse_gender"
    t.date     "spouse_date_of_birth"
    t.string   "spouse_nationality"
    t.string   "spouse_tax_id"
    t.string   "spouse_phone_number"
    t.string   "nationality"
    t.boolean  "question_1",                            default: false
    t.boolean  "question_2",                            default: false
    t.boolean  "question_3",                            default: false
    t.boolean  "pending_authorization",                 default: false
    t.string   "personal_id"
    t.integer  "civil_status"
    t.datetime "signed_at"
    t.string   "signature_file_name"
    t.string   "signature_content_type"
    t.integer  "signature_file_size"
    t.datetime "signature_updated_at"
    t.boolean  "question_4",                            default: false
    t.boolean  "welcome_shown",                         default: false
    t.string   "photo_personal_id_front_file_name"
    t.string   "photo_personal_id_front_content_type"
    t.integer  "photo_personal_id_front_file_size"
    t.datetime "photo_personal_id_front_updated_at"
    t.string   "photo_personal_id_back_file_name"
    t.string   "photo_personal_id_back_content_type"
    t.integer  "photo_personal_id_back_file_size"
    t.datetime "photo_personal_id_back_updated_at"
    t.string   "photo_personal_id_selfie_file_name"
    t.string   "photo_personal_id_selfie_content_type"
    t.integer  "photo_personal_id_selfie_file_size"
    t.datetime "photo_personal_id_selfie_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
