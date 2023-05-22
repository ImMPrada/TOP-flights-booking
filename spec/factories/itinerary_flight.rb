FactoryBot.define do
  factory :itinerary_flight do
    association :itinerary
    association :flight
  end
end
