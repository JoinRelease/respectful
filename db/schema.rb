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

ActiveRecord::Schema.define(version: 20150823033919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree
  add_index "addresses", ["addressable_type"], name: "index_addresses_on_addressable_type", using: :btree

  create_table "burial_cemetery_plans", force: :cascade do |t|
    t.string   "cemetery_section"
    t.string   "cemetery_section_name"
    t.string   "liner_vault_preference"
    t.string   "headstone_preference"
    t.string   "double_plot"
    t.string   "type_of_double_plot"
    t.integer  "burial_plan_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "burial_cemetery_plans", ["burial_plan_id"], name: "index_burial_cemetery_plans_on_burial_plan_id", using: :btree

  create_table "burial_mausoleum_plans", force: :cascade do |t|
    t.string   "type_of_mausoleum"
    t.string   "mausoleum_section"
    t.string   "mausoleum_section_name"
    t.string   "height"
    t.string   "double_plot"
    t.integer  "burial_plan_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "burial_mausoleum_plans", ["burial_plan_id"], name: "index_burial_mausoleum_plans_on_burial_plan_id", using: :btree

  create_table "burial_plans", force: :cascade do |t|
    t.boolean  "public_service"
    t.boolean  "open_casket"
    t.boolean  "private_viewing"
    t.boolean  "religious_cultural_service"
    t.string   "religion_culture_type"
    t.string   "type_of_service_space"
    t.boolean  "worship_space_in_mind"
    t.string   "worship_space"
    t.boolean  "burial_space_in_mind"
    t.boolean  "burial_space_owned"
    t.boolean  "completed"
    t.boolean  "sent"
    t.integer  "passing_id"
    t.datetime "completed_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "burial_plans", ["passing_id"], name: "index_burial_plans_on_passing_id", using: :btree

  create_table "cremation_plans", force: :cascade do |t|
    t.boolean  "public_service"
    t.boolean  "open_casket"
    t.boolean  "private_viewing"
    t.boolean  "religious_cultural_service"
    t.string   "religion_culture_type"
    t.string   "type_of_service_space"
    t.boolean  "worship_space_in_mind"
    t.string   "worship_space"
    t.boolean  "present_during_cremation"
    t.string   "place_of_ash_storage"
    t.boolean  "ash_storage_space_in_mind"
    t.boolean  "ash_storage_space_owned"
    t.string   "ash_transit_type"
    t.boolean  "completed"
    t.boolean  "sent"
    t.integer  "passing_id"
    t.datetime "completed_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "cremation_plans", ["passing_id"], name: "index_cremation_plans_on_passing_id", using: :btree

  create_table "cultures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relation"
    t.date     "date_of_birth"
    t.date     "date_of_passing"
    t.string   "location_of_passing"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "passings", ["user_id"], name: "index_passings_on_user_id", using: :btree

  create_table "plan_dates", force: :cascade do |t|
    t.datetime "date"
    t.integer  "dateable_id"
    t.string   "dateable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "religions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.boolean  "registered",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "worship_spaces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "burial_cemetery_plans", "burial_plans"
  add_foreign_key "burial_mausoleum_plans", "burial_plans"
  add_foreign_key "burial_plans", "passings"
  add_foreign_key "cremation_plans", "passings"
  add_foreign_key "passings", "users"
end
