class BookingMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.flight_booked.subject
  #
  def flight_booked(booking, passenger)
    @booking = booking
    @passenger = passenger

    mail to: passenger.email, subject: 'Flight Booked'
  end
end
