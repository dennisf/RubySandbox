#! /usr/bin/env ruby


require 'timeout'

start_time = Time.now()

puts "Start"

begin
  status = Timeout::timeout(3) do | timeout_sec |
    puts "Timeout in #{timeout_sec} seconds"
    4.times do
      sleep(1)
      now_time = Time.now()
      puts "sleep : #{now_time - start_time}"
    end
    "End of task."
  end

  puts "status: #{status}"

rescue Exception => boom
  puts "Exception: #{boom.class()}"
  puts "Message: #{boom}"
end

end_time = Time.now()
puts "End : #{end_time - start_time} seconds"



