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

ActiveRecord::Schema.define(version: 20150724181732) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ticker"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financial_data", force: true do |t|
    t.float    "stock_price"
    t.date     "data_date"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "smarties", force: true do |t|
    t.integer  "customer_id"
    t.text     "description"
    t.string   "analysis"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "timestamp"
  end

  create_table "twitter_data", force: true do |t|
    t.integer  "company_id"
    t.date     "data_date"
    t.integer  "favorites"
    t.integer  "retweets"
    t.integer  "followers"
    t.float    "polarity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "role"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
