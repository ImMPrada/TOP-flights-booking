class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :number, null: false, index: { unique: true }
      t.datetime :departure_date, null: false
      t.datetime :arrival_date, null: false
      t.float :price, null: false
      t.boolean :available, null: false, default: true

      t.references :airplane, null: false, foreign_key: true
      t.references :departure_airport, null: false, foreign_key: { to_table: :airports }
      t.references :arrival_airport, null: false, foreign_key: { to_table: :airports }
      t.timestamps
    end
  end
end
