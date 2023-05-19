# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seed.rb

# Destroy all existing records
Airport.destroy_all
City.destroy_all
Country.destroy_all

# Create new records
colombia = Country.create(name: 'Colombia', symbol: 'CO')

bucaramanga = colombia.cities.create(name: 'Bucaramanga')

bucaramanga.airports.create(name: 'Palo quemado')

bogota = colombia.cities.create(name: 'Bogota')

bogota.airports.create(name: 'Puente aereo')
bogota.airports.create(name: 'El Dorado')
