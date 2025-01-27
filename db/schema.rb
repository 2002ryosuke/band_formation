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

ActiveRecord::Schema[7.0].define(version: 2025_01_11_105016) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "band_requests", force: :cascade do |t|
    t.string "name"
    t.string "music_name"
    t.integer "playing_time"
    t.bigint "my_category_id"
    t.bigint "recruting_category_id"
    t.integer "count"
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_band_requests_on_event_id"
    t.index ["my_category_id"], name: "index_band_requests_on_my_category_id"
    t.index ["recruting_category_id"], name: "index_band_requests_on_recruting_category_id"
    t.index ["user_id"], name: "index_band_requests_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_users", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.datetime "participated_at"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_users_on_event_id"
    t.index ["user_id"], name: "index_event_users_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "day"
    t.string "place"
    t.integer "min_bans"
    t.integer "max_bans"
    t.text "comment"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "random_number"
    t.index ["random_number"], name: "index_events_on_random_number", unique: true
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.bigint "band_request_id", null: false
    t.bigint "participation_requsest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_request_id"], name: "index_interests_on_band_request_id"
    t.index ["participation_requsest_id"], name: "index_interests_on_participation_requsest_id"
  end

  create_table "participation_requsests", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "band_request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_request_id"], name: "index_participation_requsests_on_band_request_id"
    t.index ["category_id"], name: "index_participation_requsests_on_category_id"
    t.index ["user_id"], name: "index_participation_requsests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "band_requests", "categories", column: "my_category_id"
  add_foreign_key "band_requests", "categories", column: "recruting_category_id"
  add_foreign_key "band_requests", "events"
  add_foreign_key "band_requests", "users"
  add_foreign_key "event_users", "events"
  add_foreign_key "event_users", "users"
  add_foreign_key "events", "users"
  add_foreign_key "interests", "band_requests"
  add_foreign_key "interests", "participation_requsests"
  add_foreign_key "participation_requsests", "band_requests"
  add_foreign_key "participation_requsests", "categories"
  add_foreign_key "participation_requsests", "users"
end
