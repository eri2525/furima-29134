FactoryBot.define do
  factory :user_transaction do
    postal_code       { '123-4567' }
    prefecture_id     { Faker::Number.within(range: 2..48) }
    municipality      { '東村山市' }
    address           { '青山1-1-1' }
    phone_number      { '11122223333' }
    user_id           { 1 }
    item_id           { 10 }
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
