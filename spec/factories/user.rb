FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:5) }
    email { Faker::Lorem.characters(number:20) }
  end
end