class AddIndexToPassengerFlights < ActiveRecord::Migration[7.0]
  def change
    add_index :passenger_flights, %i[user_id flight_id]
  end
end
