require 'rqrcode'
qrcode = RQRCode::QRCode.new("http://github.com/")
svg = qrcode.as_ansi

