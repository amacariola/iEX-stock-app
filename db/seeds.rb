# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create([{ id: 1, name: 'Admin', description: 'Admin User' }, { id: 2, name: 'Broker', description: 'Stocks Manager' }, { id: 3, name: 'Buyer', description: 'Stocks Buyer' }])
