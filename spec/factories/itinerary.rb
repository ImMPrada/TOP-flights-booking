FactoryBot.define do
  factory :itinerary do
    number { "i_#{rand(1..30)}_#{rand(1..30)}" }
  end
end
