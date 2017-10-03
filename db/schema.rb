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

ActiveRecord::Schema.define(version: 20171003141225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "briefs", force: :cascade do |t|
    t.string   "company_name"
    t.integer  "surface"
    t.integer  "workstation_number"
    t.integer  "meeting_room_number"
    t.integer  "parking_number"
    t.string   "move_in_date"
    t.text     "other_spec"
    t.integer  "user_id"
    t.integer  "coworking_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "duration"
    t.index ["coworking_id"], name: "index_briefs_on_coworking_id", using: :btree
    t.index ["user_id"], name: "index_briefs_on_user_id", using: :btree
  end

  create_table "briefs_surfaces", id: false, force: :cascade do |t|
    t.integer "surface_id", null: false
    t.integer "brief_id",   null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_coworkings", id: false, force: :cascade do |t|
    t.integer "category_id",  null: false
    t.integer "coworking_id", null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts_coworkings", id: false, force: :cascade do |t|
    t.integer "contract_id",  null: false
    t.integer "coworking_id", null: false
  end

  create_table "coworkings", force: :cascade do |t|
    t.string   "title"
    t.string   "name"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.integer  "surface"
    t.integer  "workstation_number"
    t.text     "description"
    t.string   "special_offer"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "price_per_month",                 null: false
    t.integer  "price_per_workstation_per_month"
    t.integer  "price_per_workstation_per_week"
    t.integer  "price_per_workstation_per_day"
    t.integer  "price_per_workstation_per_hour"
    t.index ["user_id"], name: "index_coworkings_on_user_id", using: :btree
  end

  create_table "coworkings_landlords", id: false, force: :cascade do |t|
    t.integer "landlord_id",  null: false
    t.integer "coworking_id", null: false
  end

  create_table "coworkings_types", id: false, force: :cascade do |t|
    t.integer "type_id",      null: false
    t.integer "coworking_id", null: false
  end

  create_table "demands", force: :cascade do |t|
    t.boolean  "lease"
    t.boolean  "buy"
    t.string   "company_name"
    t.integer  "lease_budget"
    t.string   "location_1"
    t.integer  "surface"
    t.integer  "workstation_number"
    t.integer  "meeting_room_number"
    t.integer  "parking_number"
    t.string   "surface_type"
    t.string   "move_in_date"
    t.text     "other_spec"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "buy_budget"
    t.integer  "user_id"
    t.string   "location_2"
    t.string   "location_3"
    t.integer  "duration"
    t.index ["user_id"], name: "index_demands_on_user_id", using: :btree
  end

  create_table "demands_occupations", id: false, force: :cascade do |t|
    t.integer "occupation_id", null: false
    t.integer "demand_id",     null: false
  end

  create_table "demands_surfaces", id: false, force: :cascade do |t|
    t.integer "surface_id", null: false
    t.integer "demand_id",  null: false
  end

  create_table "equipments", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlords", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "chat_room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "read_at"
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "occupations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "propositions", force: :cascade do |t|
    t.integer  "workstation_number"
    t.integer  "office_surface"
    t.integer  "storage_surface"
    t.integer  "parking_number"
    t.string   "lease_start"
    t.string   "mad_start"
    t.integer  "office_charge_per_sqm"
    t.integer  "office_rent_per_sqm"
    t.integer  "office_taxe_per_sqm"
    t.integer  "office_teom_per_sqm"
    t.integer  "workstation_price_per_month"
    t.integer  "workstation_price_per_day"
    t.integer  "workstation_price_per_hour"
    t.integer  "storage_price_per_sqm"
    t.integer  "parking_price_per_unit"
    t.string   "indexation"
    t.boolean  "fiscal_status"
    t.integer  "deposit"
    t.integer  "lease_duration"
    t.integer  "fitout_allowance_in_month"
    t.integer  "free_rent_in_month"
    t.integer  "brief_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["brief_id"], name: "index_propositions_on_brief_id", using: :btree
  end

  create_table "surfaces", force: :cascade do |t|
    t.string   "name"
    t.string   "space"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
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
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "phone_number"
    t.boolean  "admin",                  default: false
    t.boolean  "owner"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "briefs", "coworkings"
  add_foreign_key "briefs", "users"
  add_foreign_key "coworkings", "users"
  add_foreign_key "demands", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "propositions", "briefs"
end
