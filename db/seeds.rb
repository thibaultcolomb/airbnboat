# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts 'Creating 10 fake boats...'

harri = User.new(
  email: 'hbesceasdfasdli@gmail.com',
  password: '123456haysoekso!',
  first_name: 'Harri',
  last_name: 'Besceli',
  bio: 'I am a sailor',
  age: 30,
  license: true
)
harri.save!

20.times do
  boat = harri.boats.new(
    name: Faker::Creature::Animal.name,
    port: ['Los Angeles', 'Hamburg', 'Antwerp', 'Portsmouth', 'Shanghai'].sample,
    capacity: rand(1..10),
    category: ['Sailboat', 'Motorboat', 'Catamaran', 'Yacht', 'Dinghy'].sample,
    price_per_day: rand(100..1000),
    license: [true, false].sample,
    description: Faker::Quote.mitch_hedberg,
    image: 'https://source.unsplash.com/random'
  )
  boat.save!
end
