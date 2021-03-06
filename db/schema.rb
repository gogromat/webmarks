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

ActiveRecord::Schema.define(:version => 20121013220138) do

  create_table "linkages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "link_id"
    t.integer  "order",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "linkages", ["link_id"], :name => "index_linkages_on_link_id"
  add_index "linkages", ["user_id", "link_id"], :name => "index_linkages_on_user_id_and_link_id", :unique => true
  add_index "linkages", ["user_id"], :name => "index_linkages_on_user_id"

  create_table "links", :force => true do |t|
    t.string   "content"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "uri"
    t.string   "favicon_file_name"
    t.string   "favicon_content_type"
    t.integer  "favicon_file_size"
    t.datetime "favicon_updated_at"
  end

  add_index "links", ["content"], :name => "index_links_on_content"
  add_index "links", ["uri"], :name => "index_links_on_uri"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
