FactoryBot.define do
  factory :flight do
    number { Faker::Alphanumeric.alphanumeric(number: 6) }
    departure_date { Faker::Time.between(from: DateTime.now + 1, to: DateTime.now) }
    arrival_date { Faker::Time.between(from: DateTime.now + 3, to: DateTime.now + 2) }
    price { Faker::Number.decimal(l_digits: 2) }

    association :airplane
  end
end
