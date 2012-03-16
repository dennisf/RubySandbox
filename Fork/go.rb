#! /usr/bin/env ruby

def puts_pid(message)
  puts "%6d : %s" % [Process::pid,message]
end

puts_pid "hello"

if fork_pid = fork 
    puts_pid("Parent process") 
else
    puts_pid("Child process")
end

puts_pid "bye"





