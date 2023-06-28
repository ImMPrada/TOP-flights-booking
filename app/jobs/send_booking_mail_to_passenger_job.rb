class SendBookingMailToPassengerJob < ApplicationJob
  def perform(booking)
    booking.passengers.each do |passenger|
      BookingMailer.flight_booked(booking, passenger).deliver_later
    end
  end
end
