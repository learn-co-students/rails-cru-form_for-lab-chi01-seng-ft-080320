# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "destroy"

Artist.destroy_all
Genre.destroy_all
Song.destroy_all

puts "seeding Artists"

20.times do 
Artist.create(name: Faker::Music.band, bio: Faker::TvShows::DrWho.quote)
end

puts "seeding Genres"

7.times do 
    Genre.create(name: Faker::Music.genre)
end

puts "seeding Songs"

30.times do 
    Song.create(name: Faker::TvShows::Buffy.episode, artist_id: Artist.all.sample.id, genre_id: Genre.all.sample.id)
end