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

ActiveRecord::Schema.define(version: 20130712232220) do

  create_table "filters", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "web_property_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_imported"
  end

  add_index "filters", ["user_id"], name: "index_filters_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expires_at"
    t.string   "refresh_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["uid"], name: "index_users_on_uid"

  create_table "visits", force: true do |t|
    t.integer  "filter_id"
    t.string   "path"
    t.integer  "pageviews"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["filter_id"], name: "index_visits_on_filter_id"

end
