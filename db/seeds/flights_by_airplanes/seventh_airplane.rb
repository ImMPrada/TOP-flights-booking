require_relative '../flight_fleet'

module FlightsByAirplanes
  class SeventhAirplane
    def plant
      fleet_information = {
        from: 'Bogota',
        arrival_cities: %w[Santiago],
        airplanes: [Airplane.all[6]],
        durations: [8.hours],
        prices: [1200],
        start_date: DateTime.now + 1.day + 3.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Santiago',
        arrival_cities: %w[Puebla],
        airplanes: [Airplane.all[6]],
        durations: [12.hours],
        prices: [2500],
        start_date: DateTime.now + 1.day + 13.hours
      }

      FlightFleet.new(fleet_information:).plant

      fleet_information = {
        from: 'Puebla',
        arrival_cities: %w[Bogota],
        airplanes: [Airplane.all[6]],
        durations: [6.hours],
        prices: [1300],
        start_date: DateTime.now + 1.day + 27.hours
      }

      FlightFleet.new(fleet_information:).plant
    end
  end
end
