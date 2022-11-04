FactoryBot.define do
  factory :user do
    uid { Faker::Fantasy::Tolkien.location }
    provider { "google" }
    name { Faker::Fantasy::Tolkien.character }
    email { Faker::Internet.email }
    favorite_zone { Faker::Number.number(digits: 3) }
  end
end
