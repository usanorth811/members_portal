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

ActiveRecord::Schema.define(version: 2019_07_17_174151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "billing"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "billing_contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "addr"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_billing_contacts_on_company_id"
  end

  create_table "codes", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "facility_type"
    t.string "destination"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "billing"
    t.index ["company_id"], name: "index_codes_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "billing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "member_type"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "contact_type"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.bigint "code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "billing"
    t.index ["code_id"], name: "index_contacts_on_code_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "billing_id"
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_groups_on_company_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "member_contacts", force: :cascade do |t|
    t.string "name"
    t.string "ip"
    t.string "member_id"
    t.string "member_code"
    t.string "contact_id"
    t.string "contact_type"
    t.string "company"
    t.string "contact_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "phone_ext"
    t.string "email"
    t.string "group_id"
    t.string "stype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_reps", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "addr"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_member_reps_on_company_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "employer"
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "billing_contacts", "companies"
  add_foreign_key "codes", "companies"
  add_foreign_key "contacts", "codes"
  add_foreign_key "groups", "companies"
  add_foreign_key "groups", "users"
  add_foreign_key "member_reps", "companies"
  add_foreign_key "profiles", "users"
end
