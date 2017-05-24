require 'net/smtp'

#smtp.163.com
message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <test@todomain.com>
Subject: SMTP e-mail test
 
This is a test e-mail message.
MESSAGE_END

mailSend = Net::SMTP.start('smtp.163.com', 
                25, 
                'smtp.163.com', 
                '18821701674@163.com', 'jpasswd', :plain)

  mailSend.send_message message, '18821701674@163.com', '1176667078@qq.com'
