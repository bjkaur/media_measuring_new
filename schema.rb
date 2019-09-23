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

ActiveRecord::Schema.define(version: 2019_04_12_155346) do

  create_table "blank_measurements", force: :cascade do |t|
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.float "weight1a"
    t.float "weight2a"
    t.float "weight3a"
    t.float "weight1b"
    t.float "weight1c"
    t.float "weight2b"
    t.float "weight2c"
    t.float "weight3b"
    t.float "weight3c"
  end

  create_table "blank_media", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "blank_procedures", force: :cascade do |t|
    t.string "name"
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "calculation_types", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "measurement_names", force: :cascade do |t|
    t.string "name"
    t.integer "measurement_type_id", precision: 38
    t.integer "expired", precision: 38, default: 0
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.integer "mark_medium_as_returned", precision: 38, default: 0
    t.integer "position", precision: 38
    t.index ["measurement_type_id"], name: "i_mea_nam_mea_typ_id"
  end

  create_table "measurement_names_media_types", id: false, force: :cascade do |t|
    t.integer "media_type_id", limit: 19, precision: 19, null: false
    t.integer "measurement_name_id", limit: 19, precision: 19, null: false
  end

  create_table "measurement_suites", force: :cascade do |t|
    t.string "name"
    t.integer "default_expiry_days", precision: 38
    t.integer "enforce_order", precision: 38, default: 0
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.integer "blank_procedure_id", precision: 38
    t.integer "calculation_type_id", precision: 38
    t.string "short"
    t.index ["blank_procedure_id"], name: "i_mea_sui_bla_pro_id"
    t.index ["calculation_type_id"], name: "i_mea_sui_cal_typ_id"
  end

  create_table "measurement_types", force: :cascade do |t|
    t.string "name"
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.integer "medium_id", precision: 38
    t.integer "contact_id", precision: 38
    t.integer "equipment_id", precision: 38
    t.string "value"
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.integer "expired", precision: 38, default: 0
    t.integer "measurement_name_id", precision: 38
    t.index ["contact_id"], name: "i_measurements_contact_id"
    t.index ["measurement_name_id"], name: "i_mea_mea_nam_id"
    t.index ["medium_id"], name: "i_measurements_medium_id"
  end

  create_table "media", force: :cascade do |t|
    t.integer "media_type_id", precision: 38
    t.date "expiration_date_on"
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.integer "returned_by_client", precision: 38, default: 0
    t.date "printed_at"
    t.integer "stock_batch_id", precision: 38
    t.index ["media_type_id"], name: "index_media_on_media_type_id"
    t.index ["stock_batch_id"], name: "index_media_on_stock_batch_id"
  end

  create_table "media_order_requests", force: :cascade do |t|
    t.integer "quantity", precision: 38
    t.integer "media_type_id", precision: 38
    t.integer "order_id", precision: 38
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.index ["media_type_id"], name: "i_med_ord_req_med_typ_id"
    t.index ["order_id"], name: "i_med_ord_req_ord_id"
  end

  create_table "media_suite_items", force: :cascade do |t|
    t.integer "media_suite_id", precision: 38
    t.integer "medium_id", precision: 38
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.index ["media_suite_id"], name: "i_med_sui_ite_med_sui_id"
    t.index ["medium_id"], name: "i_media_suite_items_medium_id"
  end

  create_table "media_suites", force: :cascade do |t|
    t.integer "media_type_suite_id", precision: 38
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.date "printed_at"
    t.integer "stock_batch_id", precision: 38
    t.index ["media_type_suite_id"], name: "i_med_sui_med_typ_sui_id"
    t.index ["stock_batch_id"], name: "i_media_suites_stock_batch_id"
  end

  create_table "media_type_stocks", force: :cascade do |t|
    t.integer "media_type_id", precision: 38
    t.integer "stock_batch_id", precision: 38
    t.string "lot_number"
    t.boolean "stock_left"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_type_id"], name: "i_med_typ_sto_med_typ_id"
    t.index ["stock_batch_id"], name: "i_med_typ_sto_sto_bat_id"
  end

  create_table "media_type_suite_items", force: :cascade do |t|
    t.integer "media_type_id", precision: 38
    t.integer "media_type_suite_id", precision: 38
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.index ["media_type_id"], name: "i_med_typ_sui_ite_med_typ_id"
    t.index ["media_type_suite_id"], name: "i26af1b8daa9324bab901ab54ea68b"
  end

  create_table "media_type_suites", force: :cascade do |t|
    t.string "name"
    t.integer "expired", precision: 38, default: 0
    t.date "created_at", null: false
    t.date "updated_at", null: false
  end

  create_table "media_types", force: :cascade do |t|
    t.integer "measurement_suite_id", precision: 38
    t.string "name"
    t.integer "expired", precision: 38, default: 0
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.integer "hidden", precision: 38, default: 0
    t.index ["measurement_suite_id"], name: "i_med_typ_mea_sui_id"
  end

  create_table "order_media", force: :cascade do |t|
    t.integer "order_id", precision: 38
    t.integer "medium_id", precision: 38
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.index ["medium_id"], name: "index_order_media_on_medium_id"
    t.index ["order_id"], name: "index_order_media_on_order_id"
  end

  create_table "order_media_suites", force: :cascade do |t|
    t.integer "order_id", precision: 38
    t.integer "media_suite_id", precision: 38
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.index ["media_suite_id"], name: "i_ord_med_sui_med_sui_id"
    t.index ["order_id"], name: "i_order_media_suites_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "contact_id", precision: 38
    t.date "request_date_on"
    t.integer "state", precision: 38, default: 0
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.integer "sal_contact_id", precision: 38
    t.integer "stock", precision: 38, default: 0
    t.string "ticket_number"
    t.index ["contact_id"], name: "index_orders_on_contact_id"
  end

  create_table "standard_measurements", force: :cascade do |t|
    t.integer "media_type_id", limit: 19, precision: 19
    t.integer "measurement_name_id", limit: 19, precision: 19
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measurement_name_id"], name: "i_sta_mea_mea_nam_id"
    t.index ["media_type_id"], name: "i_sta_mea_med_typ_id"
  end

  create_table "stock_batches", force: :cascade do |t|
    t.string "username"
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.integer "media_type_id", precision: 38
    t.integer "media_type_suite_id", precision: 38
    t.integer "item_count", precision: 38, default: 0
    t.string "lot_number"
    t.boolean "stock_expired", default: false, null: false
  end

  create_table "suite_measurements", force: :cascade do |t|
    t.integer "measurement_suite_id", precision: 38
    t.integer "measurement_name_id", precision: 38
    t.integer "position", precision: 38
    t.integer "repeatable", precision: 38
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.date "expired_at"
    t.index ["measurement_name_id"], name: "i_sui_mea_mea_nam_id"
    t.index ["measurement_suite_id"], name: "i_sui_mea_mea_sui_id"
  end

  create_table "table_standard_measurements", force: :cascade do |t|
    t.string "media_type"
    t.string "measurement_name"
  end

  add_foreign_key "measurement_names", "measurement_types"
  add_foreign_key "measurement_suites", "blank_procedures"
  add_foreign_key "measurement_suites", "calculation_types"
  add_foreign_key "measurements", "contacts"
  add_foreign_key "measurements", "measurement_names"
  add_foreign_key "measurements", "media"
  add_foreign_key "media", "media_types"
  add_foreign_key "media", "stock_batches"
  add_foreign_key "media_suite_items", "media"
  add_foreign_key "media_suite_items", "media_suites"
  add_foreign_key "media_suites", "media_type_suites"
  add_foreign_key "media_suites", "stock_batches"
  add_foreign_key "media_type_stocks", "media_types"
  add_foreign_key "media_type_stocks", "stock_batches"
  add_foreign_key "media_type_suite_items", "media_type_suites"
  add_foreign_key "media_type_suite_items", "media_types"
  add_foreign_key "media_types", "measurement_suites"
  add_foreign_key "order_media", "media"
  add_foreign_key "order_media", "orders"
  add_foreign_key "order_media_suites", "media_suites"
  add_foreign_key "order_media_suites", "orders"
  add_foreign_key "suite_measurements", "measurement_names"
  add_foreign_key "suite_measurements", "measurement_suites"
end
