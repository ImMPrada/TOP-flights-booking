class DropBookingFlights < ActiveRecord::Migration[7.0]
  def change
    drop_table :booking_flights
  end
end
