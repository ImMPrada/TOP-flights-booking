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

# Destroy all existing records
Airport.destroy_all
City.destroy_all
Country.destroy_all
Flight.destroy_all
Airplane.destroy_all
Seat.destroy_all

# Define airport data for each country
countries = [
  {
    name: 'Colombia',
    symbol: 'CO',
    cities: [
      { name: 'Bogota', airports: ['El Dorado', 'Puente Aereo'] },
      { name: 'Medellin', airports: ['Jose Maria Cordova', 'Olaya Herrera'] },
      { name: 'Cali', airports: ['Alfonso Bonilla Aragon'] },
      { name: 'Barranquilla', airports: ['Ernesto Cortissoz'] },
      { name: 'Cartagena', airports: ['Rafael Nunez'] },
      { name: 'Santa Marta', airports: ['Simon Bolivar'] },
      { name: 'Pereira', airports: ['Matecana'] },
      { name: 'Manizales', airports: ['La Nubia'] },
      { name: 'Cucuta', airports: ['Camilo Daza'] },
      { name: 'Ibague', airports: ['Perales'] },
      { name: 'Villavicencio', airports: ['La Vanguardia'] },
      { name: 'Armenia', airports: ['El Eden'] },
      { name: 'Pasto', airports: ['Antonio Narino'] },
      { name: 'Bucaramanga', airports: ['Palo Quemado'] },
      { name: 'Neiva', airports: ['Benito Salas'] },
      { name: 'Sincelejo', airports: ['Las Brujas'] },
      { name: 'Monteria', airports: ['Los Garzones'] },
      { name: 'Tunja', airports: ['Gustavo Rojas Pinilla'] },
      { name: 'Popayan', airports: ['Guillermo Leon Valencia'] },
      { name: 'Valledupar', airports: ['Alfonso Lopez Pumarejo'] }
    ]
  },
  {
    name: 'Mexico',
    symbol: 'MX',
    cities: [
      { name: 'Mexico City', airports: ['Benito Juarez', 'Toluca'] },
      { name: 'Cancun', airports: ['Cancun International'] },
      { name: 'Guadalajara', airports: ['Guadalajara International'] },
      { name: 'Monterrey', airports: ['Monterrey International'] },
      { name: 'Tijuana', airports: ['Tijuana International'] },
      { name: 'Puerto Vallarta', airports: ['Puerto Vallarta International'] },
      { name: 'Merida', airports: ['Merida International'] },
      { name: 'Cabo San Lucas', airports: ['Los Cabos International'] },
      { name: 'Puebla', airports: ['Puebla International'] },
      { name: 'Queretaro', airports: ['Queretaro International'] },
      { name: 'Oaxaca', airports: ['Oaxaca International'] },
      { name: 'Veracruz', airports: ['Veracruz International'] },
      { name: 'Culiacan', airports: ['Culiacan International'] },
      { name: 'Hermosillo', airports: ['Hermosillo International'] },
      { name: 'Chihuahua', airports: ['Chihuahua International'] },
      { name: 'San Luis Potosi', airports: ['San Luis Potosi International'] },
      { name: 'Leon', airports: ['Leon/Guanajuato International'] },
      { name: 'Mazatlan', airports: ['Mazatlan International'] },
      { name: 'Acapulco', airports: ['Acapulco International'] },
      { name: 'Tuxtla Gutierrez', airports: ['Tuxtla Gutierrez International'] }
    ]
  },
  {
    name: 'Chile',
    symbol: 'CL',
    cities: [
      { name: 'Santiago', airports: ['Arturo Merino Benitez', 'Santiago Municipal'] },
      { name: 'Valparaiso', airports: ['Viña del Mar', 'Torquemada'] },
      { name: 'Concepcion', airports: ['Carriel Sur'] },
      { name: 'Antofagasta', airports: ['Cerro Moreno'] },
      { name: 'Puerto Montt', airports: ['El Tepual'] },
      { name: 'La Serena', airports: ['La Florida'] },
      { name: 'Iquique', airports: ['Diego Aracena'] },
      { name: 'Temuco', airports: ['Maquehue'] },
      { name: 'Valdivia', airports: ['Pichoy'] },
      { name: 'Arica', airports: ['Chacalluta'] },
      { name: 'Copiapo', airports: ['Desierto de Atacama'] },
      { name: 'Osorno', airports: ['Canal Bajo Carlos Hott Siebert'] },
      { name: 'Rancagua', airports: ['Teniente Vidal'] },
      { name: 'Talca', airports: ['Vichuquen'] },
      { name: 'Chillan', airports: ['General Bernardo O Higgins'] },
      { name: 'Curico', airports: ['Los Lirios'] },
      { name: 'Quillota', airports: ['La Ligua'] },
      { name: 'Los Angeles', airports: ['Maria Dolores'] },
      { name: 'Ovalle', airports: ['Los Perales'] },
      { name: 'Punta Arenas', airports: ['Carlos Ibanez del Campo'] }
    ]
  }
]

countries.each do |country_data|
  country = Country.create!(name: country_data[:name], symbol: country_data[:symbol])
  country_data[:cities].each do |city_data|
    city = country.cities.create!(name: city_data[:name])
    city_data[:airports].each do |airport_name|
      city.airports.create!(name: airport_name)
    end
  end
end

airplane_models = %w[
  Boeing502
  Airbus A320
  Embraer E175
  Bombardier CRJ900
  Boeing502
  Airbus A320
  Embraer E175
  Bombardier CRJ900
]

airplane_models.each do |model|
  airplane = Airplane.create!(model:)

  %w[A B E F].each do |row|
    (1..30).each do |number|
      seat_name = "#{row}#{number}"
      Seat.create!(
        name: seat_name,
        airplane:,
        price: rand(100.0..500.0)
      )
    end
  end
end

airplane = Airplane.first

bogota = City.find_by(name: 'Bogota').airports.sample
bucaramanga = City.find_by(name: 'Bucaramanga').airports.sample
medellin = City.find_by(name: 'Medellin').airports.sample
cartagena = City.find_by(name: 'Cartagena').airports.sample
cali = City.find_by(name: 'Cali').airports.sample
barranquilla = City.find_by(name: 'Barranquilla').airports.sample
pasto = City.find_by(name: 'Pasto').airports.sample
valledupar = City.find_by(name: 'Valledupar').airports.sample

flights_data = [
  { number: 'F001', departure_date: DateTime.now + 1.day, arrival_date: DateTime.now + 1.day + 1.hour, price: 150.0, available: true, departure_airport: bogota, arrival_airport: bucaramanga },
  { number: 'F002', departure_date: DateTime.now + 1.day + 2.hours, arrival_date: DateTime.now + 1.day + 4.hours, price: 200.0, available: true, departure_airport: bucaramanga, arrival_airport: medellin },
  { number: 'F003', departure_date: DateTime.now + 1.day + 7.hours, arrival_date: DateTime.now + 1.day + 10.hours, price: 180.0, available: true, departure_airport: medellin, arrival_airport: cartagena },
  { number: 'F004', departure_date: DateTime.now + 1.day + 14.hours, arrival_date: DateTime.now + 1.day + 18.hours, price: 220.0, available: true, departure_airport: cartagena, arrival_airport: cali },
  { number: 'F005', departure_date: DateTime.now + 1.day + 23.hours, arrival_date: DateTime.now + 1.day + 28.hours, price: 190.0, available: true, departure_airport: cali, arrival_airport: barranquilla },
  { number: 'F006', departure_date: DateTime.now + 1.day + 34.hours, arrival_date: DateTime.now + 1.day + 40.hours, price: 210.0, available: true, departure_airport: barranquilla, arrival_airport: pasto },
  { number: 'F007', departure_date: DateTime.now + 1.day + 47.hours, arrival_date: DateTime.now + 1.day + 54.hours, price: 230.0, available: true, departure_airport: pasto, arrival_airport: valledupar },
  { number: 'F008', departure_date: DateTime.now + 1.day + 62.hours, arrival_date: DateTime.now + 1.day + 70.hours, price: 180.0, available: true, departure_airport: valledupar, arrival_airport: bogota }
]

flights_data.each do |flight_data|
  Flight.create(flight_data.merge(airplane: airplane))
end