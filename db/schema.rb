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

  add_index "access_accounts", ["account_name"], name: "index_access_accounts_on_account_name", unique: true
  add_index "access_accounts", ["primary_email"], name: "index_access_accounts_on_primary_email", unique: true

  create_table "access_auto_logins", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.string   "public_key",  null: false
    t.string   "private_key", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "access_auto_logins", ["private_key"], name: "index_access_auto_logins_on_private_key"
  add_index "access_auto_logins", ["public_key"], name: "index_access_auto_logins_on_public_key"
  add_index "access_auto_logins", ["user_id", "public_key"], name: "index_access_auto_logins_on_user_id_and_public_key", unique: true

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

  add_index "access_group_memberships", ["user_id", "group_id"], name: "index_access_group_memberships_on_user_id_and_group_id", unique: true

  create_table "access_groups", force: :cascade do |t|
    t.string   "group_name",  null: false
    t.integer  "permissions", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "access_groups", ["group_name"], name: "index_access_groups_on_group_name", unique: true

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

end
