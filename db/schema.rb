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

ActiveRecord::Schema.define(version: 2020_12_18_151604) do

  create_table "influencer_likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "influencer_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["influencer_id"], name: "index_influencer_likes_on_influencer_id"
    t.index ["user_id"], name: "index_influencer_likes_on_user_id"
  end

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

  create_table "products_youtube_videos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "youtube_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_youtube_videos_on_product_id"
    t.index ["youtube_video_id"], name: "index_products_youtube_videos_on_youtube_video_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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

  add_foreign_key "influencer_likes", "influencers"
  add_foreign_key "influencer_likes", "users"
  add_foreign_key "products", "influencers"
  add_foreign_key "products_youtube_videos", "products"
  add_foreign_key "products_youtube_videos", "youtube_videos"
  add_foreign_key "youtube_channels", "influencers"
  add_foreign_key "youtube_videos", "influencers"
end
