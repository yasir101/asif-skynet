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

ActiveRecord::Schema.define(version: 2022_10_25_190249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "admins_roles", id: false, force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "role_id"
    t.index ["admin_id", "role_id"], name: "index_admins_roles_on_admin_id_and_role_id"
    t.index ["admin_id"], name: "index_admins_roles_on_admin_id"
    t.index ["role_id"], name: "index_admins_roles_on_role_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_areas_on_city_id"
  end

  create_table "blood_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_packages", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_packages_on_company_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_areas", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "country_id"
    t.bigint "city_id"
    t.bigint "area_id"
    t.bigint "sub_area_id"
    t.string "house_no"
    t.string "pon_no"
    t.text "address"
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_customer_areas_on_area_id"
    t.index ["city_id"], name: "index_customer_areas_on_city_id"
    t.index ["country_id"], name: "index_customer_areas_on_country_id"
    t.index ["customer_id"], name: "index_customer_areas_on_customer_id"
    t.index ["sub_area_id"], name: "index_customer_areas_on_sub_area_id"
  end

  create_table "customer_device_infos", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "device_name"
    t.string "serial_no"
    t.string "model"
    t.string "mac_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customer_device_infos_on_customer_id"
  end

  create_table "customer_packages", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "package_id"
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.bigint "company_package_id"
    t.index ["company_id"], name: "index_customer_packages_on_company_id"
    t.index ["company_package_id"], name: "index_customer_packages_on_company_package_id"
    t.index ["customer_id"], name: "index_customer_packages_on_customer_id"
    t.index ["package_id"], name: "index_customer_packages_on_package_id"
  end

  create_table "customer_subscriptions", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "customer_package_id"
    t.date "start_date"
    t.date "expiry_date"
    t.boolean "status", default: false
    t.boolean "renew", default: false
    t.float "profit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customer_subscriptions_on_customer_id"
    t.index ["customer_package_id"], name: "index_customer_subscriptions_on_customer_package_id"
  end

  create_table "customers", force: :cascade do |t|
    t.integer "old_ref_no"
    t.string "name"
    t.string "father_name"
    t.string "cnic"
    t.string "mobile_primary"
    t.string "mobile_secondary"
    t.bigint "service_id"
    t.bigint "staff_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "promise_break_count", default: 0
    t.string "residance"
    t.boolean "welcome_message", default: false
    t.boolean "first_receiving", default: false
    t.bigint "company_id"
    t.bigint "purchase_package_id"
    t.bigint "package_id"
    t.string "username"
    t.string "password_text"
    t.integer "package_discounted_price"
    t.bigint "country_id"
    t.bigint "city_id"
    t.bigint "area_id"
    t.bigint "sub_area_id"
    t.string "house_no"
    t.string "street"
    t.text "address"
    t.text "remarks"
    t.string "pon_no"
    t.string "device_name"
    t.string "serial_no"
    t.string "model"
    t.string "mac_address"
    t.bigint "internet_type_id"
    t.date "username_expiry"
    t.date "joining_date"
    t.index ["area_id"], name: "index_customers_on_area_id"
    t.index ["city_id"], name: "index_customers_on_city_id"
    t.index ["company_id"], name: "index_customers_on_company_id"
    t.index ["country_id"], name: "index_customers_on_country_id"
    t.index ["internet_type_id"], name: "index_customers_on_internet_type_id"
    t.index ["package_id"], name: "index_customers_on_package_id"
    t.index ["purchase_package_id"], name: "index_customers_on_purchase_package_id"
    t.index ["service_id"], name: "index_customers_on_service_id"
    t.index ["staff_id"], name: "index_customers_on_staff_id"
    t.index ["sub_area_id"], name: "index_customers_on_sub_area_id"
  end

  create_table "internet_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "message_templates", force: :cascade do |t|
    t.string "title"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "message_template_id"
    t.string "number"
    t.text "message_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_template_id"], name: "index_messages_on_message_template_id"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.bigint "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "staff_id"
    t.integer "amount"
    t.date "date"
    t.string "payment_mode"
    t.string "purpose"
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["staff_id"], name: "index_payments_on_staff_id"
  end

  create_table "purchase_packages", force: :cascade do |t|
    t.bigint "company_id"
    t.string "package_name"
    t.integer "purchase_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_purchase_packages_on_company_id"
  end

  create_table "receipt_book_pages", force: :cascade do |t|
    t.bigint "receipt_book_id"
    t.integer "page_no"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receipt_book_id"], name: "index_receipt_book_pages_on_receipt_book_id"
  end

  create_table "receipt_books", force: :cascade do |t|
    t.bigint "staff_id"
    t.date "issue_date"
    t.integer "book_number"
    t.integer "from"
    t.integer "total_pages"
    t.integer "to"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["staff_id"], name: "index_receipt_books_on_staff_id"
  end

  create_table "receivings", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "staff_id"
    t.integer "amount"
    t.string "service"
    t.bigint "receipt_book_id"
    t.bigint "receipt_book_page_id"
    t.date "receiving_date"
    t.integer "balance", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount_received", default: 0
    t.integer "discount", default: 0
    t.index ["customer_id"], name: "index_receivings_on_customer_id"
    t.index ["receipt_book_id"], name: "index_receivings_on_receipt_book_id"
    t.index ["receipt_book_page_id"], name: "index_receivings_on_receipt_book_page_id"
    t.index ["staff_id"], name: "index_receivings_on_staff_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staff_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.bigint "staff_type_id"
    t.bigint "blood_group_id"
    t.string "full_name"
    t.string "father_name"
    t.date "dob"
    t.string "cnic"
    t.string "mobile_primary"
    t.string "mobile_secondary"
    t.text "address"
    t.text "remarks"
    t.date "joining"
    t.integer "starting_salary"
    t.integer "current_salary"
    t.string "official_mobile_no"
    t.string "official_mobile_model"
    t.string "official_moterbike_no"
    t.text "others"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["blood_group_id"], name: "index_staffs_on_blood_group_id"
    t.index ["deleted_at"], name: "index_staffs_on_deleted_at"
    t.index ["staff_type_id"], name: "index_staffs_on_staff_type_id"
  end

  create_table "sub_areas", force: :cascade do |t|
    t.string "name"
    t.bigint "area_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_sub_areas_on_area_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "customer_id"
    t.date "start_date"
    t.date "expiry_date"
    t.string "subscription_type"
    t.integer "no_of_days", default: 0
    t.boolean "status", default: false
    t.boolean "renew", default: false
    t.integer "profit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_subscriptions_on_customer_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
end
