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

ActiveRecord::Schema.define(version: 20170221040300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "contents",   null: false
    t.datetime "date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "duties", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "date",        null: false
    t.integer  "timeslot_id", null: false
    t.integer  "user_id"
    t.index ["timeslot_id"], name: "index_duties_on_timeslot_id", using: :btree
    t.index ["user_id"], name: "index_duties_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name",       null: false
    t.index ["name"], name: "index_places_on_name", unique: true, using: :btree
  end

  create_table "time_ranges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time     "start_time", null: false
    t.time     "end_time",   null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "mc_only",         null: false
    t.integer  "day",             null: false
    t.integer  "default_user_id", null: false
    t.integer  "time_range_id",   null: false
    t.integer  "place_id",        null: false
    t.index ["default_user_id"], name: "index_timeslots_on_default_user_id", using: :btree
    t.index ["place_id"], name: "index_timeslots_on_place_id", using: :btree
    t.index ["time_range_id"], name: "index_timeslots_on_time_range_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username",                            null: false
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "matric_number",                       null: false
    t.string   "phone_number",                        null: false
    t.string   "cell",                                null: false
    t.string   "position",                            null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["matric_number"], name: "index_users_on_matric_number", unique: true, using: :btree
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "duties", "timeslots"
  add_foreign_key "duties", "users"
  add_foreign_key "timeslots", "places"
  add_foreign_key "timeslots", "time_ranges"
  add_foreign_key "timeslots", "users", column: "default_user_id"
end
