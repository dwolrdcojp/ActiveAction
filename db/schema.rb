# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_01_031332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actionitems", force: :cascade do |t|
    t.string "focus"
    t.text "description"
    t.string "owner"
    t.date "due"
    t.text "resources"
    t.string "urgency"
    t.string "importance"
    t.string "status"
    t.text "updates"
    t.date "completion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "actionitem_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actionitem_id"], name: "index_comments_on_actionitem_id"
  end

  add_foreign_key "comments", "actionitems"
end
