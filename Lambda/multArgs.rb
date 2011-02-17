#! /usr/bin/env ruby

puts "Ruby Version: #{RUBY_VERSION}"
puts "Lamda Example with mutliply arguments"

put_message = lambda {|x| puts "The number is #{x}"}

put_plus_one = lambda {|x| puts "The number plus one is #{x + 1}"}

def showNumbers(*numbers,&showProc)
  numbers.each do |n|
    showProc.call n
  end
end

showNumbers(4,5,6,&put_message)
showNumbers(4,5,6,7,&put_plus_one)

