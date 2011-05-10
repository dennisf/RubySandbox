#! /bin/env ruby

require "rb-inotify"

puts "Ruby Version: #{RUBY_VERSION}"
puts "Notify Example"

addPathQueue = Queue.new

event_proc = lambda do |event|
    puts "name: #{event.absolute_name} event: #{event.flags}"
end

notifierThread = Thread.new do

  notifier = INotify::Notifier.new

  while true do
    # Wait 5 seconds for an event then give up
    if IO.select([notifier.to_io], [], [], 5)
      notifier.process
    end

    puts "Checking for new paths"

    until addPathQueue.empty? do
      newPath = addPathQueue.pop
      puts "Adding watch for #{newPath} \n"
      notifier.watch(newPath, :access, :create, :moved_to, :delete, :moved_from, :recursive, &event_proc) 
    end

  end

end


sleep 12

addPathQueue.push "/scr/ctm/dennisf/watch_dir1"

sleep 10

addPathQueue.push "/scr/ctm/dennisf/watch_dir2"

notifierThread.join


