#! /usr/bin/env ruby



def run_match(line,exp)

  re = Regexp.new(exp)

  result = re.match(line)

  if result.nil?
    puts "#{exp} match with #{line} was nil"
  else
    puts "#{exp} match with #{line} was #{result}"
  end
end

a_line = "Cats and Dogs"

run_match(a_line,"Cats")
run_match(a_line,"Dogs")
run_match(a_line,"Mice")




