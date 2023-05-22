class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.string :name, null: false
      t.string :available, null: false, default: true
      t.float :price, null: false

      t.references :airplane, null: false, foreign_key: true

      t.timestamps
    end
  end
end
