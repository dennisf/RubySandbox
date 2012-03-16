#! /usr/bin/env ruby

def puts_pid(message)
  puts "%6d : %s" % [Process::pid,message]
end

puts_pid("Parent starting") 

3.times do | index |
  child_number = index + 1
  if child_pid = fork
    puts_pid("Forking child #{child_number}")
  else
    puts_pid("Child number #{child_number}")
    break
  end
end

puts_pid "bye"


