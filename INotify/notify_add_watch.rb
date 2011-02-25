#! /bin/env ruby

require "rb-inotify"
require "tread"

puts "Ruby Version: #{RUBY_VERSION}"
puts "Notify Example"

notifierLock = Mutex.new

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

    until addPathQueue.empty? do
      newPath = addPathQueue.pop
      notifier.watch("/scr/ctm/dennisf/watch_dir", :access, :create, :moved_to, :delete, :moved_from, :recursive, &event_proc) 
    end

  end

end

notifierThread.join


