class Seat < ApplicationRecord
  belongs_to :airplane

  validates :name, presence: true, uniqueness: { scope: :airplane_id }
  validates :available, presence: true
  validates :price, presence: true
end
