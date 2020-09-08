FactoryBot.define do
  factory :address do
    token = 'tok_146b44a5e7d276aade2c6fbde179'
    token { token }
    postal_code { '000-0000' }
    prefecture { Faker::Number.non_zero_digit }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    phone_number { Faker::Code.ean(base: 11) }
  end
end
