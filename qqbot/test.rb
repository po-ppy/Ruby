# _*_ coding:utf-8 _*_
require 'qqbot'

qqbot = QQBot.new

qqbot.get_friend_list_with_category.each do |category|
  puts category.name
  category.friends.each do |friend|
    puts "----#{friend.nickname}"
  end
end
