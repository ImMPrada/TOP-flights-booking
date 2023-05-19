FactoryBot.define do
  factory :deaperture_flight do
    association :airport
    association :flight
  end
end
