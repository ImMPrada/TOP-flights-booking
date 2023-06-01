class Booking < ApplicationRecord
  has_many :booking_flights
  has_many :flights, through: :booking_flights
  has_many :booking_passengers
  has_many :passengers, through: :booking_passengers
  has_one :invoice
  belongs_to :user

  validates :number, presence: true, uniqueness: true
end
