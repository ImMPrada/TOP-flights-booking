class Slot < ApplicationRecord
  belongs_to :airplane

  validates :name, uniqueness: { scope: :airplane_id }
  validates :name, presence: true
  validates :available, presence: true
  validates :price, presence: true
end
