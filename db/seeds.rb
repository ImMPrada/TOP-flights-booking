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
Flight.destroy_all
Airport.destroy_all
City.destroy_all
Country.destroy_all
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

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 1.day

flights_data = [
  { number: 'F002', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F003', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F004', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F005', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F006', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F007', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.second

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now

flights_data = [
  { number: 'F102', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F103', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F104', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F105', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F106', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F107', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.third

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 5.hours

flights_data = [
  { number: 'F202', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F203', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F204', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F205', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F206', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F207', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.fourth

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 8.hours

flights_data = [
  { number: 'F302', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F303', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F304', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F305', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F306', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F307', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.first

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 1.day + 8.hours

flights_data = [
  { number: 'F402', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F403', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F404', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F405', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F406', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F407', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.second

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 1.day + 1.hours

flights_data = [
  { number: 'F502', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F503', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F504', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F505', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F506', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F507', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.third

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 1.day + 5.hours

flights_data = [
  { number: 'F602', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F603', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F604', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F605', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F606', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F607', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.fourth

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 2.days + 5.hours

flights_data = [
  { number: 'F702', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F703', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F704', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F705', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F706', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F707', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.last

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 3.days + 8.hours

flights_data = [
  { number: 'F802', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F803', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F804', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F805', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F806', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F807', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.last

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 4.days + 8.hours

flights_data = [
  { number: 'F902', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F903', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F904', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F905', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F906', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F907', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end

airplane = Airplane.last

bogota = City.find_by(name: 'Bogota')
bucaramanga = City.find_by(name: 'Bucaramanga')
medellin = City.find_by(name: 'Medellin')
cartagena = City.find_by(name: 'Cartagena')
cali = City.find_by(name: 'Cali')
barranquilla = City.find_by(name: 'Barranquilla')
pasto = City.find_by(name: 'Pasto')

initial_date = DateTime.now + 5.days + 8.hours

flights_data = [
  { number: 'F112', departure_date: initial_date + 2.hours, arrival_date: initial_date + 4.hours, price: 200.0,
    available: true, departure_airport: bogota.airports.sample, arrival_airport: bucaramanga.airports.sample,
    departure_city: bogota, arrival_city: bucaramanga },
  { number: 'F113', departure_date: initial_date + 7.hours, arrival_date: initial_date + 10.hours, price: 180.0,
    available: true, departure_airport: bucaramanga.airports.sample, arrival_airport: medellin.airports.sample,
    departure_city: bucaramanga, arrival_city: medellin },
  { number: 'F114', departure_date: initial_date + 14.hours, arrival_date: initial_date + 18.hours, price: 220.0,
    available: true, departure_airport: medellin.airports.sample, arrival_airport: cartagena.airports.sample,
    departure_city: medellin, arrival_city: cartagena },  
  { number: 'F115', departure_date: initial_date + 23.hours, arrival_date: initial_date + 28.hours, price: 190.0,
    available: true, departure_airport: cartagena.airports.sample, arrival_airport: cali.airports.sample,
    departure_city: cartagena, arrival_city: cali },
  { number: 'F116', departure_date: initial_date + 34.hours, arrival_date: initial_date + 40.hours, price: 210.0,
    available: true, departure_airport: cali.airports.sample, arrival_airport: barranquilla.airports.sample,
    departure_city: cali, arrival_city: barranquilla },
  { number: 'F117', departure_date: initial_date + 47.hours, arrival_date: initial_date + 54.hours, price: 230.0,
    available: true, departure_airport: barranquilla.airports.sample, arrival_airport: pasto.airports.sample,
    departure_city: barranquilla, arrival_city: pasto }
]

flights_data.each do |flight_data|
  Flight.create!(flight_data.merge(airplane:))
end
