class AddIndexToSlots < ActiveRecord::Migration[7.0]
  def change
    add_index :slots, %i[airplane_id name], unique: true
  end
end
