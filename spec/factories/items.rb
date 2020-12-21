FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 2..11) }
    condition_id { Faker::Number.within(range: 2..7) }
    delivery_fee_id { Faker::Number.within(range: 2..3) }
    delivery_time_id { Faker::Number.within(range: 2..4) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    price { Faker::Number.positive }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
