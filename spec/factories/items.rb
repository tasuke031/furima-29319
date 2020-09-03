FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    price { Faker::Number.between(300..9_999_999) }
    description { Faker::Lorem.sentence }
    category { Faker::Number.between(0..10) }
    status { Faker::Number.between(0..6) }
    delivery_fee { Faker::Number.between(0..2) }
    prefecture { Faker::Number.between(0..47) }
    delivery_day { Faker::Number.between(0..3) }

    association :user
  end
end
