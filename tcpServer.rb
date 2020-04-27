#!/usr/bin/env ruby

require 'socket'

server = TCPServer.open(8888)  # Socket 监听端口为 2000
  client = server.accept       # 等待客户端连接

  loop {
    puts client.gets.to_s
  }
  client.close                 # 关闭客户端连接
