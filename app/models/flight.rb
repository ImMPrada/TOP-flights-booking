class Flight < ApplicationRecord
  belongs_to :airplane
  has_many :itinerary_flights
  has_many :itineraries, through: :itinerary_flights
  has_many :deaperture_flights, dependent: :destroy
  has_many :deaperture_airports, through: :deaperture_flights, source: :airport
  has_many :arrival_flights, dependent: :destroy
  has_many :arrival_airports, through: :arrival_flights, source: :airport

  validates :number, presence: true, uniqueness: true
  validates :departure_date, presence: true
  validates :arrival_date, presence: true
  validates :price, presence: true
end
