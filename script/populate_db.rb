require "./config/environment.rb"

u=User.new(name: "Test",
           email: "tester.apa.com",
           password: "foobar",
           password_confirmation: "foobar")
u.save

puts u
