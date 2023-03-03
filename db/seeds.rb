# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

genres = ["Rock", "Jazz", "Electronic", "Pop", "Hip-hop", "Funk", "Soul", "Disco"]
Review.destroy_all
Reservation.destroy_all
Record.destroy_all
User.destroy_all

albums_string = ["https://www.billboard.com/wp-content/uploads/2022/03/23.-Miles-Davis-%E2%80%98Bitches-Brew-1969-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/28.-Bruce-Springsteen-%E2%80%98Born-in-the-U.S.A.-1984-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/29.-Aretha-Franklin-%E2%80%98I-Never-Loved-a-Man-the-Way-I-Loved-You-1967-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/33.-Kanye-West-%E2%80%98My-Beautiful-Dark-Twisted-Fantasy-2010-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/36.-Joni-Mitchell-%E2%80%98Hejira-1976-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/15.-Nas-%E2%80%98Illmatic-1994-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/11.-The-Beatles-%E2%80%98Sgt.-Peppers-Lonely-Hearts-Club-Band-1967-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/9.-Public-Enemy-%E2%80%98Fear-of-a-Black-Planet-1990-album-art-2022-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/6.-Pink-Floyd-%E2%80%98Dark-Side-of-the-Moon-1973-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/3.-Patti-Smith-%E2%80%98Horses-1975-album-art-billboard-1240.jpg?w=1140", "https://www.billboard.com/wp-content/uploads/2022/03/1.-The-Velvet-Underground-and-Nico-%E2%80%98The-Velvet-Underground-Nico-1967-album-art-2022-billboard-1240.jpg?w=1037", "https://www.billboard.com/wp-content/uploads/2022/03/8.-Cyndi-Lauper-%E2%80%98Shes-So-Unusual-1983-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/10.-Elvis-Presley-%E2%80%98Elvis-Presley-1956-album-art-billboard-1240.jpg?w=1140", "https://www.billboard.com/wp-content/uploads/2022/03/12.-Hole-%E2%80%98Live-Through-This-1994-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/13.-Kendrick-Lamar-To-Pimp-a-Butterfly-2015-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/16.-The-Clash-%E2%80%98London-Calling-1979-album-art-billboard-1240.jpg?w=1030", "https://www.billboard.com/wp-content/uploads/2022/03/18.-The-Roots-%E2%80%98Things-Fall-Apart-1999-album-art-billboard-1240.jpg?w=1033", "https://www.billboard.com/wp-content/uploads/2022/03/20.-Joy-Division-%E2%80%98Unknown-Pleasures-1979-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/21.-Duran-Duran-%E2%80%98Rio-1982-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/22.-Drake-If-Youre-Reading-This-Its-Too-Late-2015-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/25.-David-Bowie-%E2%80%98Aladdin-Sane-1973-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/30.-FKA-Twigs-%E2%80%98LP1-2014-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/31.-Sex-Pistols-%E2%80%98Never-Mind-the-Bollocks-Heres-The-Sex-Pistols-1977-album-art-billboard-1240.jpg?w=1240", "https://www.billboard.com/wp-content/uploads/2022/03/35.-Metallica-%E2%80%98Master-of-Puppets-1986-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/37.-Madonna-%E2%80%98True-Blue-1986-album-cover-billboard-1240.jpg?w=1032", "https://www.billboard.com/wp-content/uploads/media/ariana-grande-sweetner-album-art-2018-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/39.-Johnny-Cash-%E2%80%98American-IV-The-Man-Comes-Around-2002-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/41.-No-Doubt-%E2%80%98Tragic-Kingdom-1995-album-art-billbooard-1240.jpg?w=1026", "https://www.billboard.com/wp-content/uploads/2022/03/42.-Nicki-Minaj-%E2%80%98The-Pinkprint-2014-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/44.-Whitney-Houston-%E2%80%98Whitney-Houston-1985-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/media/cardi-b-invasion-of-privacy-album-art-2018-billboard-embed.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/46.-Funkadelic-%E2%80%98Maggot-Brain-1971-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/47.-Janet-Jackson-%E2%80%98Rhythm-Nation-1814-1989-album-at-billboard-1240.jpg?w=1240", "https://www.billboard.com/wp-content/uploads/2022/03/48.-Lady-Gaga-%E2%80%98The-Fame-Monster-2009-album-art-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/media/Young-Thug-Jeffery-2016-billboard-1240.jpg?w=1024", "https://www.billboard.com/wp-content/uploads/2022/03/50.-Taylor-Swift-%E2%80%981989-2014-album-art-billboard-1240.jpg?w=1024"]

index = 0
count = 20
count.times do
  user = User.create!(
    owner: [true, false].sample,
    email: Faker::Internet.email,
    name: Faker::Name.name,
    password: "lewagon123")

  record = Record.create!(
    title: Faker::Music.album,
    artist: Faker::Music.band,
    genre: genres.sample,
    location: Faker::Address.city,
    price: rand(1..10),
    user_id: user.id
    )
    record.photo.attach(io: URI.open(albums_string[index]), filename: "#{record.title}", content_type: "image/jpg")
    index += 1
    puts "#{record.photo.attached?} #{Record.count} / #{count}"

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
