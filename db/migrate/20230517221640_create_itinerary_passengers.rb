class CreateItineraryPassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :itinerary_passengers do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :passenger, null: false, foreign_key: true

      t.timestamps
    end
  end
end
