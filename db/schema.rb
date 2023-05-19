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

ActiveRecord::Schema[7.0].define(version: 2023_05_19_220919) do
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

  create_table "arrival_flights", force: :cascade do |t|
    t.bigint "airport_id", null: false
    t.bigint "flight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_arrival_flights_on_airport_id"
    t.index ["flight_id"], name: "index_arrival_flights_on_flight_id"
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

  create_table "departure_flights", force: :cascade do |t|
    t.bigint "airport_id", null: false
    t.bigint "flight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_departure_flights_on_airport_id"
    t.index ["flight_id"], name: "index_departure_flights_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "number", null: false
    t.datetime "departure_date", null: false
    t.datetime "arrival_date", null: false
    t.float "price", null: false
    t.boolean "available", default: true, null: false
    t.bigint "airplane_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airplane_id"], name: "index_flights_on_airplane_id"
    t.index ["number"], name: "index_flights_on_number", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.float "total_amount", null: false
    t.boolean "paid", default: false, null: false
    t.bigint "itinerary_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_invoices_on_itinerary_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_itineraries_on_number", unique: true
  end

  create_table "itinerary_flights", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.bigint "flight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_itinerary_flights_on_flight_id"
    t.index ["itinerary_id"], name: "index_itinerary_flights_on_itinerary_id"
  end

  create_table "itinerary_passengers", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.bigint "passenger_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_itinerary_passengers_on_itinerary_id"
    t.index ["passenger_id"], name: "index_itinerary_passengers_on_passenger_id"
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
    t.string "pin", null: false
    t.string "email", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_passengers_on_email", unique: true
    t.index ["pin"], name: "index_passengers_on_pin", unique: true
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
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "airports", "cities"
  add_foreign_key "arrival_flights", "airports"
  add_foreign_key "arrival_flights", "flights"
  add_foreign_key "cities", "countries"
  add_foreign_key "departure_flights", "airports"
  add_foreign_key "departure_flights", "flights"
  add_foreign_key "flights", "airplanes"
  add_foreign_key "invoices", "itineraries"
  add_foreign_key "invoices", "users"
  add_foreign_key "itinerary_flights", "flights"
  add_foreign_key "itinerary_flights", "itineraries"
  add_foreign_key "itinerary_passengers", "itineraries"
  add_foreign_key "itinerary_passengers", "passengers"
  add_foreign_key "passenger_seats", "passengers"
  add_foreign_key "passenger_seats", "seats"
  add_foreign_key "passengers", "users"
  add_foreign_key "seats", "airplanes"
end
