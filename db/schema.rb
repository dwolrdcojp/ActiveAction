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

ActiveRecord::Schema.define(version: 2020_09_02_020933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

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
    t.string "priority"
    t.integer "account_id"
    t.index ["account_id"], name: "index_actionitems_on_account_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "actionitem_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_comments_on_account_id"
    t.index ["actionitem_id"], name: "index_comments_on_actionitem_id"
  end

  create_table "downtime_criteria", force: :cascade do |t|
    t.string "shift"
    t.string "area"
    t.string "line"
    t.string "equipment"
    t.string "reason_code"
    t.integer "account_id"
    t.index ["account_id"], name: "index_downtime_criteria_on_account_id"
  end

  create_table "downtimes", force: :cascade do |t|
    t.date "date"
    t.string "shift"
    t.string "area"
    t.string "line"
    t.string "equipment"
    t.string "start_time"
    t.string "stop_time"
    t.integer "downtime"
    t.string "reason_code"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_downtimes_on_account_id"
  end

  create_table "production_hours", force: :cascade do |t|
    t.integer "hour"
    t.string "product"
    t.float "plan_throughput"
    t.float "actual_throughput"
    t.float "plan_labor"
    t.float "actual_labor"
    t.float "downtime"
    t.float "waste"
    t.float "rework"
    t.float "yield"
    t.bigint "production_run_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_production_hours_on_account_id"
    t.index ["production_run_id"], name: "index_production_hours_on_production_run_id"
  end

  create_table "production_runs", force: :cascade do |t|
    t.date "date"
    t.string "line"
    t.string "shift"
    t.string "supervisor"
    t.string "lead"
    t.string "operator"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "start_time"
    t.string "stop_time"
    t.string "area"
    t.integer "account_id"
    t.index ["account_id"], name: "index_production_runs_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "account_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "actionitems"
  add_foreign_key "production_hours", "production_runs"
end
