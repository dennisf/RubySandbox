#! /usr/bin/env ruby
require 'pp'
require 'trollop'

pp "Trollop version is "  + Gem.loaded_specs['trollop'].version.marshal_dump[0]

