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

ActiveRecord::Schema.define(version: 20150328224730) do

  create_table "chapters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "api_key"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.date     "renewal_due"
    t.datetime "created_on"
    t.integer  "external_id"
  end

  add_index "chapters", ["external_id"], name: "index_chapters_on_external_id", unique: true
  add_index "chapters", ["user_id"], name: "index_chapters_on_user_id"

  create_table "parents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parents", ["user_id"], name: "index_parents_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_key"
    t.string   "access_token"
    t.integer  "account_id"
    t.string   "refresh_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
