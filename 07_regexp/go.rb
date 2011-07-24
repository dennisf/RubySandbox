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

a_file = "radar.NEXRAD.201106141151.DYX_Reflectivity.gif"
run_match(a_file,"Reflectivity")
run_match(a_file,"Velocity")
run_match(a_file,'[5][0-9]\...._Reflectivity')

a_file = "radar.NEXRAD.20110
6141141.DYX_Reflectivity.gif"
run_match(a_file,'[5][0-9]\...._Reflectivity')


