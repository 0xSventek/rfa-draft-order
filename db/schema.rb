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

ActiveRecord::Schema.define(version: 20140116152842) do

  create_table "mlb_game_scores", force: true do |t|
    t.integer  "team_1_id"
    t.integer  "team_2_id"
    t.integer  "team_1_score"
    t.integer  "team_2_score"
    t.string   "twitter_status_id"
    t.datetime "twitter_timestamp"
    t.boolean  "scanned",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mlb_game_scores", ["team_1_id"], name: "index_mlb_game_scores_on_team_1_id", using: :btree
  add_index "mlb_game_scores", ["team_2_id"], name: "index_mlb_game_scores_on_team_2_id", using: :btree
  add_index "mlb_game_scores", ["twitter_status_id"], name: "index_mlb_game_scores_on_twitter_status_id", using: :btree

  create_table "owners", force: true do |t|
    t.string   "name"
    t.string   "franchise"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "team_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["team_id"], name: "index_results_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "short_name"
    t.string   "color_1"
    t.string   "color_2"
    t.string   "color_3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "winning_scores", force: true do |t|
    t.integer  "team_id"
    t.integer  "mlb_game_score_id"
    t.datetime "twitter_timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "winning_scores", ["team_id"], name: "index_winning_scores_on_team_id", using: :btree

end
