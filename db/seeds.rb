# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
eanders8 = Profile.create(name: "Erik", about_me: "I am a thirty year old web developer and musician, living in Washington DC.", pic_url:"https://upload.wikimedia.org/wikipedia/en/2/2e/Pat-Morita_(Karate_Kid).jpg", time_bank: 5 )
littlewhale = Profile.create(name: "Shy", about_me: "I run the IT department at a law firm. I love dogs.", pic_url:"https://diversejapan.files.wordpress.com/2013/04/lady-snowblood.jpg", time_bank: 10)

production_lessons = Service.create(name: "Production Lessons", description:"An hour long one on one tutorial on Logic X.", profile_id: 1)
house_painting = Service.create(name: "House Painting", description:"Will paint the exterior of your home.", profile_id: 2)
yoga_lesson = Service.create(name: "Yoga Lesson", description: "One hour long yoga lesson.", profile_id: 2)
