#! /bin/ruby
require 'win32/api'
include Win32

buf = 0.chr * 260
len = [buf.length].pack('L')
#
# GetUserName  = API.new('GetUserName','PP','I','advapi32')
# GetUserName.call(buf,len)
#
# puts buf.strip

WindowFromPoint = API.new('WindowFromPoint','II','L','user32')
GetWindowText = API.new('GetWindowText','LPP','I','user32')
CloseWindow = API.new('CloseWindow','L','I','user32')
MoveWindow = API.new('MoveWindow','LIIIII','I','user32')


hwnd = WindowFromPoint.call(400,400)

#CloseWindow.call(WindowFromPoint.call(200,200))
# GetWindowText.call(hwnd,buf,len)
# puts buf.strip

MoveWindow.call(hwnd,600,200,200,400,0)