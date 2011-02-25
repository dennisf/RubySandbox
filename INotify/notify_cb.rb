#! /bin/env ruby

require "rb-inotify"

puts "Ruby Version: #{RUBY_VERSION}"
puts "Notify Example"

def message_callback(event)
    puts "name: #{event.absolute_name} event: #{event.flags}"
end

notifier = INotify::Notifier.new

notifier.watch("/scr/ctm/dennisf/watch_dir", :create, :moved_to, :delete, :moved_from, :recursive) method(:message_callback)

while true do
  # Wait 5 seconds for an event then give up
  puts "process loop about to select"
  if IO.select([notifier.to_io], [], [], 5)
    notifier.process
  end
end











