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

ActiveRecord::Schema.define(version: 2021_07_02_145603) do

  create_table "host_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "position", null: false
    t.binary "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_host_users_on_user_id"
  end

  create_table "requests", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "message", null: false
    t.boolean "isChecked"
    t.integer "good"
    t.binary "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "request_id", null: false
    t.bigint "hostUser_id", null: false
    t.text "comment"
    t.boolean "isAccepted", null: false
    t.boolean "isDone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hostUser_id"], name: "index_tasks_on_hostUser_id"
    t.index ["request_id"], name: "index_tasks_on_request_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "host_users", "users"
end