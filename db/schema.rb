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

ActiveRecord::Schema.define(version: 2020_04_19_220042) do

  create_table "actions", force: :cascade do |t|
    t.string "action_type"
    t.json "config"
    t.integer "criterion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["criterion_id"], name: "index_actions_on_criterion_id"
  end

  create_table "config_hashtags", force: :cascade do |t|
    t.text "hashtag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hashtag"], name: "index_config_hashtags_on_hashtag", unique: true
  end

  create_table "config_nth_user_tweets", force: :cascade do |t|
    t.string "username"
    t.integer "interval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username", "interval"], name: "index_config_nth_user_tweets_on_username_and_interval", unique: true
  end

  create_table "criteria", force: :cascade do |t|
    t.text "name"
    t.string "trigger_config_type"
    t.integer "trigger_config_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trigger_config_type", "trigger_config_id"], name: "index_criteria_on_trigger_config_type_and_trigger_config_id"
  end

  create_table "user_tweet_counters", force: :cascade do |t|
    t.string "username", null: false
    t.integer "tweet_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_user_tweet_counters_on_username", unique: true
  end

end
