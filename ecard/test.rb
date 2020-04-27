require 'mini_magick'
image = MiniMagick::Image.open(ARGV[0])
puts image.path
puts image.path #打印出图片副本的路径
puts image[:format] # JPEG 图片类型
puts image[:height] # 1227 图片高度 px
puts image[:width]  # 690 图片宽度 px
p image[:dimensions]# [690, 1227] 图片尺寸
puts image[:size] # 58495 图片大小 字节
#将图片裁剪成一个正方形
image.crop "52x18+1+1"
image.write 'ccx_re.jpg' #将裁剪的图片保存
