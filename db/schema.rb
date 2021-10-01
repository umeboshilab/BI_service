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

ActiveRecord::Schema.define(version: 2021_10_01_101710) do

  create_table "groups", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_groups_on_code", unique: true
  end

  create_table "host_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "position", default: "管理者", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_host_users_on_user_id"
  end

  create_table "requests", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "message", null: false
    t.boolean "isChecked", default: false, null: false
    t.integer "good", default: 0, null: false
    t.binary "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_requests_on_group_id"
  end

  create_table "tasks", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "request_id", null: false
    t.bigint "host_user_id", null: false
    t.text "comment", null: false
    t.boolean "isAccepted", null: false
    t.boolean "isDone", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_tasks_on_group_id"
    t.index ["host_user_id"], name: "index_tasks_on_host_user_id"
    t.index ["request_id"], name: "index_tasks_on_request_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  add_foreign_key "host_users", "users"
  add_foreign_key "requests", "groups"
  add_foreign_key "tasks", "groups"
end
