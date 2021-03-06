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

ActiveRecord::Schema.define(version: 2019_07_18_211617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_details", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.integer "menu_kind", null: false
    t.integer "times", null: false
    t.integer "interval", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "distance", null: false
    t.index ["workout_id"], name: "index_workout_details_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date", null: false
    t.string "kind", null: false
    t.datetime "timestamps", null: false
    t.text "impression"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "workout_details", "workouts"
  add_foreign_key "workouts", "users"
end
