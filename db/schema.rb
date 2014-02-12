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

ActiveRecord::Schema.define(version: 20140211234049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: true do |t|
    t.string   "header"
    t.string   "subheader"
    t.text     "text"
    t.string   "image_url"
    t.string   "image_align"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "position"
    t.string   "header"
  end

  add_index "pages", ["site_id"], name: "index_pages_on_site_id", using: :btree

  create_table "sites", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.text     "phone"
    t.text     "fax"
    t.text     "facebook_url"
    t.text     "twitter"
    t.text     "google_plus_url"
    t.string   "stylesheet_name"
    t.string   "logo_url"
    t.string   "email"
    t.string   "header_type"
    t.string   "footer_type"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "reset_password_token"
    t.string   "session_token"
    t.boolean  "admin",                default: false
    t.boolean  "super_admin",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.string   "title"
    t.text     "bio"
    t.string   "image_url"
  end

  add_index "users", ["site_id"], name: "index_users_on_site_id", using: :btree

end
