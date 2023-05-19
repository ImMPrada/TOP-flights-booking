FactoryBot.define do
  factory :slot do
    name { "A#{rand(1..30)}" }
    available { true }
    price { Faker::Number.decimal(l_digits: 5) }

    association :airplane
  end
end
