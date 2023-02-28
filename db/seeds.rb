# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

5.times do
  user = User.create!(
    owner: [true, false].sample,
    email: Faker::Internet.email,
    password: "lewagon123")

    Record.create!(
    title: Faker::Music.album,
    artist: Faker::Music.band,
    genre: GENRES.sample,
    location: Faker::Address.city,
    price: rand(1..10),
    user_id: user.id)
end
