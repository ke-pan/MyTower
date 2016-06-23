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

ActiveRecord::Schema.define(version: 20160623015137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "owned",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "accesses", ["project_id"], name: "index_accesses_on_project_id", using: :btree
  add_index "accesses", ["user_id"], name: "index_accesses_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "todo_id"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "author_id"
  end

  add_index "comments", ["slug"], name: "index_comments_on_slug", unique: true, using: :btree
  add_index "comments", ["todo_id"], name: "index_comments_on_todo_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "project_name",     null: false
    t.string   "project_path",     null: false
    t.string   "resource_name",    null: false
    t.string   "resource_path",    null: false
    t.string   "description",      null: false
    t.string   "user_name",        null: false
    t.string   "user_path",        null: false
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "subresource"
    t.string   "subresource_path"
  end

  add_index "events", ["created_at"], name: "index_events_on_created_at", using: :btree
  add_index "events", ["team_id"], name: "index_events_on_team_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree
  add_index "projects", ["team_id"], name: "index_projects_on_team_id", using: :btree

  create_table "team_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "role",       default: 0, null: false
  end

  add_index "team_memberships", ["team_id"], name: "index_team_memberships_on_team_id", using: :btree
  add_index "team_memberships", ["user_id"], name: "index_team_memberships_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["slug"], name: "index_teams_on_slug", unique: true, using: :btree

  create_table "todos", force: :cascade do |t|
    t.string   "title",                   null: false
    t.text     "description"
    t.string   "slug",                    null: false
    t.integer  "project_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.datetime "deleted_at"
    t.integer  "user_id"
    t.integer  "status",      default: 0, null: false
  end

  add_index "todos", ["deleted_at"], name: "index_todos_on_deleted_at", using: :btree
  add_index "todos", ["project_id"], name: "index_todos_on_project_id", using: :btree
  add_index "todos", ["slug"], name: "index_todos_on_slug", unique: true, using: :btree
  add_index "todos", ["user_id"], name: "index_todos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "slug",            null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  add_foreign_key "accesses", "projects"
  add_foreign_key "accesses", "users"
  add_foreign_key "comments", "todos"
  add_foreign_key "events", "teams"
  add_foreign_key "events", "users"
  add_foreign_key "projects", "teams"
  add_foreign_key "team_memberships", "teams"
  add_foreign_key "team_memberships", "users"
  add_foreign_key "todos", "projects"
  add_foreign_key "todos", "users"
end
