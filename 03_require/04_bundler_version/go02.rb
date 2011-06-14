#! /usr/bin/env ruby
require 'pp'
gem 'trollop','1.16.1'


pp "Trollop version is "  + Gem.loaded_specs['trollop'].version.marshal_dump[0]

