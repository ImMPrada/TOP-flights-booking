# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seed.rb

# Destroy all existing records
# seed.rb

# Destroy all existing records
# seed.rb

require_relative 'seeds/countries_and_cities'
require_relative 'seeds/airplanes'
require_relative 'seeds/flight_fleet'
require_relative 'seeds/flights_by_airplanes/first_airplane'
require_relative 'seeds/flights_by_airplanes/second_airplane'
require_relative 'seeds/flights_by_airplanes/third_airplane'
require_relative 'seeds/flights_by_airplanes/seventh_airplane'
require 'byebug'

# Destroy all existing records
Flight.destroy_all
Airport.destroy_all
City.destroy_all
Country.destroy_all
Airplane.destroy_all
Seat.destroy_all

# Plant seeds
CountriesAndCities.new.plant
Airplanes.new.plant

fleet_information = {
  from: 'Bogota',
  arrival_cities: %w[Bucaramanga Medellin Cartagena Cali Barranquilla Pasto],
  airplanes: Airplane.all[0, 6],
  durations: [2.hours, 1.hour, 2.hour, 2.hour, 2.hour, 2.hours],
  prices: [100, 200, 300, 400, 500, 600],
  start_date: DateTime.now + 1.day
}

FlightFleet.new(fleet_information:).plant

fleet_information = {
  from: 'Cartagena',
  arrival_cities: %w[Bogota Medellin],
  airplanes: Airplane.all[6, 2],
  durations: [2.hours, 3.hours],
  prices: [100, 200],
  start_date: DateTime.now + 1.day
}

FlightFleet.new(fleet_information:).plant

FlightsByAirplanes::FirstAirplane.new.plant
FlightsByAirplanes::SecondAirplane.new.plant
FlightsByAirplanes::ThirdAirplane.new.plant
FlightsByAirplanes::SeventhAirplane.new.plant
