#! /usr/bin/env ruby

require 'pp'

puts "hello"


def process_array(*array)
  puts
  pp array
  prune_array = array.reject {|value| value.nil?}
  pp prune_array
  prune_array[0...-1].each {|value| puts value}
  puts "#{prune_array.last} last" unless prune_array.empty?
end

process_array(2,4,6,8)
process_array(2,4,6,8,nil)
process_array(2,4,nil,6,8)
process_array(3)
process_array(3,nil)
process_array()
process_array(nil)





