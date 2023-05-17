class CreateDeapertureFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :deaperture_flights do |t|
      t.references :airport, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
