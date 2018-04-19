# -*- coding:UTF-8 -*-
require 'watir'
browser = Watir::Browser.new
browser.goto 'http://kqapp.nwsuaf.edu.cn/ybcheck1.aspx?model=0&xsid='+'YB5764489'+'&sch=10712&token=1ea5edf1b56993f18c2ce93f5aaa    cd3ad9fd4c75&ts='+Time.now.to_i.to_s+'345'

puts browser.title
