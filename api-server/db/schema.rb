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

ActiveRecord::Schema.define(version: 2021_08_04_134804) do

  create_table "categories", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", limit: 20
  end

  create_table "comments", charset: "utf8", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "study_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "frameworks", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.string "type"
    t.integer "study_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "like_hisotries", charset: "utf8", force: :cascade do |t|
    t.integer "study_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participant_users", charset: "utf8", force: :cascade do |t|
    t.integer "study_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "studies", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "is_delete"
    t.datetime "due_date"
    t.integer "max_people"
    t.string "study_period_type"
    t.string "study_place_type"
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "study_skills", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "study_id", null: false
    t.integer "framework_id", null: false
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "nickname"
    t.string "role"
    t.string "is_delete"
    t.string "auth_token", limit: 225
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
