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

ActiveRecord::Schema.define(version: 20160409090719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recharge_stats", force: :cascade do |t|
    t.integer "pay_id"
    t.integer "recharge_id"
    t.float   "amount",      default: 0.0
  end

  create_table "recharges", force: :cascade do |t|
    t.string  "mobile"
    t.integer "user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.string   "orig_url"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_url"
    t.float    "click_amt",     default: 0.0
    t.float    "like_amt",      default: 0.0
    t.float    "share_amt",     default: 0.0
    t.float    "comment_amt",   default: 0.0
    t.float    "fav_amt",       default: 0.0
    t.float    "retweet_amt",   default: 0.0
    t.integer  "admin_user_id"
    t.string   "story_status",  default: "active"
    t.float    "total_budget"
    t.boolean  "published",     default: false
    t.string   "category"
    t.datetime "expiry_date"
    t.string   "status"
    t.integer  "category_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.float    "amt"
    t.datetime "trans_date"
    t.string   "type"
    t.integer  "user_id"
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
    t.integer  "clicks",       default: 0
    t.integer  "fb_likes",     default: 0
    t.integer  "fb_shares",    default: 0
    t.integer  "fb_comments",  default: 0
    t.integer  "retweets",     default: 0
    t.integer  "fav",          default: 0
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "fb_post_id"
    t.string   "tw_post_id"
    t.integer  "old_clicks",   default: 0
    t.integer  "old_likes",    default: 0
    t.integer  "old_shares",   default: 0
    t.integer  "old_comments", default: 0
    t.integer  "old_fav",      default: 0
    t.integer  "old_retweets", default: 0
  end

  create_table "user_transactions", force: :cascade do |t|
    t.float    "amt",        default: 0.0
    t.datetime "trans_date"
    t.string   "trans_type"
    t.integer  "user_id"
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
    t.string   "referrer"
    t.string   "referral_link"
  end

  create_table "wallets", force: :cascade do |t|
    t.float   "balance", default: 0.0
    t.integer "user_id"
  end

  add_foreign_key "recharge_stats", "recharges"
  add_foreign_key "recharges", "users"
  add_foreign_key "stories", "admin_users"
  add_foreign_key "stories", "categories"
  add_foreign_key "transactions", "users"
  add_foreign_key "twitter_users", "users"
  add_foreign_key "user_stories", "stories"
  add_foreign_key "user_stories", "users"
  add_foreign_key "user_transactions", "users"
  add_foreign_key "wallets", "users"
end
