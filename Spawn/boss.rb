#! /usr/bin/env ruby

puts "Ruby Version: #{RUBY_VERSION}"

puts "#{Process.pid} Boss start" 

child_pids  = []
child_count = 0

while child_count < 10
  active_pids = []
  for worker_pid in child_pids
    tested_pid = Process.wait(worker_pid,Process::WNOHANG)
    if tested_pid.nil?
      active_pids.push worker_pid
      puts "   #{worker_pid} active"
    end
  end
  child_pids = active_pids

  while (child_pids.size < 3)
    worker_pid = Process.spawn("./worker.rb")
    child_count += 1
    puts "#{Process.pid} spawned #{worker_pid}"
    child_pids.push worker_pid
  end

  sleep 2

end



puts "#{Process.pid} Boss stop" 


