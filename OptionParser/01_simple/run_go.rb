#! /usr/bin/env ruby 

commands = [];

commands.push "./go.rb -c blue"
commands.push "./go.rb --color blue"


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


