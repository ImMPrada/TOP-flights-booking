class Passenger < ApplicationRecord
  belongs_to :user, optional: true
  has_many :itinerary_passengers
  has_many :itineraries, through: :itinerary_passengers

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :pin, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
