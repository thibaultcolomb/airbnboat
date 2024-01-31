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



# puts 'Creating 10 fake stuff...'

# 10.times do
#   new_user = User.new(
#     email: Faker::Internet.email,
#     password: '123456',
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     bio: Faker::Quote.mitch_hedberg,
#     age: rand(18..60),
#     license: [true, false].sample
#   )
#   new_user.save!
# end

# 20.times do
#   boat = Boat.new(
#     name: Faker::Creature::Animal.name,
#     port: ['Los Angeles', 'Hamburg', 'Antwerp', 'Portsmouth', 'Shanghai'].sample,
#     capacity: rand(1..10),
#     category: ['Sailboat', 'Motorboat', 'Catamaran', 'Yacht', 'Dinghy'].sample,
#     price_per_day: rand(100..1000),
#     license: [true, false].sample,
#     description: Faker::Quote.mitch_hedberg,
#     image: 'https://source.unsplash.com/random',
#     user: User.all.sample
#   )
#   boat.save!
# end

# 15.times do
#   booking = Booking.new(
#     start_date: Faker::Date.between(from: '2021-01-01', to: '2021-01-07'),
#     end_date: Faker::Date.between(from: '2021-01-08', to: '2021-03-25'),
#     user: User.all.sample,
#     boat: Boat.all.sample,
#     confirmed: [true, false].sample
#   )
#   booking.save!
# end

2.times do
  booking = Booking.new(
    start_date: Faker::Date.between(from: '2021-01-01', to: '2021-01-07'),
    end_date: Faker::Date.between(from: '2021-01-08', to: '2021-03-25'),
    user: User.all.sample,
    boat: User.find(2).boats.first,
    confirmed: [true, false].sample
  )
  booking.save!
end

puts 'finished fakery'
