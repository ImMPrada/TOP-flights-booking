class CountriesAndCities
  COUNTRIES = [
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
  ].freeze

  def plant
    COUNTRIES.each do |country_data|
      country = Country.create!(name: country_data[:name], symbol: country_data[:symbol])
      country_data[:cities].each do |city_data|
        city = country.cities.create!(name: city_data[:name])
        city_data[:airports].each do |airport_name|
          city.airports.create!(name: airport_name)
        end
      end
    end
  end
end
