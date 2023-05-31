require_relative '../flight_fleet'

module FlightsByAirplanes
  class SecondAirplane
    def plant
      fleet_information = {
        from: 'Medellin',
        arrival_cities: %w[Bucaramanga],
        airplanes: [Airplane.second],
        durations: [3.hours],
        prices: [400],
        start_date: DateTime.now + 1.day + 2.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Bucaramanga',
        arrival_cities: %w[Pasto],
        airplanes: [Airplane.second],
        durations: [4.hours],
        prices: [500],
        start_date: DateTime.now + 1.day + 7.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Pasto',
        arrival_cities: %w[Bogota],
        airplanes: [Airplane.second],
        durations: [5.hours],
        prices: [500],
        start_date: DateTime.now + 1.day + 12.hours
      }

      FlightFleet.new(fleet_information:).plant      
    end
  end
end
