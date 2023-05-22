class Flight < ApplicationRecord
  belongs_to :airplane
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :itinerary_flights
  has_many :itineraries, through: :itinerary_flights

  validates :number, presence: true, uniqueness: true
  validates :departure_date, presence: true
  validates :arrival_date, presence: true
  validates :price, presence: true
end
