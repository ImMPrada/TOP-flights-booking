class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.float :total_amount, null: false
      t.boolean :paid, null: false, default: false

      t.timestamps
    end
  end
end
