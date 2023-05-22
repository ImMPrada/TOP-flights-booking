FactoryBot.define do
  factory :itinerary_passenger do
    association :itinerary
    association :passenger
  end
end
