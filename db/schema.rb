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

ActiveRecord::Schema[7.0].define(version: 2023_06_02_154600) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airplanes", force: :cascade do |t|
    t.string "model", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_airports_on_city_id"
  end

  create_table "booking_passengers", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "passenger_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_passengers_on_booking_id"
    t.index ["passenger_id"], name: "index_booking_passengers_on_passenger_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "number", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "flight_id"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["number"], name: "index_bookings_on_number", unique: true
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["name"], name: "index_cities_on_name"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "symbol", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name"
    t.index ["symbol"], name: "index_countries_on_symbol", unique: true
  end

  create_table "flights", force: :cascade do |t|
    t.string "number", null: false
    t.datetime "departure_date", null: false
    t.datetime "arrival_date", null: false
    t.float "price", null: false
    t.boolean "available", default: true, null: false
    t.bigint "airplane_id", null: false
    t.bigint "departure_airport_id", null: false
    t.bigint "arrival_airport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "departure_city_id", null: false
    t.bigint "arrival_city_id", null: false
    t.index ["airplane_id"], name: "index_flights_on_airplane_id"
    t.index ["arrival_airport_id"], name: "index_flights_on_arrival_airport_id"
    t.index ["arrival_city_id"], name: "index_flights_on_arrival_city_id"
    t.index ["departure_airport_id"], name: "index_flights_on_departure_airport_id"
    t.index ["departure_city_id"], name: "index_flights_on_departure_city_id"
    t.index ["number"], name: "index_flights_on_number", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.float "total_amount", null: false
    t.boolean "paid", default: false, null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_invoices_on_booking_id"
  end

  create_table "passenger_seats", force: :cascade do |t|
    t.bigint "passenger_id", null: false
    t.bigint "seat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["passenger_id"], name: "index_passenger_seats_on_passenger_id"
    t.index ["seat_id"], name: "index_passenger_seats_on_seat_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "identification_number", null: false
    t.string "email", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_passengers_on_email", unique: true
    t.index ["identification_number"], name: "index_passengers_on_identification_number", unique: true
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "name", null: false
    t.string "available", default: "t", null: false
    t.float "price", null: false
    t.bigint "airplane_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airplane_id"], name: "index_seats_on_airplane_id"
    t.index ["name", "airplane_id"], name: "index_seats_on_name_and_airplane_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "airports", "cities"
  add_foreign_key "booking_passengers", "bookings"
  add_foreign_key "booking_passengers", "passengers"
  add_foreign_key "bookings", "flights"
  add_foreign_key "bookings", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "flights", "airplanes"
  add_foreign_key "flights", "airports", column: "arrival_airport_id"
  add_foreign_key "flights", "airports", column: "departure_airport_id"
  add_foreign_key "flights", "cities", column: "arrival_city_id"
  add_foreign_key "flights", "cities", column: "departure_city_id"
  add_foreign_key "invoices", "bookings"
  add_foreign_key "passenger_seats", "passengers"
  add_foreign_key "passenger_seats", "seats"
  add_foreign_key "passengers", "users"
  add_foreign_key "seats", "airplanes"
end
