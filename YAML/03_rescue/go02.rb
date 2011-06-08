#! /usr/bin/env ruby

require 'yaml'

begin
  food = YAML::load_file('bad_food.yaml')

  print food

rescue Exception => boom
  puts "Rescue class: #{boom.class}"
  puts "Rescue : #{boom}"
end



