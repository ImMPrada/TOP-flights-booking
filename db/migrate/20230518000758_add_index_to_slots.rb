class AddIndexToSlots < ActiveRecord::Migration[7.0]
  def change
    add_index :slots, %i[name airplane_id], unique: true
  end
end
