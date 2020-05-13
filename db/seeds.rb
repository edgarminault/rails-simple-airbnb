# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

puts 'Creating 20 fake flats...'
20.times do
  flat = Flat.new(
    name: Faker::DcComics.villain,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description:  Faker::Lorem.paragraph(sentence_count: 4),
    price_per_night: rand(30..3000),
    number_of_guests: rand(2..20)
  )
  flat.save!
  puts 'Flat added.'
end
puts 'Finished!'
