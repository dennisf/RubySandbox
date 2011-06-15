#! /usr/bin/env ruby
require 'pp'
require 'eventmachine'

pp "EventMahine version from Gem Spec "  + Gem.loaded_specs['eventmachine'].version.marshal_dump[0]

pp "EventMachine version is: #{EventMachine::VERSION}"



