#! /usr/bin/env ruby

require 'pp'

puts "hello"


def process_array(*array)
  puts
  pp array
  array[0...-1].each {|value| puts value}
  puts "#{array.last} last" unless array.empty?
end

process_array(2,4,6,8)
process_array(3)
process_array()





