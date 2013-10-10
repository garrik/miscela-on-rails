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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130930171245) do

  create_table "articles", :force => true do |t|
    t.string   "author"
    t.string   "title"
    t.text     "content"
    t.boolean  "draft",      :default => true
    t.string   "permalink"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "band_members", :force => true do |t|
    t.integer  "subscription_id"
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "phone"
    t.integer  "rank"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "subscriptions", :force => true do |t|
    t.string   "event",                   :null => false
    t.string   "userid",                  :null => false
    t.string   "email"
    t.string   "name"
    t.string   "band_name"
    t.integer  "band_members_number"
    t.string   "genre"
    t.string   "city"
    t.text     "notes"
    t.string   "website"
    t.string   "website2"
    t.string   "video_link"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "song1_file_name"
    t.string   "song1_content_type"
    t.integer  "song1_file_size"
    t.datetime "song1_updated_at"
    t.string   "song2_file_name"
    t.string   "song2_content_type"
    t.integer  "song2_file_size"
    t.datetime "song2_updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "userid"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["userid"], :name => "index_users_on_userid", :unique => true

end
