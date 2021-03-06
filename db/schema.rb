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

ActiveRecord::Schema.define(version: 2018_06_27_212604) do

  create_table "accounts", force: :cascade do |t|
    t.string "customer_number"
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
    t.index ["customer_number"], name: "index_accounts_on_customer_number"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "accounts_locations", force: :cascade do |t|
    t.integer "account_id"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_accounts_locations_on_account_id"
    t.index ["location_id"], name: "index_accounts_locations_on_location_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_number"
    t.string "suite"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "country"
    t.string "main_contact__first_name"
    t.string "main_contact__last_name"
    t.string "main_contact_phone"
    t.string "main_contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "main_contact_title"
    t.string "email"
    t.string "bus_name"
    t.index ["customer_number"], name: "index_customers_on_customer_number"
  end

  create_table "locations", force: :cascade do |t|
    t.string "customer_number"
    t.string "suite"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "country"
    t.string "contact__first_name"
    t.string "contact__last_name"
    t.string "contact_phone"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "contact_title"
    t.string "name"
    t.string "email"
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_locations_on_customer_id"
    t.index ["customer_number"], name: "index_locations_on_customer_number"
  end

  create_table "machines", force: :cascade do |t|
    t.string "machine_number"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "serial_number"
    t.string "model"
    t.string "on_location"
    t.string "customer_number"
    t.index ["location_id"], name: "index_machines_on_location_id"
  end

  create_table "service_calls", force: :cascade do |t|
    t.string "customer_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "machine_id"
    t.text "description"
    t.index ["account_id"], name: "index_service_calls_on_account_id"
    t.index ["customer_number"], name: "index_service_calls_on_customer_number"
    t.index ["machine_id"], name: "index_service_calls_on_machine_id"
  end

end
