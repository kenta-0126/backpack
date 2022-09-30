# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(
  id: 0, name: 'いつものかばん'
  )

Event.create!(
  id: 0, user_id: 0, title: '予定がありません', start_time: DateTime.tomorrow.to_time
  )
