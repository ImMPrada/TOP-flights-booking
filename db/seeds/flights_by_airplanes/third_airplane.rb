require_relative '../flight_fleet'

module FlightsByAirplanes
  class ThirdAirplane
    def plant
      fleet_information = {
        from: 'Cartagena',
        arrival_cities: %w[Bogota],
        airplanes: [Airplane.third],
        durations: [2.hours],
        prices: [500],
        start_date: DateTime.now + 1.day + 3.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Bogota',
        arrival_cities: %w[Cartagena],
        airplanes: [Airplane.third],
        durations: [2.hours],
        prices: [300],
        start_date: DateTime.now + 1.day + 6.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Cartagena',
        arrival_cities: %w[Bogota],
        airplanes: [Airplane.third],
        durations: [2.hours],
        prices: [500],
        start_date: DateTime.now + 1.day + 9.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Bogota',
        arrival_cities: %w[Cartagena],
        airplanes: [Airplane.third],
        durations: [2.hours],
        prices: [300],
        start_date: DateTime.now + 1.day + 12.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Cartagena',
        arrival_cities: %w[Bogota],
        airplanes: [Airplane.third],
        durations: [2.hours],
        prices: [500],
        start_date: DateTime.now + 1.day + 16.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Bogota',
        arrival_cities: %w[Cartagena],
        airplanes: [Airplane.third],
        durations: [2.hours],
        prices: [300],
        start_date: DateTime.now + 1.day + 20.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Cartagena',
        arrival_cities: %w[Bogota],
        airplanes: [Airplane.third],
        durations: [2.hours],
        prices: [500],
        start_date: DateTime.now + 1.day + 24.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Bogota',
        arrival_cities: %w[Cartagena],
        airplanes: [Airplane.third],
        durations: [2.hours],
        prices: [300],
        start_date: DateTime.now + 1.day + 30.hours
      }

      FlightFleet.new(fleet_information:).plant
    end
  end
end
