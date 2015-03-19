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

ActiveRecord::Schema.define(version: 20150319222500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "image_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "collection_id"
  end

  add_index "cards", ["collection_id"], name: "index_cards_on_collection_id", using: :btree
  add_index "cards", ["user_id"], name: "index_cards_on_user_id", using: :btree

  create_table "collaborators", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "collection_id"
    t.string   "username"
  end

  add_index "collaborators", ["collection_id"], name: "index_collaborators_on_collection_id", using: :btree

  create_table "collections", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "collaborator_id"
  end

  add_index "collections", ["collaborator_id"], name: "index_collections_on_collaborator_id", using: :btree
  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",         null: false
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username", "email"], name: "index_users_on_username_and_email", unique: true, using: :btree

  add_foreign_key "cards", "collections"
  add_foreign_key "cards", "users"
  add_foreign_key "collaborators", "collections"
  add_foreign_key "collections", "collaborators"
  add_foreign_key "collections", "users"
end
