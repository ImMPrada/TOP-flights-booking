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
DepartureFlight.destroy_all
ArrivalFlight.destroy_all
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
        price: rand(100.0..500.0),
      )
    end
  end
end
