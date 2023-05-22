FactoryBot.define do
  factory :country do
    name { Faker::Address.country }
    symbol { Faker::Address.country_code }
  end
end
