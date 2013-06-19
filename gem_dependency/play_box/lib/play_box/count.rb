
require 'sand_num'

module PlayBox
  class Count

     def initialize
       @counter = SandNum::Number.new
     end

     def go
       puts "version: #{SandNum::VERSION} : #{@counter.value}"
     end
  end
end