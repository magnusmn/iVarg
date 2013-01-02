#!/usr/bin/env ruby

require "../config/environment.rb"


def reset_db
  puts "Deleting database entries"
  User.delete_all
  Advert.delete_all
end

def add_default_user 
  u=User.create(name: "Magnus",
                email: "mannen@home.se",
                password: "foobar",
                password_confirmation: "foobar")

end


def add_admin_user 
  admin=User.new(name: "Admin",
                 email: "admin@example.com",
                 password: "foobar",
                 password_confirmation: "foobar")
  admin.toggle(:admin)
  admin.save
end

def do_populate
  for user in 1..10
    u=User.create(name: "Author-#{user}",
                  email: "tester-#{user}@testing.com",
                  password: "foobar",
                  password_confirmation: "foobar")

    puts "Creating #{u.name} (#{u.email})"

    for add in 1..5
      a=u.adverts.create(title: "Thing-#{add}",
                         body: "Amazing body #{add}",
                         price: add*67)
      puts "  #{a.title}"
    end
  end
end

reset_db
add_admin_user
add_default_user
do_populate
