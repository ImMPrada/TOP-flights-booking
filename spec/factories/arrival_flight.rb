FactoryBot.define do
  factory :arrival_flight do
    association :airport
    association :flight
  end
end
