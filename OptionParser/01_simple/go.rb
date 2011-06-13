#! /usr/bin/env ruby

require 'optparse'


class ParseParameters

  def self.parseCommandLine

    puts ARGV


  end

end


begin

  ParseParameters::parseCommandLine

rescue Exception => boom

  puts "Exception (go.rb): #{boom}"

end





