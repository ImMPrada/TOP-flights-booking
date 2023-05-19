class ItineraryFlight < ApplicationRecord
  belongs_to :itinerary
  belongs_to :flight
end
