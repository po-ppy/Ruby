# _*_ coding:utf-8 _*_
require 'ruby-nfc'
require 'logger'
$logger = Logger.new(STDOUT)

def p(str)
          $logger.debug str
end
p "Library version: #{NFC.version}"
        readers = NFC::Reader.all
p "Available readers: #{readers}"

