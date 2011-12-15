#!/usr/bin/env ruby

class SomeRuntimeError < RuntimeError


end




begin

  raise SomeRuntimeError,"Some Error happend during run time."

rescue SomeRuntimeError => boom
  puts boom.class
  puts boom
end
