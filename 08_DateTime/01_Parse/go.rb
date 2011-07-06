#! /usr/bin/env ruby

require 'date'
require 'time'


def parse_date(date_string)
  puts "Date String: #{date_string}"

  date_object = Time::parse(date_string)

  puts "Date Object local: #{date_object}"
  puts "Date Object utc: #{date_object.utc}"
  puts

end


time_spec = Array.new
time_spec[0] = "2011-07-01T14:58:00 +0000"
time_spec[1] = "2011-07-01T11:58:00 -0300"


time_spec.each {| time_entry| parse_date(time_entry) }
