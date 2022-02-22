# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Event.destroy_all
Participation.destroy_all
User.destroy_all

5.times do
    u = User.create(first_name: Faker::TvShows::SouthPark.character, last_name: Faker::TvShows::RickAndMorty.character, description: Faker::TvShows::HowIMetYourMother, password: '123456')
    u.email = u.first_name + '_' + u.last_name + '@mail.com'
    u.save
  end
  
  puts 'User : prêts'