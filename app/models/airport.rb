class Airport < ApplicationRecord
  belongs_to :city
  has_many :departure_flights, dependent: :destroy
  has_many :departures, through: :departure_flights, source: :flight
  has_many :arrival_flights, dependent: :destroy
  has_many :arrivals, through: :arrival_flights, source: :flight

  validates :name, presence: true
end
