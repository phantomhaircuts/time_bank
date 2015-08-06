# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Transaction.destroy_all
Service.destroy_all
Profile.destroy_all
User.destroy_all



e_user = User.create!( username: "erik", password_digest: BCrypt::Password.create("erik") )
l_user = User.create!( username: "shy", password_digest: BCrypt::Password.create("shy") )

eanders8 = Profile.create(user: e_user, name: "Erik", about_me: "I am a thirty year old web developer and musician, living in Washington DC.", pic_url:"https://upload.wikimedia.org/wikipedia/en/2/2e/Pat-Morita_(Karate_Kid).jpg", time_bank: 5 )
littlewhale = Profile.create(user: l_user, name: "Shy", about_me: "I run the IT department at a law firm. I love dogs.", pic_url:"https://diversejapan.files.wordpress.com/2013/04/lady-snowblood.jpg", time_bank: 10)

production_lessons = Service.create(name: "Production Lessons", description:"An hour long one on one tutorial on Logic X.", profile: eanders8)
house_painting = Service.create(name: "House Painting", description:"Will paint the exterior of your home.", profile: littlewhale)
yoga_lesson = Service.create(name: "Yoga Lesson", description: "One hour long yoga lesson.", profile: eanders8)
