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

ActiveRecord::Schema.define(version: 2020_12_10_125916) do

  create_table "influencers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "gendar"
    t.binary "icon", limit: 16777215
    t.string "twitter"
    t.string "instagram"
    t.string "youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "twitter_follower", limit: 3
    t.integer "instagram_follower", limit: 3
    t.integer "youtube_follower", limit: 3
    t.blob "header", limit: 255
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.binary "image", limit: 16777215
    t.string "distributor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "influencer_id"
    t.index ["influencer_id"], name: "index_products_on_influencer_id"
  end

  create_table "youtube_channels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "channel_id"
    t.string "header"
    t.string "icon"
    t.integer "subscriber"
    t.bigint "influencer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["influencer_id"], name: "index_youtube_channels_on_influencer_id"
  end

  create_table "youtube_videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "video_id"
    t.string "title"
    t.string "thumbnail"
    t.string "published_at"
    t.bigint "influencer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["influencer_id"], name: "index_youtube_videos_on_influencer_id"
  end

  add_foreign_key "products", "influencers"
  add_foreign_key "youtube_channels", "influencers"
  add_foreign_key "youtube_videos", "influencers"
end
