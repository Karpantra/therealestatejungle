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

ActiveRecord::Schema.define(version: 20171028133748) do

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
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "duration"
    t.string   "status",              default: "pending"
    t.index ["coworking_id"], name: "index_briefs_on_coworking_id", using: :btree
    t.index ["user_id"], name: "index_briefs_on_user_id", using: :btree
  end

  create_table "briefs_contracts", id: false, force: :cascade do |t|
    t.integer "contract_id", null: false
    t.integer "brief_id",    null: false
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

  create_table "contacts", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "user_id"
    t.index ["owner_id"], name: "index_contacts_on_owner_id", using: :btree
    t.index ["user_id"], name: "index_contacts_on_user_id", using: :btree
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
    t.integer  "price_per_month"
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
    t.string   "phone"
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

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.string  "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree
  end

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.string   "notified_object_type"
    t.integer  "notified_object_id"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
    t.index ["type"], name: "index_mailboxer_notifications_on_type", using: :btree
  end

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_delivered",               default: false
    t.string   "delivery_method"
    t.string   "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree
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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "meeting_room_number"
    t.text     "other_spec"
    t.string   "status",                      default: "pending"
    t.index ["brief_id"], name: "index_propositions_on_brief_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "mond_start"
    t.string   "mond_end"
    t.string   "tue_start"
    t.string   "tue_end"
    t.string   "wed_start"
    t.string   "wed_end"
    t.string   "thu_start"
    t.string   "thu_end"
    t.string   "fri_start"
    t.string   "fri_end"
    t.string   "sat_start"
    t.string   "sat_end"
    t.string   "sun_start"
    t.string   "sun_end"
    t.boolean  "no_stop"
    t.integer  "coworking_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["coworking_id"], name: "index_schedules_on_coworking_id", using: :btree
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
    t.boolean  "email_confirmed",        default: false
    t.string   "confirm_token"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "briefs", "coworkings"
  add_foreign_key "briefs", "users"
  add_foreign_key "coworkings", "users"
  add_foreign_key "demands", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "propositions", "briefs"
  add_foreign_key "schedules", "coworkings"
end
