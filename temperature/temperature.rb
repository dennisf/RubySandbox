#! /usr/bin/env ruby

print "Please enter a temperature and scale (C or F): "
str = gets
exit if str.nil? or str.empty?
str.chomp!
temp, scale = str.split(" ")

abort "#{temp} is not a valid number." if temp !~ /-?\d+/

temp = temp.to_f
case scale
when "C","c"
  f = 1.8*temp + 32
  print "#{f} degrees F\n"
when "F","f"
  c = (5.0/9.0)*(temp-32)
  print "#{c} degrees C\n"
else
  abort "Must specify C or F."
end


