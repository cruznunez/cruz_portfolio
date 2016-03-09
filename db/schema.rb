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

ActiveRecord::Schema.define(version: 20160309160441) do

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "additional_information"
    t.string   "repo_url"
    t.string   "live_site"
    t.integer  "order"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects_technologies", force: :cascade do |t|
    t.integer "project_id"
    t.integer "technology_id"
  end

  add_index "projects_technologies", ["project_id"], name: "index_projects_technologies_on_project_id"
  add_index "projects_technologies", ["technology_id"], name: "index_projects_technologies_on_technology_id"

  create_table "sites", force: :cascade do |t|
    t.string "color"
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.string   "long_name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
