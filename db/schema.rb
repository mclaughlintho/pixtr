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

ActiveRecord::Schema.define(version: 20150428020027) do

  create_table "galleries", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "image_tags", force: :cascade do |t|
    t.integer  "image_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_tags", ["image_id", "tag_id"], name: "index_image_tags_on_image_id_and_tag_id", unique: true

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["gallery_id"], name: "index_images_on_gallery_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
