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

ActiveRecord::Schema.define(version: 20161227191456) do

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "city_user_details", force: :cascade do |t|
    t.integer  "city_id",        limit: 4
    t.integer  "user_detail_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "city_user_details", ["city_id"], name: "index_city_user_details_on_city_id", using: :btree
  add_index "city_user_details", ["user_detail_id"], name: "index_city_user_details_on_user_detail_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "localities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "status",     limit: 4,   default: 1
  end

  add_index "localities", ["city_id"], name: "index_localities_on_city_id", using: :btree

  create_table "locality_user_details", force: :cascade do |t|
    t.integer  "locality_id",    limit: 4
    t.integer  "user_detail_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "locality_user_details", ["locality_id"], name: "index_locality_user_details_on_locality_id", using: :btree
  add_index "locality_user_details", ["user_detail_id"], name: "index_locality_user_details_on_user_detail_id", using: :btree

  create_table "request_volunteers", force: :cascade do |t|
    t.integer  "request_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "priority",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "request_volunteers", ["request_id"], name: "index_request_volunteers_on_request_id", using: :btree
  add_index "request_volunteers", ["user_id"], name: "index_request_volunteers_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.string   "exam",        limit: 255
    t.string   "subject",     limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "address",     limit: 255
    t.string   "note",        limit: 255
    t.integer  "state",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",     limit: 4
    t.integer  "city_id",     limit: 4
    t.integer  "language_id", limit: 4
    t.integer  "locality_id", limit: 4
  end

  add_index "requests", ["city_id"], name: "index_requests_on_city_id", using: :btree
  add_index "requests", ["language_id"], name: "index_requests_on_language_id", using: :btree
  add_index "requests", ["locality_id"], name: "index_requests_on_locality_id", using: :btree
  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "user_details", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.integer  "gender",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "phone_no",   limit: 255
  end

  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id", using: :btree

  create_table "user_otps", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "otp",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_otps", ["user_id"], name: "index_user_otps_on_user_id", using: :btree

  create_table "user_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_type_id",           limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree

  add_foreign_key "localities", "cities"
  add_foreign_key "request_volunteers", "requests"
  add_foreign_key "request_volunteers", "users"
  add_foreign_key "requests", "cities"
  add_foreign_key "requests", "languages"
  add_foreign_key "requests", "localities"
  add_foreign_key "requests", "users"
  add_foreign_key "user_details", "users"
  add_foreign_key "user_otps", "users"
  add_foreign_key "users", "user_types"
end
