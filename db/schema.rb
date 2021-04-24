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

ActiveRecord::Schema.define(version: 2021_04_23_195433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v1_addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "apartment_no"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "api_v1_cart_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_api_v1_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_api_v1_cart_items_on_item_id"
  end

  create_table "api_v1_carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_api_v1_carts_on_user_id"
  end

  create_table "api_v1_item_images", force: :cascade do |t|
    t.bigint "item_id"
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_api_v1_item_images_on_item_id"
  end

  create_table "api_v1_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "api_v1_order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "item_id"
    t.text "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_api_v1_order_items_on_item_id"
    t.index ["order_id"], name: "index_api_v1_order_items_on_order_id"
  end

  create_table "api_v1_orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shipping_address_id"
    t.bigint "billing_address_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["billing_address_id"], name: "index_api_v1_orders_on_billing_address_id"
    t.index ["shipping_address_id"], name: "index_api_v1_orders_on_shipping_address_id"
    t.index ["user_id"], name: "index_api_v1_orders_on_user_id"
  end

  create_table "api_v1_user_addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "address_id"
    t.string "address_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_api_v1_user_addresses_on_address_id"
    t.index ["user_id"], name: "index_api_v1_user_addresses_on_user_id"
  end

  create_table "api_v1_users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "email"
    t.string "password_digest"
    t.boolean "agreement", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "api_v1_orders", "api_v1_addresses", column: "billing_address_id"
  add_foreign_key "api_v1_orders", "api_v1_addresses", column: "shipping_address_id"
end
