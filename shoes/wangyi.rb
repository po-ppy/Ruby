#_*_ coding:utf-8 _*_

require 'shoes'
Shoes.app title: "play something" do
   temp = video("http://jq22com.qiniudn.com/jq22-sp.mp4")
   button "play" ,color: red do
	alert "gg"
	temp.play
   end
 end