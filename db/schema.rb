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

ActiveRecord::Schema.define(version: 2021_07_25_202654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_assignees", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_assignees_on_event_id"
    t.index ["user_id"], name: "index_event_assignees_on_user_id"
  end

  create_table "event_managers", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_managers_on_event_id"
    t.index ["user_id"], name: "index_event_managers_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "is_full_event", default: false
    t.boolean "is_recurring", default: false
    t.json "recurrence", default: {}
    t.integer "creator_id"
    t.integer "parent_event_id"
    t.string "eventable_type"
    t.bigint "eventable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eventable_type", "eventable_id"], name: "index_events_on_eventable"
  end

  create_table "homework_rooms", force: :cascade do |t|
    t.bigint "homework_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homework_id"], name: "index_homework_rooms_on_homework_id"
    t.index ["room_id"], name: "index_homework_rooms_on_room_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "room_connections", id: false, force: :cascade do |t|
    t.integer "parent_room_id"
    t.integer "child_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "surname"
    t.date "birth_date"
    t.integer "sex"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_assignees", "events"
  add_foreign_key "event_assignees", "users"
  add_foreign_key "event_managers", "events"
  add_foreign_key "event_managers", "users"
  add_foreign_key "homework_rooms", "homeworks"
  add_foreign_key "homework_rooms", "rooms"
end
