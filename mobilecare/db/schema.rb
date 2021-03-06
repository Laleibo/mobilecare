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

ActiveRecord::Schema.define(version: 20160814073335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_clouds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string   "appointment_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "wants_ride"
    t.boolean  "confirm_ride"
    t.boolean  "cancel_ride"
    t.float    "lattitude"
    t.float    "longitude"
    t.string   "pick_up_time"
    t.string   "eta"
    t.text     "note_to_driver"
    t.boolean  "return_ride"
    t.integer  "price_estimation"
    t.string   "request_id"
  end

  create_table "ubers", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
