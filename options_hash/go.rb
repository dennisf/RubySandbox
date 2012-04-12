#! /usr/bin/env ruby


def hello(name = "world" ,options ={})
  message = "hello #{name}"

  if options[:shout] == true
    message.upcase!()
  end

  repeat = options[:repeat] || 1
  
  repeat.times { puts message }

  puts("")

end


hello()

hello("world", :shout=>true)


hello("worlds", :repeat=>3)

hello("big worlds", :repeat=>4, :shout=>true)






