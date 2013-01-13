#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'irb'
#require "../config/environment.rb"

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

URL="http://www.blocket.se/hela_sverige"
PROXY="http://wwwproxy:3128"

@doc = Nokogiri::HTML(open(URL, :proxy => PROXY))

@urls=[]
@doc.css('div.desc a').map { |link| link['href']}.each_slice(2) { |x| @urls.push(x[0]) }


@url=@urls[0]

puts "## Parsing #{@url} ##"
@doc = Nokogiri::HTML(open(@url, :proxy => PROXY), nil, 'iso-8859-1')
@doc.encoding = 'utf-8'

@bid=@url.match(/\d{8,}/).to_s

if @bid.length == 8
  @title=@doc.css('h2[class^=subject_]').text.strip
  @body=@doc.css('div.body').text.strip
  @bid=@bid.to_i
  @name=@doc.css('a.contact_link').first.text
  @price=@doc.css('table tr strong').first.text.strip.gsub(/\D/,'')

  puts "## BID ###"
  puts "#{@bid}"
  puts "## TITLE ###"
  puts "#{@title}"
  puts "## NAME ###"
  puts "#{@name}"
  puts "## BODY ###"
  puts "#{@body}"
  puts "## PRICE ###"
  puts "#{@price}"
  puts "## IMAGES ###"

  @doc.css('li.thumb_element a').map { |link| link['href']}.each_with_index { |x, index|
    dest=@bid.to_s + "/" + index.to_s + ".jpg"
    puts "Fetching image #{index} #{x} => #{dest}"
    `mkdir -p #{@bid}`
    `wget -v x dest`
  }
  #@doc.css('div#adaptive_image_size img')[0]['src']

end

ARGV.clear
IRB.start
