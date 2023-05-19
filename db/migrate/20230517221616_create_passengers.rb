class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :pin, null: false
      t.string :email, null: false, index: { unique: true }

      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
