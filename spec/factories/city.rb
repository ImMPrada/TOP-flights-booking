FactoryBot.define do
  factory :city do
    name { Faker::Address.city }

    association :country
  end
end
