#! /usr/bin/env ruby

puts "Ruby Version: #{RUBY_VERSION}"
puts "Lamda Example with mutliply arguments"


put_message = lambda {|x| puts "The current number is #{x}"}

put_plus_one = lambda {|x| puts "The current number plus one is #{x + 1}"}


def callWithFive(callback)
  callback.call 5
end


callWithFive(put_message)
callWithFive(put_plus_one)








