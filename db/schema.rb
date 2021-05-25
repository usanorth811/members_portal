# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_24_173320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

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
    t.string "stype"
    t.string "code"
    t.string "contact_type"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
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

  create_table "codestatuses", force: :cascade do |t|
    t.string "code"
    t.boolean "sar_updated"
    t.boolean "contacts_updated"
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_codestatuses_on_group_id"
    t.index ["user_id"], name: "index_codestatuses_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "billing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "member_type"
  end

  create_table "concerned_citizen_tickets", force: :cascade do |t|
    t.string "first"
    t.string "last"
    t.string "email"
    t.string "state"
    t.string "city"
    t.string "zip"
    t.string "address"
    t.text "description"
    t.boolean "notify_citizen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ticket_type"
    t.string "street"
    t.string "cross_st"
    t.string "county"
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

  create_table "deliveries", force: :cascade do |t|
    t.string "billing"
    t.string "member_code"
    t.bigint "group_id", null: false
    t.string "delivery_type"
    t.string "deliver_to"
    t.string "email"
    t.string "phone"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ticket_type"
    t.string "county"
    t.index ["group_id"], name: "index_deliveries_on_group_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "old_destination"
    t.string "new_destination"
    t.string "code"
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_destinations_on_group_id"
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "billing_id"
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
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
    t.string "billing"
  end

  create_table "member_details", force: :cascade do |t|
    t.string "name"
    t.string "member_id"
    t.string "member_code"
    t.string "stype"
    t.string "group_code"
    t.string "company"
    t.string "description"
    t.string "facility"
    t.string "active"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_member_details_on_group_id"
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

  create_table "notifications", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "delivery_id", null: false
    t.bigint "concerned_citizen_ticket_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["concerned_citizen_ticket_id"], name: "index_notifications_on_concerned_citizen_ticket_id"
    t.index ["delivery_id"], name: "index_notifications_on_delivery_id"
    t.index ["group_id"], name: "index_notifications_on_group_id"
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
  add_foreign_key "codestatuses", "groups"
  add_foreign_key "codestatuses", "users"
  add_foreign_key "contacts", "codes"
  add_foreign_key "deliveries", "groups"
  add_foreign_key "destinations", "groups"
  add_foreign_key "destinations", "users"
  add_foreign_key "groups", "companies"
  add_foreign_key "groups", "users"
  add_foreign_key "member_details", "groups"
  add_foreign_key "member_reps", "companies"
  add_foreign_key "notifications", "concerned_citizen_tickets"
  add_foreign_key "notifications", "deliveries"
  add_foreign_key "notifications", "groups"
  add_foreign_key "profiles", "users"
end
