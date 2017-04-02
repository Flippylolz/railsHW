# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
100.times do |i|
  User.create(
      first_name: "first#{i}",
      last_name: "last#{i}",
      username: "username#{i}",
      email: "test#{i}@example.com",
      password: 'password',
      birthday: (Date.today - i.years)
  )
end
