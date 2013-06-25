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

ActiveRecord::Schema.define(:version => 20130625161219) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.integer  "designer_id"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "designers", :force => true do |t|
    t.text     "name",       :null => false
    t.text     "bio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "post_id"
    t.integer  "product_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "designer_id"
  end

  create_table "order_products", :force => true do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity"
  end

  create_table "orders", :force => true do |t|
    t.text     "name"
    t.text     "email"
    t.text     "country"
    t.text     "province"
    t.text     "city"
    t.text     "postal_code"
    t.text     "address"
    t.decimal  "amount",      :precision => 10, :scale => 0
    t.datetime "paid_on"
    t.datetime "shipped_on"
    t.datetime "canceled_on"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "title",                                  :null => false
    t.text     "body"
    t.datetime "published_at"
    t.text     "layout"
    t.text     "video_url"
    t.boolean  "on_bikes_featured",   :default => false, :null => false
    t.boolean  "on_bikes_watch_this", :default => false, :null => false
    t.boolean  "on_travel_remote",    :default => false, :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "product_sizes", :force => true do |t|
    t.integer "size_id"
    t.integer "product_id"
  end

  create_table "products", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.boolean  "available",                                      :default => true, :null => false
    t.decimal  "price",           :precision => 10, :scale => 0,                   :null => false
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "designer_id"
    t.string   "category"
    t.string   "type_of_product"
  end

  create_table "sizes", :force => true do |t|
    t.string  "label"
    t.integer "order"
  end

end
