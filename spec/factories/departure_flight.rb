FactoryBot.define do
  factory :departure_flight do
    association :airport
    association :flight
  end
end
