#! /bin/env ruby


runThread = Thread.new do
  0.upto(8) do |y|
    puts "Sleeping #{y}"
    sleep(1)
  end
end

countThread = Thread.new do
  0.upto(4) do |x|
    puts x
    sleep(1)
  end
end

while runThread.alive? do 
  puts "Waiting"
  sleep(1);
end


