class CreateAirplanes < ActiveRecord::Migration[7.0]
  def change
    create_table :airplanes do |t|
      t.string :model, null: false

      t.timestamps
    end
  end
end
