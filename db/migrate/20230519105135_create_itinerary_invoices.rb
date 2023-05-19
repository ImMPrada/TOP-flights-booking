class CreateItineraryInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :flight_invoices do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
