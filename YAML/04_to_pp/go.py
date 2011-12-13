#! /usr/bin/env ruby

require 'yaml'
require 'pp'

puts "hello"

food = YAML::load_file('food.yaml')


pp food


puts "bye"
