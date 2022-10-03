# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_03_125433) do
  create_table "assets", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.float "price"
    t.string "location"
    t.string "status"
    t.string "category"
    t.integer "amount"
    t.bigint "user_id", null: false
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_assets_on_user_id"
  end

  create_table "bills", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "order_id", null: false
    t.string "purchaseDate"
    t.float "total"
    t.string "po_number"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bills_on_customer_id"
    t.index ["order_id"], name: "index_bills_on_order_id"
  end

  create_table "customers", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_orders_on_asset_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "tickets", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.string "title"
    t.string "description"
    t.integer "urgency"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_tickets_on_asset_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email"
    t.text "tokens"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "assets", "users"
  add_foreign_key "bills", "customers"
  add_foreign_key "bills", "orders"
  add_foreign_key "orders", "assets"
  add_foreign_key "orders", "customers"
  add_foreign_key "tickets", "assets"
  add_foreign_key "tickets", "users"
end
