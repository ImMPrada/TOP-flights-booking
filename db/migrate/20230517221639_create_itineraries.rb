class CreateItineraries < ActiveRecord::Migration[7.0]
  def change
    create_table :itineraries do |t|
      t.string :number, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
