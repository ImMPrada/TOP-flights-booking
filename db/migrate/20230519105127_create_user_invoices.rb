class CreateUserInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :user_invoices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
