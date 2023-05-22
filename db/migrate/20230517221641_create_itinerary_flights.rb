class CreateItineraryFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :itinerary_flights do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
