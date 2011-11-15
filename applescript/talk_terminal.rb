#! /usr/bin/env ruby

require 'pp'
require 'appscript'

terminal = Appscript.app("Terminal.app")

if terminal.is_running?
  puts "terminal is running"
else
  puts "terminal is not running"
end


puts terminal.class()
puts terminal.name.get
puts terminal.version.get

home_window = terminal.windows['dennisf'].get

#terminal_methods = terminal.methods
#pp terminal_methods

pro_settings = terminal.settings_sets['pro'].get
pp pro_settings.name

puts "#{home_window}"

terminal.do_script("ssh -Y sake.eol.ucar.edu",:in=>home_window)


