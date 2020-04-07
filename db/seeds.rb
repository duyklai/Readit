# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'adminUser', email: 'admin@example.com', password: 'password', admin: true)

tag = Tag.create(name: 'general')

Post.create(user_id: user.id, points: 1, tag_id: tag.id, title: 'Welcome to Readit', body: 'Welcome to Readit! \n Disclaimer: This website is not associated in anyway with the real Reddit. This website was made to showcase my web-developing abilities should not be used to make a real Reddit account.')