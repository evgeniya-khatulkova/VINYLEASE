# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

Review.destroy_all
Reservation.destroy_all
Record.destroy_all
User.destroy_all

5.times do
  user = User.create!(
    owner: [true, false].sample,
    email: Faker::Internet.email,
    name: Faker::Name.name,
    password: "lewagon123")

  record = Record.create!(
    title: Faker::Music.album,
    artist: Faker::Music.band,
    genre: GENRES.sample,
    location: Faker::Address.city,
    price: rand(1..10),
    user_id: user.id)

  reservation = Reservation.create!(
    start_date: Faker::Date.between(from: '2023-03-01', to: '2023-03-10'),
    end_date: Faker::Date.between(from: '2023-03-11', to: '2023-03-15'),
    user_id: user.id,
    record_id: record.id)

    Review.create!(
    content: Faker::Quote.yoda,
    rating: rand(1..5),
    reservation_id: reservation.id)
end
