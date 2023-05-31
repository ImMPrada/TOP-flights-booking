require_relative '../flight_fleet'

module FlightsByAirplanes
  class FirstAirplane
    def plant
      fleet_information = {
        from: 'Bucaramanga',
        arrival_cities: %w[Medellin],
        airplanes: [Airplane.first],
        durations: [3.hours],
        prices: [400],
        start_date: DateTime.now + 1.day + 3.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Medellin',
        arrival_cities: %w[Cali],
        airplanes: [Airplane.first],
        durations: [1.hours],
        prices: [100],
        start_date: DateTime.now + 1.day + 10.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Cali',
        arrival_cities: %w[Cartagena],
        airplanes: [Airplane.first],
        durations: [5.hours],
        prices: [500],
        start_date: DateTime.now + 1.day + 12.hours
      }

      FlightFleet.new(fleet_information:).plant      
    end
  end
end
