# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
until Book.count == 100
    title = Faker::Book.title
    author = Faker::Book.author
    genre = Faker::Book.genre
    description = Faker::Quote.matz
    collection = Faker::Games::SuperSmashBros.stage
    isbn = rand(1000000000000..9999999999999)
    price = rand(9.99..999.99)
    Book.create(title: title, author: author, genre: genre, collection: collection, isbn: isbn, price: price, description: description)
end