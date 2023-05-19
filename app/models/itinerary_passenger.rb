class ItineraryPassenger < ApplicationRecord
  belongs_to :itinerary
  belongs_to :passenger
end
