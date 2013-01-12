#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
#require "../config/environment.rb"

URL="http://www.blocket.se/hela_sverige"

doc = Nokogiri::HTML(open(URL))

puts doc.class
