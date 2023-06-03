module ModelsServices
  module Creators
    class Bookings
      attr_reader :booking

      def initialize(params)
        @flight = params[:flight]
        @user = params[:user]
        @booking_build_params = params[:booking_build_params]
      end

      def build
        @booking = Booking.new(
          number: "#{flight.number}-#{DateTime.now.to_i}",
          user:,
          flight:
        )
      end

      def booking_valid?
        booking.valid?
      end

      def update_current_user_passenger
        user.passenger.update(passengers_attributes.first)
      end

      def add_passengers_to_booking
        return unless extra_passengers.positive?

        passengers_attributes[1, extra_passengers].each do |passenger_attributes|
          passenger = Passenger.new(passenger_attributes)
          return false unless passenger.valid?

          @booking.passengers << passenger
        end
      end

      def commit
        booking.passengers[1, extra_passengers].each(&:save) if extra_passengers.positive?
        booking.save

        booking
      end

      private

      attr_reader :flight, :user, :booking_build_params

      def passengers_attributes
        @passengers_attributes ||= booking_build_params[:passengers_attributes].map {|key, value| value}
      end

      def extra_passengers
        passengers_attributes.size - 1
      end
    end
  end
end
