class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    add_passangers_fields_to_booking
    @booking.flight = flight
  end

  def create
    return render :new, alert: 'nope' unless booking.save
    unless update_current_user_passenger
      return redirect_to_booking_with_notice('Please check the logged-in passenger information')
    end
    unless add_passengers_to_booking
      return redirect_to_booking_with_notice('There is empty information of some(s) passengr(s)')
    end

    redirect_to booking_path(booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def current_user_passenger
    @current_user_passenger || current_user.passenger
  end

  def flight
    @flight ||= Flight.find(params[:flight_id])
  end

  def booking
    @booking ||= build_booking
  end

  def amount_of_passengers
    params[:amount_of_passengers].to_i
  end

  def redirect_to_booking_with_notice(message)
    redirect_to(
      new_flight_booking_path(flight, { amount_of_passengers: params[:amount_of_passengers] }),
      alert: message
    )
  end

  def booking_params
    params.require(:booking).permit(
      passengers_attributes: %i[id
                                first_name
                                last_name
                                identification_number
                                email]
    )
  end

  def add_passangers_fields_to_booking
    add_current_user_to_passengers
    extra_passengers = amount_of_passengers - 1
    return unless extra_passengers.positive?

    (1..extra_passengers).each do
      @booking.passengers << Passenger.new
    end
  end

  def add_current_user_to_passengers
    return @booking.passengers << current_user_passenger if current_user_passenger

    @booking.passengers << Passenger.new(user: current_user)
  end

  def build_booking
    @booking = Booking.new(
      number: "#{flight.number}-#{DateTime.now.to_i}",
      user: current_user,
      flight:
    )
  end

  def add_passengers_to_booking
    extra_passengers = amount_of_passengers - 1
    return unless extra_passengers.positive?

    (1..extra_passengers).each do |index|
      passenger = Passenger.new(booking_params[:passengers_attributes][index.to_s])
      @booking.passengers << passenger and next if passenger.save
    end
  end

  def update_current_user_passenger
    current_user_passenger = current_user.passenger

    current_user_passenger.update(booking_params[:passengers_attributes]['0'])
  end
end
