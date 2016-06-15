# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160615190722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prompts", force: :cascade do |t|
    t.string   "word",           null: false
    t.string   "part_of_speech", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "prompts", ["word"], name: "index_prompts_on_word", unique: true, using: :btree

  create_table "stories", force: :cascade do |t|
    t.integer  "current_user_id",                     null: false
    t.string   "prompt",                              null: false
    t.string   "title",                               null: false
    t.string   "status",          default: "pending", null: false
    t.integer  "sentences_left",  default: 10,        null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "stories", ["current_user_id"], name: "index_stories_on_current_user_id", unique: true, using: :btree

  create_table "user_games", force: :cascade do |t|
    t.integer  "story_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_games", ["story_id"], name: "index_user_games_on_story_id", using: :btree
  add_index "user_games", ["user_id"], name: "index_user_games_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "session_token",   null: false
    t.string   "password_digest", null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.date     "dob",             null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
