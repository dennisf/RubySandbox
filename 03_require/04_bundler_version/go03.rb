#! /usr/bin/env ruby
require 'pp'
require 'bundler/setup'


pp "Trollop version is "  + Gem.loaded_specs['trollop'].version.marshal_dump[0]

