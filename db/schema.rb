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

ActiveRecord::Schema.define(version: 20141106155602) do

  create_table "events", force: true do |t|
    t.string   "event"
    t.string   "evnt_discr"
    t.date     "evt_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_users", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "events_users_join_tables", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events_users_join_tables", ["event_id", "user_id"], name: "index_events_users_join_tables_on_event_id_and_user_id", unique: true
  add_index "events_users_join_tables", ["event_id"], name: "index_events_users_join_tables_on_event_id"
  add_index "events_users_join_tables", ["user_id"], name: "index_events_users_join_tables_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["event_id", "user_id"], name: "index_relationships_on_event_id_and_user_id", unique: true
  add_index "relationships", ["event_id"], name: "index_relationships_on_event_id"
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id"

  create_table "users", force: true do |t|
    t.string   "Email"
    t.string   "Name"
    t.string   "Gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
