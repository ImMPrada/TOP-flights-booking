class FlightFleet
  def initialize(fleet_information:)
    @fleet_information = fleet_information
  end

  def plant
    (0...fleet_size).each do |index|
      flight = Flight.new(
        number: "F#{rand(0..99)}-#{DateTime.now.to_i}",
        departure_date:,
        arrival_date: departure_date + duration(index),
        available: true,
        departure_airport: departure_city.airports.sample,
        arrival_airport: arrival_city(index).airports.sample,
        departure_city:,
        arrival_city: arrival_city(index),
        airplane: airplane(index),
        price: price(index)
      )

      puts 'flight created' if flight.save
    end
  end

  private

  attr_reader :fleet_information

  def departure_city
    @departure_city ||= City.find_by(name: fleet_information[:from])
  end

  def arrival_city(index)
    City.find_by(name: fleet_information[:arrival_cities][index])
  end

  def duration(index)
    fleet_information[:durations][index]
  end

  def departure_date
    fleet_information[:start_date]
  end

  def fleet_size
    fleet_information[:arrival_cities].size
  end

  def airplane(index)
    fleet_information[:airplanes][index]
  end

  def price(index)
    fleet_information[:prices][index]
  end
end
