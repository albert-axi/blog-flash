# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.create(title: "Post 1", content: "Post 1 content")
Post.create(title: "Post 2", content: "Post 2 content")
Post.create(title: "Post 3", content: "Post 3 content")
Post.create(title: "Post 4", content: "Post 4 content")

Author.create(name: "Rio")
Author.create(name: "Blake")
Author.create(name: "Vincci")
Author.create(name: "Jess")

Category.create(name: "Lifestyle")
Category.create(name: "Programming")
Category.create(name: "Business")
Category.create(name: "Health")

lifestyle = Category.find_by(name: "Lifestyle")
programming = Category.find_by(name: "Programming")

chanel = Author.create(name:"Chanel")

post1 = chanel.posts.build(title: "The Post 1", content: "Post 1 content")
post1.save
post2 = chanel.posts.build(title: "The Post 2", content: "Post 2 content")
post2.save

lifestyle.posts << post1
lifestyle.posts << Post.first
programming.posts << post2
post1.categories << programming
