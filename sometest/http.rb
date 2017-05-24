#! /bin/ruby
#_*_ coding:UTF-8 _*_

require 'net/http'
require 'json'
require 'digest/md5'

#hp = Net::HTTP.new('202.117.179.110')
#
#response = hp.post('/Download.jsp','FileName=4mu_CCmUlhiUFpPtm27GqOx85erzCU4qJYtItjQTbNmNsnFDIcAzB6JakitYebcS-7QIMzFuCmcVFv5YzCPKPtbA61FQzmfIhPOC96lDHz7gpoINPR1tRA')
#
#fp = File.open("http.doc", "w")
#fp.write response.body
#emailAddr = "1176667078@qq.com"
#$StudentId = "YB5764485";#YB5764489
#$PlanId = "ff";
#$SchoolCode = "10712";

$appid = "20170524000049027"
$key = "YEQJJfACwt9FLvXpcq0y"
$map=Hash[
	"自动检测"=>"auto",
	"中文"=>"zh",
	"英语"=>"en",
	"粤语"=>"yue",
	"文言文"=>"wyw",
	"日语"=>"jp",
	"韩语"=>"kor",
	"法语"=>"fra",
	"西班牙语"=>"spa",
	"泰语"=>"th",
	"阿拉伯语"=>"ara",
	"俄语"=>"ru",
	"葡萄牙语"=>"pt",
	"德语"=>"de	",
	"意大利语"=>"it",
	"希腊语"=>"el",
	"荷兰语"=>"nl",
	"波兰语"=>"pl",
	"保加利亚语"=>"bul",
	"爱沙尼亚语"=>"est",
	"丹麦语"=>"dan",
	"芬兰语"=>"fin",
	"捷克语"=>"cs",
	"罗马尼亚语"=>"rom",
	"斯洛文尼亚语"=>"slo",
	"瑞典语"=>"swe",
	"匈牙利语"=>"hu",
	"繁体中文"=>"cht",
	"越南语"=>"vie"
]

$transStr = "我是中国人"

postdata = Hash[
          	"q"	=>$transStr,		#TEXT	Y	请求翻译query	UTF-8编码
			"from"=>$map["中文"]	,	#TEXT	Y	翻译源语言	语言列表(可设置为auto)
			"to"=>$map["英语"],		#TEXT	Y	译文语言	语言列表(不可设置为auto)
			"appid"=>$appid,		#INT	Y	APP ID	可在管理控制台查看
			"salt"=>10086,			#INT	Y	随机数	
			"sign"=>""				#TEXT	Y	签名	appid+q+salt+密钥 的MD5值
	          ]

tempstr = postdata['appid'] + postdata['q'] + postdata['salt'].to_s + $key
puts tempstr

#postdata["sign"]  = MD5.hexdigest(tempstr)

md5 = Digest::MD5.new
md5 << tempstr
postdata["sign"]  = md5.hexdigest
uri = URI('http://api.fanyi.baidu.com/api/trans/vip/translate')
req = Net::HTTP::Post.new(uri.path)
req.set_form_data(postdata)

http = Net::HTTP.new(uri.hostname,uri.port)

response = http.request(req)
#puts response.body

result = JSON.parse response.body
puts response.body

puts postdata
#second = JSON.parse result['trans_result'] #.chop!.reverse.chop!.reverse
puts result['trans_result']
#puts second['dst']

#jjj = JSON.parse response.body
#
#if jjj['Success'] then
#	puts jjj["Msg"]
#	msg = "echo #{jjj["Msg"]} | mutt #{emailAddr} -s #{Time.now}签到 "
#	system msg
#else
#	puts jjj["Msg"]
#	msg = "echo #{jjj["Msg"]} | mutt #{emailAddr} -s #{Time.now}签到 "
#	system msg
#end


