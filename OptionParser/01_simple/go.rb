#! /usr/bin/env ruby

require 'pp'
require 'optparse'


class ParseParameters

  def self.parseCommandLine

    options = Hash.new

    opts = OptionParser.new do |opts|

      opts.banner = "go.rb [optoins]"

      options[:color] = "green"
      opts.on("-c", "--color COLOR",
              "Set COLOR") do | color |
        options[:color] = color
      end

      opts.on_tail("-h","--help","Show this message") do
        puts opts
        exit 0
      end
    end

    opts.parse(ARGV)

    return options
  end

end


begin

  options = ParseParameters::parseCommandLine

  pp options

rescue Exception => boom

  puts "Exception (go.rb): #{boom}"

end





