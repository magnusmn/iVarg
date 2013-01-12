#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'irb'
#require "../config/environment.rb"

URL="http://www.blocket.se/hela_sverige"
PROXY="http://wwwproxy:3128"

# Match 6 digits or more
REGEX=/\d{6,}/

@doc = Nokogiri::HTML(open(URL, :proxy => PROXY))

@urls=[]
@doc.css('div.desc a').map { |link| link['href']}.each_slice(2) { |x| @urls.push(x[0]) }


puts "## Parsing #{@urls[0]} ##"
@doc = Nokogiri::HTML(open(@urls[0], :proxy => PROXY))


@title=@doc.css('div.body').text.force_encoding("UTF-8").strip

puts @title

#ARGV.clear
#IRB.start
