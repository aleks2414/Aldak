# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


a01= User.create!({:email => "admin@andak.com", :password => "andak2018", :password_confirmation => "andak2018", :role => 'admin', :nombre => "Daniel romo",})
a02= User.create!({:email => "alejandroromo14@gmail.com", :password => "alejandro", :password_confirmation => "alejandro", :role => 'admin', :nombre => "Alejandro Romo",})
