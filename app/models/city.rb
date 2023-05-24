class City < ApplicationRecord
  belongs_to :country
  has_many :airports
  has_many :departure_flights, through: :airports
  has_many :arrival_flights, through: :airports

  validates :name, presence: true

  def self.all_cities_with_country_symbol
    joins(:country).select('cities.id', 'cities.name', 'countries.symbol as country_symbol')
  end
end
