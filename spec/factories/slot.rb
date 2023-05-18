FactoryBot.define do
  factory :slot do
    name { "#{rand('A'..'F')}#{rand(1..30)}" }
    available { true }
    price { Faker::Number.decimal(l_digits: 2) }

    association :airplane
  end
end
