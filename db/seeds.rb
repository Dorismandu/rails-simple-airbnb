require "faker"

puts "Clean up Flat DB"
Flat.destroy_all
puts "Flat DB cleaned!"

def flat_name
  adjs = ["Beautiful", "Hidden", "Secret", "Misty", "Silent", "Large", "Cozy", "Amazing"]
  nouns = ["flat", "appartment", "villa", "studio", "room", "loft"]
  precise = ["with a view", "close to the city center", "perfect for family", "by the sea"]

  [adjs.sample, nouns.sample, precise.sample].join(' ')
end

4.times do 
  @flat = Flat.new(
    name: flat_name,
    address: Faker::Address.street_name ,
    description: "Great flat with " + Faker::House.room + " that has many " + Faker::House.furniture,
    price_per_night: rand(30..300),
    pic_url: "https://source.unsplash.com/random/800x600",
    number_of_guests: rand(1..6)
  )
  @flat.save
  puts "flat added!"
end
puts "seeding done!"
