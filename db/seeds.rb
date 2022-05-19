# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Profile.destroy_all
Reservation.destroy_all
Review.destroy_all

u1 = User.create!(
  first_name: "Tom",
  last_name: "Levis",
  email: 'tomlevis@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

u2 = User.create!(
  first_name: "Robert",
  last_name: "Parkinson",
  email: 'rebertparkinson@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

u3 = User.create!(
  first_name: "Brad",
  last_name: "Cage",
  email: 'bradcage@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)

v1 = Profile.new(
  description: 'Daniela, 32',
  location: 'Lima',
  price: 80,
  phone_number: '+543434576982'
)
v1.user = u1
v1.save

v2 = Profile.new(
  description: 'Lucas, 23',
  location: 'Santiago',
  price: 90,
  phone_number: '+543436576982'
)
v2.user = u2
v2.save

v3 = Profile.new(
  description: 'Tomas, 29',
  location: 'Buenos Aires',
  price: 60,
  phone_number: '+543436576985'
)
v3.user = u3
v3.save

v4 = Profile.new(
  description: 'Maricel, 35',
  location: 'Bogotá',
  price: 95,
  phone_number: '+543736576982'
)
v4.user = u3
v4.save

v5 = Profile.new(
  description: 'Lucas, 23',
  location: 'Santiago',
  price: 90,
  phone_number: '+543436576982'
)
v5.user = u2
v5.save

v6 = Profile.new(
  description: 'Marcos, 38',
  location: 'Medellín',
  price: 75,
  phone_number: '+543436576982'
)
v6.user = u1
v6.save

r1 = Reservation.new(
  start_time: DateTime.new(2022,5,11,20,0,0),
  end_time: DateTime.new(2022,6,11,20,0,0),
  observation: 'Hola, mi perro es celíaco',
  phone_number: '+543436576985'
)
r1.user = u1
r1.profile = v1
r1.save

r2 = Reservation.new(
  start_time: DateTime.new(2022,6,23,20,0,0),
  end_time: DateTime.new(2022,6,28,20,0,0),
  observation: 'Hola, mi gato Loly toma leche',
  phone_number: '+543436576985'
)
r2.user = u2
r2.profile = v2
r2.save

r3 = Reservation.new(
  start_time: DateTime.new(2022,10,12,15,0,0),
  end_time: DateTime.new(2022,10,18,15,0,0),
  observation: 'Hola, mi perra come alimento balanceado especial',
  phone_number: '+543436576985'
)
r3.user = u3
r3.profile = v3
r1.save

rw1 = Review.new(
  content:'Excellent experience!',
  rating: 4,
  reservation_id: 1
)
rw1.reservation = r1
rw1.save

rw2 = Review.new(
  content:'100% recommended',
  rating: 5
)
rw2.reservation = r2
rw2.save

rw3 = Review.new(
  content:'Everything was perfect!',
  rating: 5
)
rw3.reservation = r3
rw3.save
