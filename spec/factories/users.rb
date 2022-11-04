FactoryBot.define do
  factory :user do
    name { Faker::Fantasy::Tolkien.character }
    uid   { Faker::Name.name }
    provider { "googleoauth2" }
    email { Faker::Internet.email }
    favorite_zone { Faker::Fantasy::Tolkien.location }
  end
end
