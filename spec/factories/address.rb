FactoryBot.define do
  factory :address do
    token {  }
    postal_code { "000-0000" }
    prefecture { Faker::Number.non_zero_digit }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    phone_number { Faker::Code.ean(base: 11) }

    association :user
    association :item
  end
end
