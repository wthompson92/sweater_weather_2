# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  @user = User.create(email: 'wnt925@gmail.com', password: "123", password_confirmation: "123", api_key: "fa4b86f9bede0690f34c")
