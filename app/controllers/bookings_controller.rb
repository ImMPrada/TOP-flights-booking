class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    if current_user_passenger
      @booking.passengers << current_user_passenger
    else
      @booking.passengers << Passenger.new(user: current_user)
    end
    @booking.number = "#{flight.number}-#{DateTime.now.to_i}"
    @booking.flight = flight
  end

  def create
    byebug
  end

  private

  def current_user_passenger
    @current_user_passenger || current_user.passenger
  end

  def flight
    @flight ||= Flight.find(params[:flight_id])
  end
end
