# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "ror@gmail.com", password: "password")

Product.create(name: "Learn RoR - Beginner",
                price: 50, image: File.open("#{Rails.root}/public/1.jpg"))
Product.create(name: "Mastering RoR - Level over 9000",
            price: 30, image: File.open("#{Rails.root}/public/2.jpg"))