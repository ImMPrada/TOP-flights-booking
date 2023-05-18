FactoryBot.define do
  factory :airplane do
    model { "#{Faker::Name.initials(number: 5)}-#{rand(100..999)}" }
  end
end
