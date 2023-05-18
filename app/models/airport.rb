class Airport < ApplicationRecord
  belongs_to :city
  has_many :deaperture_flights, dependent: :destroy
  has_many :deapertures, through: :deaperture_flights, source: :flight
  has_many :arrivals, through: :arrival_flights, source: :flight

  validates :name, presence: true
end
