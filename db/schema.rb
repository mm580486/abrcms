# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_07_150849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "postmeta", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.string "key", null: false
    t.text "value", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_postmeta_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", default: ""
    t.text "content", default: ""
    t.text "excerpt"
    t.string "status"
    t.integer "comment_status"
    t.string "password"
    t.string "permalink", null: false
    t.string "post_type", null: false
    t.bigint "comment_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "key", null: false
    t.text "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usermeta", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "key", null: false
    t.text "value", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_usermeta_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "password_digest"
    t.string "nicname"
    t.string "email", null: false
    t.string "url"
    t.string "activation_key"
    t.string "display_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "postmeta", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "usermeta", "users"
end
