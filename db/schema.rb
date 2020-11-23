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

ActiveRecord::Schema.define(version: 2020_11_16_173824) do

  create_table "influencers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "gendar"
    t.binary "icon", limit: 16777215
    t.string "twitter"
    t.string "instagram"
    t.string "youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "header", limit: 16777215
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.binary "image", limit: 16777215
    t.string "distributor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "influencer_id"
    t.string "youtube"
    t.index ["influencer_id"], name: "index_products_on_influencer_id"
  end

  add_foreign_key "products", "influencers"
end
