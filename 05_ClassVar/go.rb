#! /usr/bin/env ruby



puts "hello"


class MyClass

  @@var = "beta"
  @var = "gamma"

  def initialize
    @var = "delta"
  end


  def myMethod1
    puts @@var
    puts @var
  end

  def MyClass.myClassMethod1
    puts @@var
    puts @var
  end

end

myobj = MyClass.new

puts "\nmyMethod1:"
myobj.myMethod1

puts "\nmyClassMethod1:"
MyClass.myClassMethod1

