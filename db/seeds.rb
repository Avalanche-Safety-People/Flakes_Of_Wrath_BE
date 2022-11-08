# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bob = User.create!(uid: "123", provider: "google", name: "bob", email: "bob@gmail.com", favorite_zone: 427)
sally = User.create!(uid: "123", provider: "google", name: "sally", email: "sally@gmail.com")

bob.emergency_contacts.create!(name: "mommy", phone_number: "1 800 588 2300")
bob.emergency_contacts.create!(name: "Darth Vader", phone_number: "911")

bob.trips.create!(name: "Adventure is out there", zone_id: 88, start_date: "2023-2-3", description: "very moist")
bob.trips.create!(name: "Prom Night!", zone_id: 4, start_date: "2023-7-3", description: "#YOLO")