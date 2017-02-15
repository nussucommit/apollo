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

ActiveRecord::Schema.define(version: 20170214141037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.datetime "start"
    t.datetime "end"
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "mc_only",       null: false
    t.integer  "day",           null: false
    t.integer  "user_id",       null: false
    t.integer  "time_range_id", null: false
    t.integer  "place_id",      null: false
    t.index ["place_id"], name: "index_timeslots_on_place_id", using: :btree
    t.index ["time_range_id"], name: "index_timeslots_on_time_range_id", using: :btree
    t.index ["user_id"], name: "index_timeslots_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "username",      null: false
    t.string   "name",          null: false
    t.string   "email",         null: false
    t.string   "matric_number", null: false
    t.string   "phone_number",  null: false
    t.string   "cell",          null: false
    t.string   "position",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["matric_number"], name: "index_users_on_matric_number", unique: true, using: :btree
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "duties", "timeslots"
  add_foreign_key "duties", "users"
  add_foreign_key "timeslots", "places"
  add_foreign_key "timeslots", "time_ranges"
  add_foreign_key "timeslots", "users"
end
