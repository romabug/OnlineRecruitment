<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim uid
uid=request.cookies("01387job")("uid")
if len(uid)<>15 then
response.write "<br>"+"<li>参数错误！"
response.end
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where uid='"&uid&"'" ,conn,1,1
dim email,needjobname,companyname,otherdemand,uname,sex,updatetime,nation,province,birthday,marry,height,address,regtime,logintime,picurl
email=request.Form("email")
needjobname=request.Form("needjobname")
companyname=request.Form("companyname")
otherdemand=replace(replace(request.form("otherdemand"),chr(32),"&nbsp;"),chr(13),"<br>")
if email="" or needjobname="" then
response.redirect"OutSendResume.asp"
response.end()
end if
select case rs("sex")
case true
sex="男"
case false
sex="女"
end select
select case rs("province")
		  case 1
		  province="北京"
		  case 2
		  province="天津"
		  case 3
		  province="上海"
		  case 4
		  province="重庆"
		  case 5
		  province="浙江"
		  case 6
		  province="广东"
		  case 7
		  province="江苏"
		  case 8
		  province="福建"
		  case 9
		  province="湖南"
		  case 10
		  province="湖北"
		  case 11
		  province="山东"
		  case 12
		  province="辽宁"
		  case 13
		  province="吉林"
		  case 14
		  province="云南"
		  case 15
		  province="四川"
		  case 16
		  province="安徽"
		  case 17
		  province="江西"
		  case 18
		  province="黑龙江"
		  case 19
		  province="河北"
		  case 20
		  province="陕西"
		  case 21
		  province="海南"
		  case 22
		  province="河南"
		  case 23
		  province="山西"
		  case 24
		  province="内蒙古"
		  case 25
		  province="广西"
		  case 26
		  province="贵州"
		  case 27
		  province="宁夏"
		  case 28
		  province="青海"
		  case 29
		  province="新疆"
		  case 30
		  province="西藏"
		  case 31
		  province="甘肃"
		  case 32
		  province="台湾"
		  case 33
		  province="香港"
		  case 34
		  province="澳门"
		  case 35
		  province="国外"
		  case 36
		  province="其他"
		  end select
if rs("pic")<>"" then
            if rs("pichide")="ok" then
            pic="<img src='http://www.01387job.com/person/image/nopic.gif' width='121' height='166' border='0' style='border:1px solid #000000'>"
            else
            pic="<a href='http://www.01387job.com/person/upload/"&rs("pic")&"' target='_blank'><img src='http://www.01387job.com/person/upload/"&rs("pic")&"' width='121' height='160' border='0' style='border:1px solid #FFB877'></a>"
            end if
            else
            pic="<img src='http://www.01387job.com/person/image/nopic.gif' width='121' height='166' border='0' style='border:1px solid #000000'>"
end if
select case rs("degree")
					  case 0
					  degree="高中以下"
					  case 1
					  degree="高中"
					  case 2
					  degree="职高"
					  case 3
					  degree="中专"
					  case 4
					  degree="大专"
					  case 5
					  degree="本科"
					  case 6
					  degree="硕士"
					  case 7
					  degree="博士"
end select		
select case rs("maincatelog")
							case 1
							maincatelog="饮食/餐厅/厨房"
							case 2
							maincatelog="商店/超市/商场"
							case 3
							maincatelog="博彩/酒店/旅游/服务"
							case 4
							maincatelog="运输业/飞机场/物流"
							case 5
							maincatelog="资讯科技/电脑/通讯"
							case 6
							maincatelog="广告/媒体/出版/设计"
							case 7
							maincatelog="水/电/气/空调/电梯"
							case 8
							maincatelog="汽车维修/汽车美容"
							case 9
							maincatelog="建筑/装修/杂工"
							case 10
							maincatelog="保姆/家政/保安"
							case 11
							maincatelog="理发/美容/按摩"
							case 12
							maincatelog="演艺/模特/娱乐业"
							case 13
							maincatelog="会展/公关/推广"
							case 14
							maincatelog="工厂/制造业"
							case 15
							maincatelog="园林/公园维护"
							case 16
							maincatelog="进出口/贸易"
							case 17
							maincatelog="外语/翻译/传译"
							case 18
							maincatelog="金融/拍卖/保险"
							case 19
							maincatelog="教育/培训"
							case 20
							maincatelog="健美/护理/医疗"
							case 21
							maincatelog="咨询/中介/法律"
							case 22
							maincatelog="综合文职/行政"
							case 23
							maincatelog="高级/综合管理"
							case 24
							maincatelog="其它技术工种"
end select
select case rs("maincatelog2")
							case 1
							maincatelog2="饮食/餐厅/厨房"
							case 2
							maincatelog2="商店/超市/商场"
							case 3
							maincatelog2="博彩/酒店/旅游/服务"
							case 4
							maincatelog2="运输业/飞机场/物流"
							case 5
							maincatelog2="资讯科技/电脑/通讯"
							case 6
							maincatelog2="广告/媒体/出版/设计"
							case 7
							maincatelog2="水/电/气/空调/电梯"
							case 8
							maincatelog2="汽车维修/汽车美容"
							case 9
							maincatelog2="建筑/装修/杂工"
							case 10
							maincatelog2="保姆/家政/保安"
							case 11
							maincatelog2="理发/美容/按摩"
							case 12
							maincatelog2="演艺/模特/娱乐业"
							case 13
							maincatelog2="会展/公关/推广"
							case 14
							maincatelog2="工厂/制造业"
							case 15
							maincatelog2="园林/公园维护"
							case 16
							maincatelog2="进出口/贸易"
							case 17
							maincatelog2="外语/翻译/传译"
							case 18
							maincatelog2="金融/拍卖/保险"
							case 19
							maincatelog2="教育/培训"
							case 20
							maincatelog2="健美/护理/医疗"
							case 21
							maincatelog2="咨询/中介/法律"
							case 22
							maincatelog2="综合文职/行政"
							case 23
							maincatelog2="高级/综合管理"
							case 24
							maincatelog2="其它技术工种"
end select
select case rs("jobtype")
		  case 1
		  jobtype="全职"
		  case 2
		  jobtype="兼职"
		  case 3
		  jobtype="都可以"
end select
select case rs("checkindate")
		   case 1
		   checkindate="随时到岗"
		   case 2
		   checkindate="三天内"
		   case 3
		   checkindate="一周内"
		   case 4
		   checkindate="半月内"
		   case 5
		   checkindate="一个月内"
		   case 6
		   checkindate="面议协商"
end select
'----发邮件开始----
Set myMail = Server.CreateObject("CDONTS.NewMail")
HTML = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=gb2312'><link href='http://www.01387job.com/css/Resume.css' rel='stylesheet' type='text/css'>"
HTML = HTML & "</head><body bgcolor='#ffffff' leftmargin='0' topmargin='5' marginwidth='0' marginheight='0'>"
HTML = HTML & "<table width='600' border='0' align='center' cellpadding='0' cellspacing='0'><tr><td width='258' height='80'><img src='http://www.01387job.com/images/logo_217_70.gif' width='216' height='70'></td><td width='342'>其他要求："&otherdemand&"<br>个人简历<font color='#FF3300' face='Geneva, Arial, Helvetica, sans-serif'>NO.:"&rs("uid")&"</font></td></tr></table>"
HTML = HTML & "<table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table1'><tr><td width='30'><img src='../img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>个人基本资料</strong></td></tr></table>"
HTML = HTML & "<table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr><td width='445' valign='middle'><table width='440'  border='0' align='center' cellpadding='0' cellspacing='0'><tr bgcolor='FFFCF7'><td width='102' height='26' bgcolor='FFFCF7'> <div align='right'><font color='#696969'>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</font></div></td><td width='140' bgcolor='FFFCF7' id='resume'>"&rs("uname")&"</td><td width='98'><div align='right'><font color='#696969'>性&nbsp;别：</font></div></td><td width='100' id='resume'>"
HTML = HTML & ""&sex&"</td></tr><tr><td height='26'> <div align='right'><font color='#696969'>更新日期：</font></div></td><td>"&rs("updatetime")&"</td><td><div align='right'><font color='#696969'>民&nbsp;族：</font></div></td><td id='resume'>"&rs("nation")&"</td></tr><tr bgcolor='FFFCF7'><td height='26'> <div align='right'><font color='#696969'>户&nbsp;&nbsp;&nbsp;&nbsp;籍：</font></div></td><td id='resume'>"
HTML = HTML & ""&province&""&rs("citys")&"</td><td><div align='right'><font color='#696969'>年&nbsp;龄：</font></div></td><td>"&datediff("yyyy",rs("birthday"),date())&"</td></tr><tr><td height='26'> <div align='right'><font color='#696969'>婚姻状况：</font></div></td><td id='resume'>"&rs("marry")&"</td><td><div align='right'><font color='#696969'>身&nbsp;高：</font></div></td><td>"&rs("height")&"cm</td></tr><tr><td height='26' bgcolor='FFFCF7'> <div align='right'><font color='#696969'>现所在地：</font></div></td><td colspan='3' bgcolor='FFFCF7' id='resume'>"&rs("address")&"</td></tr><tr><td height='26'> <div align='right'><font color='#696969'>注册日期：</font></div></td>"
HTML = HTML & "<td id='resume'>"&rs("regtime")&"</td><td><div align='right'><font color='#696969'>登录次数：</font></div></td><td>"&rs("logintime")&"</td></tr></table></td><td width='160' align='center' valign='middle'><table width='142' border='0' cellspacing='0' cellpadding='0'><tr><td align='center'>"
HTML = HTML & ""&pic&"</td></tr></table></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr> <td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>个人教育背景</strong></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr bgcolor='FFFCF7'><td height='26'><div align='right'><font color='#696969'>毕业院校：</font></div></td><td height='26'>"&rs("college")&"</td><td height='26'><div align='right'><font color='#696969'>学历：</font></div></td><td height='26'>"
HTML = HTML & ""&degree&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>主修专业：</font></div></td><td>"&rs("spec1")&"</td><td><div align='right'><font color='#696969'>第二专业：</font></div></td><td>"&rs("spec2")&"</td></tr><tr bgcolor='FFFCF7'><td height='26' bgcolor='FFFCF7'><div align='right'><font color='#696969'>计算机水平：</font></div></td><td>"&rs("com_level")&"</td><td><div align='right'><font color='#696969'>政治面貌：</font></div></td><td>"&rs("zzmm")&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>第一外语：</font></div></td><td width='211'>"&rs("l_type1")&"</td><td width='86'><div align='right'><font color='#696969'>广东话水平：</font></div></td>"
HTML = HTML & "<td width='199'>"&rs("l_level1")&"</td></tr><tr bgcolor='FFFCF7'><td height='26'><div align='right'><font color='#696969'>第二外语：</font></div></td><td>"&rs("l_type2")&"</td><td><div align='right'><font color='#696969'>英语水平：</font></div></td><td>"&rs("l_level2")&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>所获证书：</font></div></td><td colspan='3'>"&rs("certificate")&"</td></tr><tr bgcolor='#FFF7EE'><td height='26' bgcolor='FFFCF7'><div align='right'><font color='#696969'>培训与教育经历：</font></div></td><td colspan='3' bgcolor='FFFCF7'>"&rs("edu_career")&"</td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'>"
HTML = HTML & "<tr><td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>个人求职意向</strong></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr bgcolor='FFFCF7'><td width='104' height='26'><div align='right'><font color='#696969'>应聘的行业(一)：</font></div></td><td width='212'>"&maincatelog&"</td><td width='85'><div align='right'><font color='#696969'>意向职位(一)：</font></div></td><td width='199'>"&rs("subcatelog")&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>应聘的行业(二)：</font></div></td><td>"&maincatelog2&"</td><td><div align='right'><font color='#696969'>意向职位(二)：</font></div></td><td>"&rs("subcatelog2")&"</td></tr><tr bgcolor='FFFCF7'><td height='26'><div align='right'><font color='#696969'>职位名称：</font></div></td><td>"&rs("jobname")&"</td>"
HTML = HTML & "<td><div align='right'><font color='#696969'>全职/兼职：</font></div></td><td>"&jobtype&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>薪水要求：</font></div></td><td>"&rs("salary")&"(元/月)</td><td><div align='right'><font color='#696969'>住房要求：</font></div></td><td>"&rs("workhouse")&"</td></tr><tr><td height='26' bgcolor='FFFCF7'><div align='right'><font color='#696969'>到岗时间：</font></div></td><td colspan='3' bgcolor='FFFCF7'>"
HTML = HTML & ""&checkindate&"&nbsp;&nbsp;(更新日期是：<font face='Geneva, Arial, Helvetica, sans-serif'><strong>"&rs("updatetime")&"</strong></font>)</td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr><td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>个人工作经历</strong></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr bgcolor='FFFCF7'><td width='104' height='26'> <div align='right'><font color='#696969'>工作经验：</font></div></td><td>"&rs("doneyear")&"</td></tr><tr><td height='26'> <div align='right'><font color='#696969'>工作经历：</font></div></td><td>"&rs("job_career")&"</td>"
HTML = HTML & "</tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr><td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>自我评价</strong></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr bgcolor='FFFCF7'><td width='104' height='26'> <div align='right'><font color='#696969'>自我评价内容：</font></div></td><td>"&rs("selfintro")&"</td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table'><tr><td width='30'><img src='http://www.01387job.com/img/bar_left.gif' width='30' height='28'></td><td background='http://www.01387job.com/img/bar_bg.gif'><strong>联系方式</strong></td>"
HTML = HTML & "</tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' class='table2'><tr bgcolor='FFFCF7'><td width='104' height='26'><div align='right'><font color='#696969'>电话：</font></div></td><td width='212'>"&rs("tel")&"</td><td width='85'><div align='right'><font color='#696969'>手机：</font></div></td><td width='199'>"&rs("mobile")&"</td></tr><tr><td height='26'><div align='right'><font color='#696969'>聊天号码：</font></div></td><td>"&rs("chatno")&"</td><td><div align='right'><font color='#696969'>个人主页：</font></div></td><td><a href='"&rs("selfweb")&"' target=_blank>"&rs("selfweb")&"</a></td></tr><tr bgcolor='FFFCF7'><td height='26'><div align='right'><font color='#696969'>邮编：</font></div></td><td>"&rs("zipcode")&"</td><td><div align='right'><font color='#696969'>E-mail：</font></div></td>"
HTML = HTML & "<td><a href='mailto:"&rs("email")&"'>"&rs("email")&"</a></td></tr></table><table width='600' border='0' align='center' cellpadding='0' cellspacing='0'><tr><td height='36' align='center'>以上信息由澳门劳工招聘网(www.01387job.com)提供</td></tr></table></body></html>"
'发件人
myMail.From = "master@01387job.com"
'收件人
myMail.To = email
'密件抄送
'myMail.Bcc = "pyx1980@126.com"
'抄送
'myMail.Cc = "pyx1980@126.com"
'邮件的重要性
' 0 重要性低 
' 1 重要性一般（默认） 
' 2 重要性高 
myMail.Importance = 2
'邮件主题
myMail.Subject = "应聘贵公司"&needjobname&"职位----01387job个人简历外发系统"
'附件（注意 e:\test.txt 指的是服务器上的位置，如果使用相对路径，必须用 Server.MapPath 映射为真实路径）
'myMail.AttachFile "d:\qqandice.jpg"

'NewMail 对象的文字格式
'0 表示该 Body 可包含超文本置标语言 (HTML)
'1 表示该 Body 只用于纯文本（默认值）
myMail.BodyFormat = 0
'NewMail 对象设置编码
'0 表示将采用 MIME 格式
'1 表示将采用连续的纯文本（默认值）
myMail.MailFormat = 0
'给邮件对象的文本赋值
myMail.Body = HTML
'将邮件发出
myMail.Send
'销毁对象实例，释放内存
Set myMail = Nothing
'----发邮件结束----
'----外发简历纪录写入数据库开始----
conn.execute("insert into [01387sendresume] (uid,email,needjobname,companyname,otherdemand,sendtime) values ('"&uid&"','"&email&"','"&needjobname&"','"&companyname&"','"&otherdemand&"','"&date()&"')")
'----外发简历纪录写入数据库结束----
Call CloseConn()
response.write("<script language=javascript>alert('操作成功！');this.location.href='OutSendResume.asp';</script>")
response.End()
%>
