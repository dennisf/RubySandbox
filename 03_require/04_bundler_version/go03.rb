#! /usr/bin/env ruby
require 'pp'
require 'bundler/setup'
require 'eventmachine'

pp "EventMahine version is "  + Gem.loaded_specs['eventmachine'].version.marshal_dump[0]

pp EventMachine::VERSION
