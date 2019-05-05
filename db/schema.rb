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

ActiveRecord::Schema.define(version: 2019_05_01_221514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.bigint "currency_id"
    t.bigint "cashier_id"
    t.string "name"
    t.integer "value"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cashier_id"], name: "index_bills_on_cashier_id"
    t.index ["currency_id"], name: "index_bills_on_currency_id"
  end

  create_table "cashiers", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.string "concept"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value_colombia", default: 0
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "default_buy_rate"
    t.integer "default_sale_rate"
  end

  create_table "currency_values", force: :cascade do |t|
    t.bigint "cashier_id"
    t.bigint "currency_id"
    t.integer "value", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cashier_id"], name: "index_currency_values_on_cashier_id"
    t.index ["currency_id"], name: "index_currency_values_on_currency_id"
  end

  create_table "daily_movements", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "currency_id"
    t.integer "action"
    t.integer "value_foreign"
    t.integer "value_colombia"
    t.integer "exchange_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cashier_id"
    t.index ["cashier_id"], name: "index_daily_movements_on_cashier_id"
    t.index ["currency_id"], name: "index_daily_movements_on_currency_id"
    t.index ["user_id"], name: "index_daily_movements_on_user_id"
  end

  create_table "general_expenses", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "value"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_general_expenses_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cashier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cashier_id"], name: "index_sessions_on_cashier_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "sign_in_comments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "comment"
    t.bigint "cashier_id"
    t.json "cashier_currency_values"
    t.boolean "anomaly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cashier_id"], name: "index_sign_in_comments_on_cashier_id"
    t.index ["user_id"], name: "index_sign_in_comments_on_user_id"
  end

  create_table "user_cashiers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cashier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cashier_id"], name: "index_user_cashiers_on_cashier_id"
    t.index ["user_id", "cashier_id"], name: "index_user_cashiers_on_user_id_and_cashier_id", unique: true
    t.index ["user_id"], name: "index_user_cashiers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bills", "cashiers"
  add_foreign_key "bills", "currencies"
  add_foreign_key "currency_values", "cashiers"
  add_foreign_key "currency_values", "currencies"
  add_foreign_key "daily_movements", "cashiers"
  add_foreign_key "daily_movements", "currencies"
  add_foreign_key "daily_movements", "users"
  add_foreign_key "general_expenses", "users"
  add_foreign_key "sessions", "cashiers"
  add_foreign_key "sessions", "users"
  add_foreign_key "sign_in_comments", "cashiers"
  add_foreign_key "sign_in_comments", "users"
  add_foreign_key "user_cashiers", "cashiers"
  add_foreign_key "user_cashiers", "users"
end
