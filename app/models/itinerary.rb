class Itinerary < ApplicationRecord
  has_many :itinerary_flights
  has_many :flights, through: :itinerary_flights
  has_many :itinerary_passengers
  has_many :passengers, through: :itinerary_passengers

  validates :name, presence: true
end
