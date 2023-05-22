FactoryBot.define do
  factory :airport do
    name { "#{Faker::Address.city} airport" }

    association :city
  end
end
