# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artist.destroy_all
Genre.destroy_all
Song.destroy_all

10.times do 
	artist = Artist.create(name: Faker::Music.band)
	genre = Genre.create(name: Faker::Music.genre)
	song = Song.create(name: Faker::Music::GratefulDead.song, artist: artist, genre: genre)
end