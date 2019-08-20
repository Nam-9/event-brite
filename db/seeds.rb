# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Attendance.destroy_all
Event.destroy_all
User.destroy_all


require 'faker'

 2.times do

    user = User.create(first_name: Faker::Name.first_name, 
                       last_name: Faker::Name.last_name,
                       description:Faker::TvShows::HowIMetYourMother.quote, 
                       email:"#{Faker::Name.first_name}@yopmail.com", 
                       password: Faker::Internet.password)

    

end

puts "User ok"

20.times do

    event = Event.create( title: "Mon super event",
                         description:Faker::TvShows::HowIMetYourMother.quote,

                    price: rand(1...1000),

                    location: Faker::Address.city,

                    start_date: Faker::Date.forward,

                    duration: 5*rand(1..120),

                    admin: User.all.sample)
 i+= 1
end

puts "Event added"

10.times do

    attendance = Attendance.create(stripe_customer_id: Faker::Lorem.characters, 
                                   event: Event.all.sample,
                                   participant: User.all.sample)

 
end

puts "Attendance created"



		                   
