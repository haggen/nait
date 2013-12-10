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

ActiveRecord::Schema.define(version: 20131207030509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "author_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["created_at"], name: "index_comments_on_created_at", using: :btree

  create_table "entries", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "estimate"
    t.integer  "author_id"
    t.integer  "project_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["author_id"], name: "index_entries_on_author_id", using: :btree
  add_index "entries", ["project_id"], name: "index_entries_on_project_id", using: :btree
  add_index "entries", ["status_id"], name: "index_entries_on_status_id", using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["project_id"], name: "index_memberships_on_project_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.hstore   "options"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["manager_id"], name: "index_projects_on_manager_id", using: :btree

  create_table "statuses", force: true do |t|
    t.integer  "sort"
    t.string   "name"
    t.string   "color"
    t.boolean  "closing",    default: false
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statuses", ["project_id"], name: "index_statuses_on_project_id", using: :btree
  add_index "statuses", ["sort"], name: "index_statuses_on_sort", using: :btree

  create_table "time_records", force: true do |t|
    t.date     "date"
    t.float    "value"
    t.integer  "author_id"
    t.integer  "entry_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_records", ["author_id"], name: "index_time_records_on_author_id", using: :btree
  add_index "time_records", ["entry_id"], name: "index_time_records_on_entry_id", using: :btree
  add_index "time_records", ["project_id"], name: "index_time_records_on_project_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.hstore   "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
