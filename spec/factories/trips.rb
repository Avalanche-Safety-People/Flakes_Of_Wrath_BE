FactoryBot.define do
  factory :trip do
    name { Faker::Name.name }
    zone_id { Faker::Number.number(digits: 3) }
    start_date { Faker::Date.between(from: Date.today, to: 5.days.from_now) }
    description { Faker::Creature::Bird.color }
    user
  end
end
