FactoryBot.define do
  factory :booking do
    number { "i_#{rand(1..30)}_#{rand(1..30)}" }

    association :user
    association :flight
  end
end
