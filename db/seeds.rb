# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destruction des tables :"
User.destroy_all
print "User, "
Event.destroy_all
print "Event, "
Attendance.destroy_all
print "Attendance."


puts "\n\nCréation des users"
u = 1
users = 10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(domain: 'yopmail.com'),
    description: Faker::Lorem.sentences,
    encrypted_password: Faker::Device.serial)
    print "User #{u} crée ! "
    u += 1
end

puts "\n\nCréation des events"
e = 1
events = 10.times do
  Event.create!(
    start_date: Faker::Date.forward(days: 365),
    duration: 120,
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.sentences,
    price:Faker::Commerce.price,
    location:Faker::Address.full_address)
    print "Event #{e} crée ! "
    e += 1
end

puts "\n\nCréation des attendances"
a = 1
10.times do
  Attendance.create!(stripe_customer_id: Faker::Finance.credit_card,
    event: Event.all.sample,
    user: User.all.sample)
  print "Attendance #{a} crée ! "
  a += 1
end

puts "\n\nCréation des seeds terminée !"