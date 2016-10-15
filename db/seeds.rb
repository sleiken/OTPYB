User.all.destroy_all
Visit.all.destroy_all
Place.all.destroy_all

users = []
5.times do |i|
  users << User.create(username: Faker::Internet.user_name,
                       email:    Faker::Internet.email,
                       password: "password")
end

placeIds = ["ChIJIQBpAG2ahYAR_6128GcTUEo", "ChIJW-T2Wt7Gt4kRKl2I1CJFUsI", "ChIJdd4hrwug2EcRmSrV3Vo6llI", "ChIJRcbZaklDXz4RYlEphFBu5r0", "ChIJOwg_06VPwokRYv534QaPC8g", "ChIJD7fiBh9u5kcRYJSMaMOCCwQ", "ChIJLRNM8FyHCw0ReuG0v3HFv3Y", "ChIJs0-pQ_FzhlQRi_OBm-qWkbs", "ChIJs04fT-N98CER-YLAvAgGEd8", "ChIJybDUc_xKtUYRTM9XV8zWRD0", "ChIJuSwU55ZS8DURiqkPryBWYrk", "ChIJgf0RD69C1moR4OeMIXVWBAU"]
places = []
12.times do |i|
  places << Place.create!(placeId: placeIds[i])
  # places << Place.create(city:    Faker::Address.city,
  #                        country: Faker::Address.country,
  #                        state:   Faker::Address.state,
  #                        lat:     Faker::Address.latitude,
  #                        lng:     Faker::Address.longitude)
end

20.times do |i|
  Visit.create(user_id:  users.sample.id,
               place_id: places.sample.id)
end
