class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Bookings::Creator.with_just_amount_of_passengers(
      flight:,
      amount_of_passengers: params[:amount_of_passengers].to_i,
      user: current_user
    ).build
  end

  def create
    booking_creator.build
    redirect_to booking_path(booking_creator.commit)
  rescue StandardError => e
    redirect_to_booking_with_notice(e.message)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_creator
    @booking_creator ||= Bookings::Creator.new(
      flight:,
      booking_build_params: booking_params.to_h,
      user: current_user
    )
  end

  def current_user_passenger
    @current_user_passenger || current_user.passenger
  end

  def flight
    @flight ||= Flight.find(params[:flight_id])
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
end
