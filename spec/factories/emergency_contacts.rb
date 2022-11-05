FactoryBot.define do
  factory :emergency_contact do
    name { Faker::Fantasy::Tolkien.character }
    phone_number { Faker::PhoneNumber.cell_phone }
    user
  end
end
