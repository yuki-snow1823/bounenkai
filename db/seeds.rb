# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  id: 105,
  email: 'konoakauntode-roguinshitene@nomikai.com',
  password: 111111,
  name: 'nonbe',
)

Book.create!(
  user_id: 105,
  title: "hoge",
  body: "hoge"
)
