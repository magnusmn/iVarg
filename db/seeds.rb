# encoding: utf-8 

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "DELETING ALL ENTRIES IN THE STATE DATABASE"

State.destroy_all
City.destroy_all

all_states=%w[ Blekinge Bohuslän Dalarna Dalsland Gotland Gästrikland Halland
               Hälsingland Härjedalen Jämtland Lappland Medelpad Norrbotten
               Närke Skåne Småland Södermanland Uppland Värmland Västerbotten
               Västergötland Västmanland Ångermanland Öland Östergötland ]
#id=1
#all_states.each do |state|
#  puts "Creating state: #{state}; ID #{id}"
#  State.create!(id: id, name: state)
#  id = id+1
#end


all_cities = [
  { "Blekinge" => %w[ Karlskrona ] },
  { "Bohuslän" => %w[ Göteborg ] },
  { "Skåne"    => %w[ Malmö Lund ] },
]

all_cities.each do |a|
  state=State.create(name: a.keys)
  a.values.each do |city|
    state.cities.create(name: city)
    puts city
  end 
end
