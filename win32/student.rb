#_*_ coding:utf-8 _*_

class Student
  attr_accessor :name,:id,:score
  def initialize(name = nil,id = nil,score = nil)
    @name,@id = name,id
    if not score
      @score = Hash.new(0)
    else
      @score = score
    end
  end
end