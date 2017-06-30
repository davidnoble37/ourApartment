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

ActiveRecord::Schema.define(version: 20170629211512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "topic"
    t.bigint "topic_id"
    t.index ["topic_id"], name: "index_messages_on_topic_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "body"
    t.bigint "message_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "topic_id"
    t.index ["message_id"], name: "index_replies_on_message_id"
    t.index ["topic_id"], name: "index_replies_on_topic_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "subject"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.integer "apt_num"
    t.text "roommates"
    t.text "hobbies"
    t.text "fav_local"
    t.string "orig_home"
    t.integer "move_yr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url_file_name"
    t.string "photo_url_content_type"
    t.integer "photo_url_file_size"
    t.datetime "photo_url_updated_at"
  end

  add_foreign_key "messages", "topics"
  add_foreign_key "messages", "users"
  add_foreign_key "replies", "messages"
  add_foreign_key "replies", "topics"
  add_foreign_key "replies", "users"
  add_foreign_key "topics", "users"
end
