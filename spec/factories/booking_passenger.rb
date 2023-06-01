FactoryBot.define do
  factory :booking_passenger do
    association :booking
    association :passenger
  end
end
