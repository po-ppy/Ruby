#_*_ coding:utf-8 _*_
require 'minitest/autorun'
require './hello'
class HelloWorldTest < MiniTest::Unit::TestCase
  def test_get_world
    assert_equal "Hello World!",HelloWorld.new.get_world
  end
end

