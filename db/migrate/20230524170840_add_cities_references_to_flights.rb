class AddCitiesReferencesToFlights < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :departure_city, null: false, foreign_key: { to_table: :cities }
    add_reference :flights, :arrival_city, null: false, foreign_key: { to_table: :cities }
  end
end
