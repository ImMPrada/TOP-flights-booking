FactoryBot.define do
  factory :passenger do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    identification_number { Faker::Number.number }
    email { Faker::Internet.email }

    trait :is_user do
      association :user
      email { user.email }
    end
  end
end
