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

ActiveRecord::Schema.define(version: 20170921152357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coworkings", force: :cascade do |t|
    t.string   "title"
    t.string   "name"
    t.string   "address"
    t.string   "zip"
    t.string   "city"
    t.integer  "surface"
    t.integer  "workstation_number"
    t.text     "description"
    t.string   "special_offer"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "tv"
    t.boolean  "erp_room"
    t.boolean  "auditorium"
    t.boolean  "kitchen"
    t.boolean  "nap_zone"
    t.boolean  "terrace"
    t.boolean  "internet"
    t.boolean  "photocopier"
    t.boolean  "shower"
    t.boolean  "locker"
    t.boolean  "garden"
    t.boolean  "rj45_socket"
    t.boolean  "optical_fiber"
    t.boolean  "storage"
    t.boolean  "furniture"
    t.boolean  "ohp"
    t.boolean  "phone"
    t.boolean  "cooling_system"
    t.boolean  "alarm"
    t.boolean  "board"
    t.boolean  "computer"
    t.boolean  "waiting_room"
    t.boolean  "fax"
    t.boolean  "disabled_access"
    t.boolean  "bar"
    t.boolean  "lift"
    t.boolean  "common_space"
    t.boolean  "local_bike"
    t.boolean  "parking"
    t.boolean  "discretionnary_coffee"
    t.boolean  "cleaning_service"
    t.boolean  "welcome_desk_service"
    t.boolean  "mail_management_service"
    t.boolean  "office_supplies"
    t.index ["user_id"], name: "index_coworkings_on_user_id", using: :btree
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
    t.index ["user_id"], name: "index_demands_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "coworkings", "users"
  add_foreign_key "demands", "users"
end
