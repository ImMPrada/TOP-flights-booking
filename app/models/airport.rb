class Airport < ApplicationRecord
  belongs_to :city
  has_many :departure_flights, foreign_key: :departure_airport_id, class_name: 'Flight'
  has_many :arrival_flights, foreign_key: :arrival_airport_id, class_name: 'Flight'

  validates :name, presence: true
end
