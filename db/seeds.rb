# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = Category.create! [{name: :hotwire},{name: :rails},{name: :turbo}]

Article.create! name: "Hello, World", byline: :Till, content: "Lorem ipsum bla bla bla", categories: categories