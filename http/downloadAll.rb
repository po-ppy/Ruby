# -*- coding:UTF-8 -*-
require 'watir'
browser = Watir::Browser.new
browser.goto 'https://ftp2.nwafu.edu.cn/ftp/incoming/Book/%E6%AD%A6%E6%9C%AF%E4%B9%A6%E7%B1%8D/'
puts browser.title
