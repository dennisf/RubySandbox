#! /usr/bin/env ruby

a = 5

b = a

puts "a is #{a} and b is #{b}"

puts "a object id is: #{a.object_id}  class is #{a.class}"
puts "b object id is: #{b.object_id}  class is #{b.class}"

b = a.next

puts "a is #{a} and b is #{b}"

puts "a object id is: #{a.object_id}  class is #{a.class}"
puts "b object id is: #{b.object_id}  class is #{b.class}"


puts "\ndowncase"

sa = "ABC"

sb = sa

puts "sa is #{sa} and sb is #{sb}"

puts "sa object id is: #{sa.object_id}  class is #{sa.class}"
puts "sb object id is: #{sb.object_id}  class is #{sb.class}"

sb = sa.downcase

puts "a is #{sa} and b is #{sb}"

puts "sa object id is: #{sa.object_id}  class is #{sa.class}"
puts "sb object id is: #{sb.object_id}  class is #{sb.class}"

puts "\ndowncase!"

sa = "ABC"

sb = sa

puts "sa is #{sa} and sb is #{sb}"

puts "sa object id is: #{sa.object_id}  class is #{sa.class}"
puts "sb object id is: #{sb.object_id}  class is #{sb.class}"

sb = sa.downcase!

puts "sa is #{sa} and sb is #{sb}"

puts "sa object id is: #{sa.object_id}  class is #{sa.class}"
puts "sb object id is: #{sb.object_id}  class is #{sb.class}"







