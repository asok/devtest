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

ActiveRecord::Schema.define(version: 20160208171758) do

  create_table "api_keys", force: :cascade do |t|
    t.text     "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "api_keys", ["token"], name: "index_api_keys_on_token"

  create_table "countries", force: :cascade do |t|
    t.string   "country_code"
    t.integer  "panel_provider_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "countries", ["panel_provider_id"], name: "index_countries_on_panel_provider_id"

  create_table "countries_target_groups", id: false, force: :cascade do |t|
    t.integer "target_group_id", null: false
    t.integer "country_id",      null: false
  end

  create_table "location_groups", force: :cascade do |t|
    t.text     "name"
    t.integer  "country_id"
    t.integer  "panel_provider_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "location_groups", ["country_id"], name: "index_location_groups_on_country_id"
  add_index "location_groups", ["panel_provider_id"], name: "index_location_groups_on_panel_provider_id"

  create_table "location_groups_locations", id: false, force: :cascade do |t|
    t.integer "location_id",       null: false
    t.integer "location_group_id", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.text     "name"
    t.text     "external_id"
    t.text     "secret_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "panel_providers", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "evaluation_type"
  end

  create_table "target_groups", force: :cascade do |t|
    t.text     "name"
    t.text     "external_id"
    t.integer  "parent_id"
    t.text     "secret_code"
    t.integer  "panel_provider_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "target_groups", ["panel_provider_id"], name: "index_target_groups_on_panel_provider_id"
  add_index "target_groups", ["parent_id"], name: "index_target_groups_on_parent_id"

end
