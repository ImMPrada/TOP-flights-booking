module Bookings
  class Creator
    attr_writer :amount_of_passengers

    def self.with_just_amount_of_passengers(flight:, user:, amount_of_passengers:)
      bookings_creator = new(flight:, user:, booking_build_params: nil)
      bookings_creator.amount_of_passengers = amount_of_passengers

      bookings_creator
    end

    def initialize(flight:, user:, booking_build_params:)
      @flight = flight
      @user = user
      @booking_build_params = booking_build_params
    end

    def build
      raise error_message(booking.errors) unless booking.valid?

      booking.passengers << user.passenger
      add_empty_passengers
      booking
    end

    def commit
      raise error_message('There are no passengers to save') unless booking.passengers.any?

      add_passengers_to_booking
      booking.save
      booking
    end

    private

    attr_reader :flight, :user, :booking_build_params

    def booking
      @booking ||= Booking.new(
        number: "#{flight.number}-#{DateTime.now.to_i}#{rand(100)}}",
        user:,
        flight:
      )
    end

    def passengers_attributes
      @passengers_attributes ||= booking_build_params[:passengers_attributes].map { |_key, value| value }
    end

    def amount_of_passengers
      @amount_of_passengers ||= passengers_attributes.size
    end

    def add_passengers_to_booking
      return unless amount_of_passengers.positive?

      all_passengers = booking.passengers
      index = 0
      passengers_attributes.each do |passenger_attributes|
        passenger = all_passengers[index]
        raise error_message(passenger.errors) unless passenger.update(passenger_attributes)

        index += 1
      end
    end

    def add_empty_passengers
      return unless amount_of_passengers.positive?

      (1...amount_of_passengers).each do |_passenger_count|
        booking.passengers << Passenger.new
      end
    end

    def error_message(errors)
      StandardError.new("There are some errors: #{errors.full_messages.join(', ')}")
    end
  end
end
