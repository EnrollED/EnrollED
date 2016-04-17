# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(username: 'admin', firstname: 'Admin', lastname: 'Strator', email: 'admin@example.com', password: 'supergeslo')
user.skip_confirmation!
user.save!

user.add_role :admin