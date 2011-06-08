#! /usr/bin/env ruby

require 'yaml'

puts "hello"

food = YAML.load_file('food.yaml')

if food.class == Hash 
  food.each do | key, value |
    puts "#{key} : "

    if value.class == Array
      value.each do | item |
        puts "   #{item}"
      end
    else
      puts "   #{value}"
    end
  end
else
  puts "Food is not Hash"
  puts food
end


puts "bye"
