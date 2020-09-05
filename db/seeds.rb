# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

###Users###

person1 = User.create(first_name: "Anna", last_name: "Kim", username: "iannakim", password: "abc123", bio: "I am Anna")
person2 = User.create(first_name: "Waverley", last_name: "Leung", username: "wavey", password: "123abc", bio: "I am Waverley")














































puts "🦄🦄🦄🦄🦄🦄🦄"