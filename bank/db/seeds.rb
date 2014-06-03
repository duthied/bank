# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# AdminUser.create! do |au|
#   au.email = 'admin@example.com'
#   au.password = au.password_confirmation = 'password'
# end

User.create! do |u|
  u.card_number = '123123123'
  u.pin = '1234'
end

Account.create! do |a|
  a.title = 'Checking'
  a.balance = 123.45
  a.user_id = User.first.id
end