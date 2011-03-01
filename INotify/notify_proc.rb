#! /bin/env ruby

require "rb-inotify"

puts "Ruby Version: #{RUBY_VERSION}"
puts "Notify Example"

event_proc = lambda do |event|
    puts "name: #{event.absolute_name} event: #{event.flags}"
end

processThread = Thread.new do

  notifier = INotify::Notifier.new

  notifier.watch("/scr/ctm/dennisf/watch_dir1", :access, :create, :moved_to, :delete, :moved_from, :recursive, &event_proc) 

  while true do
    # Wait 5 seconds for an event then give up
    if IO.select([notifier.to_io], [], [], 5)
      notifier.process
    end
  end

end

processThread.join









