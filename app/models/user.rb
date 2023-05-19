class User < ApplicationRecord
  has_one :passenger
  has_many :invoices
  has_many :itineraries, through: :invoices

  validates :email, presence: true, uniqueness: true

  def flights
    passenger.flights
  end
end
