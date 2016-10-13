User.all.destroy_all
Visit.all.destroy_all
Place.all.destroy_all

username = Faker::Internet.user_name
email = Faker::Internet.email
city = Faker::Address.city
country = Faker::Address.country
state = Faker::Address.state
lat = Faker::Address.latitude
lng = Faker::Address.longitude

users = []
5.times do |i|
  users << User.create(username: Faker::Internet.user_name,
                       email:    Faker::Internet.email,
                       password: "pass")
end

places = []
10.times do |i|
  places << Place.create(city:    Faker::Address.city,
                         country: Faker::Address.country,
                         state:   state = Faker::Address.state,
                         lat:     Faker::Address.latitude,
                         lng:     Faker::Address.longitude)
end

20.times do |i|
  Visit.create(user_id:  users.sample.id,
               place_id: places.sample.id)
end
