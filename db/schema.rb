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

ActiveRecord::Schema.define(version: 20140326173915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "seasons", force: true do |t|
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "composite"
    t.decimal  "avg_offense"
    t.decimal  "avg_defense"
    t.decimal  "win_pct"
    t.integer  "year_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "mascot"
    t.string   "stadium_name"
    t.string   "espn_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "years", id: false, force: true do |t|
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
