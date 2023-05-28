class Flight < ApplicationRecord
  belongs_to :airplane
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :departure_city, class_name: 'City'
  belongs_to :arrival_city, class_name: 'City'
  has_many :itinerary_flights
  has_many :itineraries, through: :itinerary_flights

  validates :number, presence: true, uniqueness: true
  validates :departure_date, presence: true
  validates :arrival_date, presence: true
  validates :price, presence: true

  scope :availables, -> { where('available = ? AND departure_date >= ?', true, Date.today + 4.hours) }
  scope :by_departure_date, ->(date) { where('departure_date >= ? AND departure_date < ?', date, date + 1.day) }
  scope :by_departure_city, ->(departure_city_id) { where(departure_city_id:) }
  scope :by_arrival_city, ->(arrival_city_id) { where(arrival_city_id:) }

  def self.search_departure_flights_for(filter_params)
    flights = Flight.availables
    if filter_params[:departure_date].present?
      flights = flights.by_departure_date(filter_params[:departure_date].to_date)
    end
    flights = flights.by_departure_city(filter_params[:departure_city_id]) if filter_params[:departure_city_id].present?
    flights = flights.by_arrival_city(filter_params[:arrival_city_id]) if filter_params[:arrival_city_id].present?

    flights
  end

  def available_seats
    airplane.seats.availables
  end
end
