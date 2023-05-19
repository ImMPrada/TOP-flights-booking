FactoryBot.define do
  factory :deapeture_flight do
    association :airport
    association :flight 
  end
end
