FactoryBot.define do
  factory :booking_flight do
    association :booking
    association :flight
  end
end
