#! /usr/bin/env ruby 

commands = [];

commands.push "./go.rb --help"
commands.push "./go.rb"
commands.push "./go.rb -c blue --number 4"
commands.push "./go.rb -n 11"


puts ""

commands.each do | command |

  begin
    puts command
    pid = spawn command
    Process.wait
    if  not $?.exited?
      puts "failed to run: #{$?}"
    end
    puts ""
  rescue Exception => boom
    puts "Excepiton (run_go.rb): #{boom}"
  end


end


