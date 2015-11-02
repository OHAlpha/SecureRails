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

ActiveRecord::Schema.define(version: 20151101124552) do

  create_table "access_accounts", force: :cascade do |t|
    t.string   "account_name",                null: false
    t.string   "primary_email",               null: false
    t.string   "salta",                       null: false
    t.string   "saltb",                       null: false
    t.integer  "iterations",                  null: false
    t.string   "passhash",                    null: false
    t.integer  "permissions_override_add"
    t.integer  "permissions_override_remove"
    t.integer  "registered_ip",               null: false
    t.text     "registered_user_agent",       null: false
    t.integer  "must_validate",               null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "access_accounts", ["account_name"], name: "access_account_name_unique", unique: true
  add_index "access_accounts", ["primary_email"], name: "access_account_email_unique", unique: true

  create_table "access_auto_logins", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.string   "public_key",  null: false
    t.string   "private_key", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "access_auto_logins", ["private_key"], name: "access_autologin_private_index"
  add_index "access_auto_logins", ["public_key"], name: "access_autologin_public_index"
  add_index "access_auto_logins", ["user_id", "public_key"], name: "access_autologin_unique", unique: true
  add_index "access_auto_logins", ["user_id"], name: "access_autologin_to_user"

  create_table "access_banned_emails", force: :cascade do |t|
    t.string   "regex",      null: false
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "access_forced_group_ips", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.integer  "ip_low",     null: false
    t.integer  "ip_high",    null: false
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "access_group_memberships", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "access_group_memberships", ["group_id"], name: "access_group_member_to_group"
  add_index "access_group_memberships", ["user_id", "group_id"], name: "access_group_member_unique", unique: true
  add_index "access_group_memberships", ["user_id"], name: "access_group_member_to_user"

  create_table "access_groups", force: :cascade do |t|
    t.string   "group_name",  null: false
    t.integer  "permissions", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "access_groups", ["group_name"], name: "access_group_name_unique", unique: true

  create_table "access_login_attempts", force: :cascade do |t|
    t.string   "username",   null: false
    t.text     "passhash"
    t.integer  "login_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "access_logins", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "ip",            null: false
    t.text     "user_agent",    null: false
    t.integer  "auto_login_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "access_logins", ["auto_login_id"], name: "access_login_to_autologin"
  add_index "access_logins", ["user_id"], name: "access_login_to_user"

end
