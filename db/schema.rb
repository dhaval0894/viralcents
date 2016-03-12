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

ActiveRecord::Schema.define(version: 20160310125504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.string   "original_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "twitter_users", force: :cascade do |t|
    t.string   "twitter_uid"
    t.string   "twitter_name"
    t.string   "twitter_oauth_token"
    t.string   "twitter_oauth_secret"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "provider"
    t.integer  "user_id"
  end

  create_table "user_stories", force: :cascade do |t|
    t.string   "short_url"
    t.integer  "clicks"
    t.integer  "fb_likes"
    t.integer  "fb_shares"
    t.integer  "fb_comments"
    t.integer  "fav"
    t.integer  "retweet"
    t.integer  "conversation"
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "notification_type"
    t.string   "email"
  end

  add_foreign_key "twitter_users", "users"
  add_foreign_key "user_stories", "stories"
  add_foreign_key "user_stories", "users"
end
