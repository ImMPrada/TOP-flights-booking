class User < ApplicationRecord
  has_one :passenger

  validates :email, presence: true, uniqueness: true

  def flights
    passenger.flights
  end
end
