class CreatePassengerSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :passenger_seats do |t|
      t.references :passenger, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
