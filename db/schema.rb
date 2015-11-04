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

ActiveRecord::Schema.define(version: 20151104104424) do

  create_table "articles", force: :cascade do |t|
    t.integer  "request_id"
    t.text     "text"
    t.text     "position"
    t.text     "transcription"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "lang"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translation_articles", force: :cascade do |t|
    t.integer "article_id"
    t.text    "text"
    t.text    "position"
    t.text    "gender"
    t.text    "animated"
    t.text    "synonym"
    t.text    "meaning"
    t.text    "example"
    t.text    "aspect"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "role"
    t.string   "email"
    t.string   "persistence_token"
    t.string   "password_salt"
    t.string   "crypted_password"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
