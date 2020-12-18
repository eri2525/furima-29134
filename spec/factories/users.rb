FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'ああああ' }
    last_name             { 'いいいい' }
    first_furigana        { 'アアアア' }
    last_furigana         { 'イイイイ' }
    birthday              { Faker::Date.in_date_period }
  end
end
