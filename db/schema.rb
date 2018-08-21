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

ActiveRecord::Schema.define(version: 2018_08_16_224130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "shortname"
    t.string "house_type"
    t.string "address_line1"
    t.string "address_line2"
    t.string "departamento"
    t.string "provincia"
    t.string "distrito"
    t.bigint "ubigeo_id"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ubigeo_id"], name: "index_addresses_on_ubigeo_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_hours", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_methods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_lines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "quantity"
    t.date "registration_date"
    t.date "release_date"
    t.bigint "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
    t.index ["warehouse_id"], name: "index_inventories_on_warehouse_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.string "barcode"
    t.string "sku"
    t.bigint "category_id"
    t.bigint "sub_category_id"
    t.string "short_description"
    t.text "large_description"
    t.float "full_price"
    t.float "presale_price"
    t.float "otto_price"
    t.bigint "game_type_id"
    t.bigint "game_style_id"
    t.bigint "thematic_id"
    t.bigint "suggested_age_id"
    t.string "suggested_players"
    t.string "game_duration"
    t.string "language"
    t.string "author"
    t.string "origin"
    t.string "brand"
    t.string "editorial"
    t.float "weight"
    t.float "height"
    t.float "width"
    t.float "length"
    t.bigint "game_line_id"
    t.string "video_reel_url"
    t.string "video_how_to_url"
    t.string "video_gameplay_url"
    t.string "img_box"
    t.string "img_box_content"
    t.string "img_board_set"
    t.string "img_board_midgame"
    t.string "ranking_bgg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["game_line_id"], name: "index_products_on_game_line_id"
    t.index ["game_style_id"], name: "index_products_on_game_style_id"
    t.index ["game_type_id"], name: "index_products_on_game_type_id"
    t.index ["sub_category_id"], name: "index_products_on_sub_category_id"
    t.index ["suggested_age_id"], name: "index_products_on_suggested_age_id"
    t.index ["thematic_id"], name: "index_products_on_thematic_id"
  end

  create_table "purchase_order_details", force: :cascade do |t|
    t.bigint "purchase_order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.float "unit_price"
    t.float "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_purchase_order_details_on_product_id"
    t.index ["purchase_order_id"], name: "index_purchase_order_details_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.bigint "supplier_id"
    t.string "order_number"
    t.date "order_date"
    t.date "delivery_date"
    t.bigint "user_id"
    t.float "ammount"
    t.boolean "registered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_purchase_orders_on_supplier_id"
    t.index ["user_id"], name: "index_purchase_orders_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sales_order_details", force: :cascade do |t|
    t.bigint "sales_order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.float "unit_price"
    t.float "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_order_details_on_product_id"
    t.index ["sales_order_id"], name: "index_sales_order_details_on_sales_order_id"
  end

  create_table "sales_orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "client"
    t.string "order_number"
    t.date "order_date"
    t.date "delivery_date"
    t.bigint "delivery_hour_id"
    t.bigint "delivery_method_id"
    t.float "delivery_cost"
    t.string "discount_coupon"
    t.float "ammount"
    t.string "delivery_address_line1"
    t.string "delivery_address_line2"
    t.bigint "payment_method_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_hour_id"], name: "index_sales_orders_on_delivery_hour_id"
    t.index ["delivery_method_id"], name: "index_sales_orders_on_delivery_method_id"
    t.index ["payment_method_id"], name: "index_sales_orders_on_payment_method_id"
    t.index ["user_id"], name: "index_sales_orders_on_user_id"
  end

  create_table "store_credits", force: :cascade do |t|
    t.bigint "user_id"
    t.float "ammount"
    t.string "detail"
    t.date "credit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_store_credits_on_user_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "suggested_ages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "ruc"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "contact"
    t.string "contact_mobile"
    t.string "contact_email"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thematics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ubigeos", force: :cascade do |t|
    t.integer "ug_id"
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "title"
    t.string "username"
    t.string "name"
    t.string "last_name"
    t.string "genre"
    t.string "doi"
    t.string "mobile"
    t.string "telephone"
    t.date "birthdate"
    t.string "business_name"
    t.string "ruc"
    t.string "mtg_id"
    t.string "pkm_id"
    t.string "ygo_id"
    t.string "bloobie_id"
    t.string "dbsuper_id"
    t.string "workcenter"
    t.string "avatar"
    t.string "roles_mask", default: "16"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["doi"], name: "index_users_on_doi", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["ruc"], name: "index_users_on_ruc", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "shortname"
    t.string "house_type"
    t.string "address_line1"
    t.string "address_line2"
    t.string "departamento"
    t.string "provincia"
    t.string "distrito"
    t.bigint "ubigeo_id"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ubigeo_id"], name: "index_warehouses_on_ubigeo_id"
  end

  add_foreign_key "inventories", "products"
  add_foreign_key "inventories", "warehouses"
  add_foreign_key "products", "game_lines"
  add_foreign_key "products", "game_styles"
  add_foreign_key "products", "game_types"
  add_foreign_key "products", "suggested_ages"
  add_foreign_key "products", "thematics"
  add_foreign_key "purchase_order_details", "products"
  add_foreign_key "purchase_order_details", "purchase_orders"
  add_foreign_key "purchase_orders", "suppliers"
  add_foreign_key "purchase_orders", "users"
  add_foreign_key "sales_order_details", "products"
  add_foreign_key "sales_order_details", "sales_orders"
  add_foreign_key "sales_orders", "delivery_hours"
  add_foreign_key "sales_orders", "delivery_methods"
  add_foreign_key "sales_orders", "payment_methods"
  add_foreign_key "sales_orders", "users"
  add_foreign_key "store_credits", "users"
  add_foreign_key "warehouses", "ubigeos"
end
