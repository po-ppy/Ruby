#! /usr/bin/env ruby -w

CONST = ' out there'.freeze
# test
class Person
  CONST = proc { 'in there' }
  def where_is_my_CONST
    ::CONST + 'Person one'
  end
end

class Person2
  CONST = ' Person two'.freeze
  def where_is_my_CONST
    CONST
  end
end
puts Person.new.where_is_my_CONST
puts Person2.new.where_is_my_CONST
puts Object::CONST + Person2::CONST
# puts Person::CONST + CONST
puts Person::CONST
puts Person::CONST.call + Person2::CONST
