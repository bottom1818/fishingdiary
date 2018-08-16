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

ActiveRecord::Schema.define(version: 20180816065822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caught_fishes", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "weight"
    t.string "tackle"
    t.string "bait"
    t.integer "caught_number"
    t.string "caught_time"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_options", force: :cascade do |t|
    t.string "weather"
    t.string "max_temperature"
    t.string "min_temperature"
    t.string "wind_speed"
    t.string "wind_direction"
    t.string "wave_height"
    t.string "location_latitude"
    t.string "location_longitude"
    t.string "tide"
    t.string "first_low_tide"
    t.string "first_high_tide"
    t.string "second_low_tide"
    t.string "second_high_tide"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "spot_name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "method"
    t.string "tackle"
    t.string "bait"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "target"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "event_id"], name: "index_favorites_on_user_id_and_event_id", unique: true
  end

  create_table "fish_images", force: :cascade do |t|
    t.text "image"
    t.integer "event_id"
    t.integer "caught_fish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
