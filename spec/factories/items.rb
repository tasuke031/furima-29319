FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    description { Faker::Lorem.sentence }
    category { Faker::Number.non_zero_digit }
    status { Faker::Number.non_zero_digit }
    delivery_fee { Faker::Number.non_zero_digit }
    prefecture { Faker::Number.non_zero_digit }
    delivery_day { Faker::Number.non_zero_digit }

    association :user
  end
end
