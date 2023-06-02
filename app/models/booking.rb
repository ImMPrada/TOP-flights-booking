class Booking < ApplicationRecord
  has_many :booking_passengers
  has_many :passengers, through: :booking_passengers
  has_one :invoice
  belongs_to :user
  belongs_to :flight

  validates :number, presence: true, uniqueness: true

  accepts_nested_attributes_for :flight, :passengers
end
