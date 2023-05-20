FactoryBot.define do
  factory :invoice do
    number { "invoice_#{rand(1..30)}" }
    paid { 'true' }
    total_amount { Faker::Number.decimal(l_digits: 2) }

    association :itinerary
  end
end
