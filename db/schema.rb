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

ActiveRecord::Schema.define(version: 20200829065832) do

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "product_access", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "one_time_api_keys", force: true do |t|
    t.integer  "user_id"
    t.string   "one_time_api_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survay_responses", force: true do |t|
    t.string   "response"
    t.integer  "points"
    t.integer  "survay_id"
    t.text     "additional_info"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survays", force: true do |t|
    t.string   "title"
    t.text     "detail"
    t.integer  "total_points", default: 10
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "group_id"
    t.string   "api_token"
    t.string   "username"
    t.string   "full_name"
    t.integer  "role",                   default: 1
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
