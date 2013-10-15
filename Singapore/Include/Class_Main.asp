<%
'//Session保存期
Session.Timeout = 30

'//网站通用参数
Const Cls_WebName    = "新加坡劳务网"
Const Cls_WebUrl     = "http://www.xjp-job.com"
Const Cls_DoMain     = "xjp-job.com"
Const Cls_MainName   = "xjp-job.com"
Const Cls_WebKey     = ""
Const Cls_WebJobs    = 15 '//免费企业会员允许发布的职位数
Const Cls_PersonTopNumber = 10 '//设置个人会员的固顶数目
Const sCacheName     = "Ihost20070716"
Const Cls_Websub     = "www"
'//网站的联系方式
Const Cls_Phone      = "service@xjp-job.com"
Const Cls_QQ         = "312409431"
Const Cls_Msn        = "xjp-job@hotmail.com"
Const Cls_Email      = "service@xjp-job.com"
Const Cls_Fax        = "xjp-job@hotmail.com     QQ:312409431"
Const Cls_Address    = "新加坡劳务网"
Const Cls_ZipCode    = "022001196"
Const Cls_Icp        = "ICP备0220870118号"

'//网站邮箱参数
Const Cls_Mailname = "service@xjp-job.com"
Const Cls_Mailpass = "romabug"
Const Cls_Mailform = "service@xjp-job.com"
Const Cls_Mailsmtp = "117.21.248.205"



'//发送邮件函数
Sub SendEmail(MailBox,MailBody,MailSubject)
  
  Set Jmail=server.createobject("Jmail.Message")
  Jmail.Charset = "gb2312"
  JMail.ContentType = "text/html"
  Jmail.Silent = true
  Jmail.Priority = 3
  Jmail.MailServerUserName = Cls_Mailname  '有效电子邮件帐号
  Jmail.MailServerPassword = Cls_Mailpass  '有效电子邮件密码
  Jmail.From = Cls_Mailform    
  Jmail.FromName = Cls_WebName             '来自
  Jmail.Subject = MailSubject              '邮件标题
  
  Jmail.AddRecipient  ""&MailBox&""        '收件人的邮件地址  

  Jmail.Body = MailBody     '邮件内容       
  Jmail.Send(Cls_Mailsmtp)  'smtp服务器地址
  Set Jmail=nothing
End Sub

'//学历的输出
Function Cls_Edus(Edus)
 Dim Edu_Str
 Select Case Edus
  Case 10: Edu_Str = "职高"
  Case 20: Edu_Str = "中专"
  Case 30: Edu_Str = "其他中等技术学历"

 End Select
 Cls_Edus = Edu_Str
End Function

'//性别输出
Function Cls_Sex(Sex)
 Dim Sex_Str
 If Sex = True Then
  Sex_Str = "男"
 Elseif Sex = False Then
  Sex_Str = "女"
 End if
 Cls_Sex = Sex_Str
End Function

'//个人证件类型输出
Function Cls_CodeType(CodeType)
 Dim CodeType_Str
 Select Case CodeType
  Case 0
   CodeType_Str = "身份证"
  Case 1
   CodeType_Str = "护 照"
  Case 2
   CodeType_Str = "军官证"
  Case 3
   CodeType_Str = "学生证"
  Case 4
   CodeType_Str = "其他证件"
 End Select
 Cls_CodeType = CodeType_Str
End Function

'//婚姻状况输出
Function Cls_Marry(Marry)
 Dim Marry_Str
 Select Case Marry
  Case 0
   Marry_Str = "保密"
  Case 1
   Marry_Str = "未婚"
  Case 2
   Marry_Str = "已婚"
  Case 3
   Marry_Str = "离异"
 End Select
 Cls_Marry = Marry_Str
End Function

'//工作年限输出
Function Cls_Works(Works)
 Dim Works_Str
 Select Case Works 
  Case 0: Works_Str = "一年以内"
  Case 1: Works_Str = "一年以上"
  Case 2: Works_Str = "二年以上"
  Case 3: Works_Str = "三年以上"
  Case 4: Works_Str = "四年以上"
  Case 5: Works_Str = "五年以上"
  Case 10: Works_Str = "十年以上"
  Case 20: Works_Str = "二十年以上"
  Case 30: Works_Str = "三十年以上"
  Case 50: Works_Str = "退休人员"
 End Select
 Cls_Works = Works_Str
End Function

'//职称输出
Function Cls_JobTitle(JobTitle)
 Dim JobTitle_Str
 Select Case JobTitle 
  Case 1: JobTitle_Str = "初级职称"
  Case 2: JobTitle_Str = "中级职称"
  Case 3: JobTitle_Str = "高级职称"
  Case 4: JobTitle_Str = "其他"
 End Select
 Cls_JobTitle = JobTitle_Str
End Function

'//企业性质输出
Function Cls_Properity(Properity)
 Dim Properity_Str
 Select Case Properity 
  Case 1: Properity_Str = "国有企业"
  Case 2: Properity_Str = "外资企业"
  Case 3: Properity_Str = "合资企业"
  Case 4: Properity_Str = "私营企业"
  Case 5: Properity_Str = "民营企业"
  Case 6: Properity_Str = "股份制企业"
  Case 7: Properity_Str = "集体企业"
  Case 8: Properity_Str = "集体事业"
  Case 9: Properity_Str = "乡镇企业"
  Case 10: Properity_Str = "行政机关"
  Case 11: Properity_Str = "社会团体"
  Case 12: Properity_Str = "事业单位"
  Case 13: Properity_Str = "跨国企业"
  Case 14: Properity_Str = "其他"  
 End Select
 Cls_Properity = Properity_Str
End Function

'//行业输出
Function Cls_Industry(Industry)
 Dim Industry_Str
 Select Case Industry 
  Case 1: Industry_Str = "互联网、电子商务"
  Case 2: Industry_Str = "计算机业（软件、数据库、系统集成）"
  Case 3: Industry_Str = "计算机业（硬件、网络设备）"
  Case 4: Industry_Str = "电子、微电子技术"
  Case 5: Industry_Str = "通讯、电信业"
  Case 6: Industry_Str = "家电业"
  Case 7: Industry_Str = "批发零售(百货、超市、专卖店)"
  Case 8: Industry_Str = "贸易、商务、进出口"
  Case 9: Industry_Str = "电气"
  Case 10: Industry_Str = "电力、能源、矿产业"
  Case 11: Industry_Str = "石油、化工业"
  Case 12: Industry_Str = "生物工程、制药、环保"
  Case 13: Industry_Str = "机械制造、机电设备、重工业"
  Case 14: Industry_Str = "汽车、摩托车"
  Case 15: Industry_Str = "仪器仪表、电工设备"
  Case 16: Industry_Str = "广告、公关、设计"
  Case 17: Industry_Str = "媒体、影视制作、新闻出版"
  Case 18: Industry_Str = "艺术、文化传播"
  Case 19: Industry_Str = "快速消费品（食品、饮料、粮油、化妆品、烟酒）"
  Case 20: Industry_Str = "纺织品业（服饰、鞋类、家纺用品、皮具）"
  Case 21: Industry_Str = "咨询业（顾问、会计师、审计师、法律）"
  Case 22: Industry_Str = "金融业（投资、保险、证券、银行、基金）"
  Case 23: Industry_Str = "建筑、房地产、物业管理、装潢"
  Case 24: Industry_Str = "餐饮、娱乐、酒店"
  Case 25: Industry_Str = "运输、物流、快递<"
  Case 26: Industry_Str = "旅游业"
  Case 27: Industry_Str = "办公设备、文化体育休闲用品、家居用品"
  Case 28: Industry_Str = "印刷、包装、造纸"
  Case 29: Industry_Str = "生产、制造、加工"
  Case 30: Industry_Str = "教育、培训、科研院所"
  Case 31: Industry_Str = "医疗、保健、卫生服务"
  Case 32: Industry_Str = "人才交流、中介"
  Case 33: Industry_Str = "协会、社团、政府公用事业、社区服务"
  Case 34: Industry_Str = "农、林、牧、副、渔业"
  Case 35: Industry_Str = "其他"  
 End Select
 Cls_Industry = Industry_Str
End Function

'//外语类型输出
Function Cls_Language(Language)
 Dim Language_Str
 Select Case Language
  Case 1: Language_Str = "英语"
  Case 2: Language_Str = "日语"
  Case 3: Language_Str = "法语"
  Case 4: Language_Str = "德语"
  Case 5: Language_Str = "阿拉伯语"
  Case 6: Language_Str = "朝鲜语"
  Case 7: Language_Str = "西班牙语"
  Case 8: Language_Str = "俄语"
  Case 9: Language_Str = "意大利语"
  Case 10: Language_Str = "其他语言"
 End Select
 Cls_Language = Language_Str
End Function

'//普通话水平
Function Cls_Mandarin(Mandarin)
 Dim Mandarin_Str
 Select Case Mandarin
  Case 1: Mandarin_Str = "差"
  Case 2: Mandarin_Str = "较差"
  Case 3: Mandarin_Str = "一般"
  Case 4: Mandarin_Str = "标准"  
 End Select
 Cls_Mandarin = Mandarin_Str
End Function

'//计算机水平输出
Function Cls_Computer(Computer)
 Dim Computer_Str
 Select Case Computer
  Case 1: Computer_Str = "初级"
  Case 2: Computer_Str = "中级"
  Case 3: Computer_Str = "高级"
  Case 4: Computer_Str = "高校非计算机专业二级"
  Case 5: Computer_Str = "高校非计算机专业三级(偏软)"
  Case 6: Computer_Str = "高校非计算机专业三级(偏硬)"
  Case 7: Computer_Str = "初级程序员"
  Case 8: Computer_Str = "程序员"
  Case 9: Computer_Str = "高级程序员"
  Case 10: Computer_Str = "系统分析员"
  Case 11: Computer_Str = "网络程序员"
  Case 12: Computer_Str = "网络设计师"
  Case 13: Computer_Str = "全国计算机等级考试一级"
  Case 14: Computer_Str = "全国计算机等级考试二级"
  Case 15: Computer_Str = "全国计算机等级考试三级"
  Case 16: Computer_Str = "全国计算机等级考试四级"
  Case 17: Computer_Str = "微软认证产品专家(MCP)"
  Case 18: Computer_Str = "微软认证系统工程师(MCSE)"
  Case 19: Computer_Str = "微软认证网站建造专家(MCP+Site Builder)"
  Case 20: Computer_Str = "微软认证数据库管理员(MCDBA)"
  Case 21: Computer_Str = "微软认证开发专家(MCSD)"
  Case 22: Computer_Str = "Cisco职业资格认证CCNA"
  Case 23: Computer_Str = "Cisco职业资格认证CCDP"
  Case 24: Computer_Str = "Cisco职业资格认证CCNP"
  Case 25: Computer_Str = "Cisco职业资格认证CCIE"
  Case 26: Computer_Str = "Oracle8数据库管理员"
  Case 27: Computer_Str = "Lotus资格认证"
  Case 28: Computer_Str = "Lotus-CLS资格认证"
  Case 29: Computer_Str = "Lotus-CLI资格认证"
  Case 30: Computer_Str = "Notes应用开发工程师"
  Case 31: Computer_Str = "Notes系统管理工程师"
  Case 32: Computer_Str = "Notes高级应用开发工程师"
  Case 33: Computer_Str = "Notes高级系统管理工程师"
  Case 34: Computer_Str = "IBM-DB2 Database Administrator"
  Case 35: Computer_Str = "IBM-DB2 Application Developer"
  Case 36: Computer_Str = "IBM-MQSeries Engineer"
 End Select
 Cls_Computer = Computer_Str
End Function

'//可到岗时间输出
Function Cls_Posts(Posts)
 Dim Posts_Str
 Select Case Posts
  Case 10: Posts_Str = "三天内"
  Case 20: Posts_Str = "一周内"
  Case 30: Posts_Str = "两周内"
  Case 40: Posts_Str = "三周内"
  Case 50: Posts_Str = "一个月内"
  Case 60: Posts_Str = "三个月内"
  Case 70: Posts_Str = "半年内"
  Case 80: Posts_Str = "一年内"
 End Select
 Cls_Posts = Posts_Str
End Function

'有效期
Function Cls_Valids(Valids)
 Dim Valid_str
 Select Case Valids
  Case 0:Valid_str = "长期有效"
  Case 3:Valid_str = "三天"
  Case 7:Valid_str = "一周"
  Case 14:Valid_str = "两周"
  Case 30:Valid_str = "一个月"
  Case 60:Valid_str = "两个月"
  Case 90:Valid_str = "三个月"
  Case 180:Valid_str = "半年"
  Case 365:Valid_str = "一年"
 End Select 
 Cls_Valids = Valid_str
End Function


'//个人会员的类别
Function Cls_Usertype(Usertype)
 Dim Usertype_Str
 Select Case Usertype
  Case 1: Usertype_Str = "在职人员"
  Case 2: Usertype_Str = "待业人员"
  Case 3: Usertype_Str = "应届毕业生"
  Case 4: Usertype_Str = "在校学生"
 End Select
 Cls_Usertype = Usertype_Str
End Function

'//职位中年龄要求输出
Function Cls_Age(Min,Max)
 Dim Age_Str
 If Min = 0 And Max = 0 Then
    Age_Str = "不限"
 Elseif Min = 0 And Max <> 0 Then
    Age_Str = Max&"岁以下"
 Elseif Min <> 0 And Max = 0 Then
    Age_Str = Min&"岁以上"
 Else
    Age_Str = Min&"岁-"&Max&"岁"
 End if
 Cls_Age = Age_Str
End Function

'//判断企业会员能否发布职位
Function Cls_PublishJob_Flag(Vip,PublishCount)
 Dim Flag
 Select Case Vip
  Case 0
    If PublishCount >= Cls_WebJobs Then
     Flag = 0
	Else
     Flag = 1
	End if
  Case 1
    Flag = 1
  Case 2
    Flag = 0
 End Select
 Cls_PublishJob_Flag = Flag
End Function

'//企业招聘职位的状态
Function Cls_JobFlag(JobFlag)
 Dim JobFlag_Str
 Select Case JobFlag
  Case 0:JobFlag_Str = "<font color=#ff0000>未审核</font>"
  Case 1:JobFlag_Str = "招聘中"
  Case 2:JobFlag_Str = "<font color=#666666>已屏蔽</font>"
 End Select
 Cls_JobFlag = JobFlag_Str
End Function

'//资金类型输出
Function Cls_Currency(Currencys)
 Dim Currency_Str
 Select Case Currencys
  Case 1:Currency_Str = "人民币"
  Case 2:Currency_Str = "美元"
  Case 3:Currency_Str = "欧元"
  Case 4:Currency_Str = "英镑"
  Case 5:Currency_Str = "港币"
  Case 6:Currency_Str = "台币"
 End Select
 Cls_Currency = Currency_Str
End Function

'//企业VIP会员的期限
Function Cls_Vip_Level(Level)
 Dim Level_Str
 Select Case Level
  Case 1:Level_Str = "一个月"
  Case 2:Level_Str = "两个月"
  Case 3:Level_Str = "三个月"
  Case 4:Level_Str = "四个月"
  Case 5:Level_Str = "五个月"
  Case 6:Level_Str = "六个月"
  Case 9:Level_Str = "九个月"
  Case 12:Level_Str = "一年"
  Case 24:Level_Str = "两年"
  Case 36:Level_Str = "三年"
 End Select
 Cls_Vip_Level = Level_Str
End Function


'//员工人数输出
Function Cls_Workers(Workers)
 Dim Workers_Str
 Select Case Workers
  Case 9:Workers_Str = "10人以下"
  Case 49:Workers_Str = "10～50人"
  Case 199:Workers_Str = "50～200人"  
  Case 499:Workers_Str = "200～500人"  
  Case 999:Workers_Str = "500～1000人"  
  Case 1000:Workers_Str = "1000人以上"    
 End Select
 Cls_Workers = Workers_Str
End Function

'//职位类型输出
Function Cls_JobType(JobType)
 Dim JobType_Str
 Select Case JobType
  Case 1:JobType_Str = "全职"
  Case 2:JobType_Str = "兼职"
  Case 3:JobType_Str = "校园招聘"
 End Select
 Cls_JobType = JobType_Str
End Function
'//获取院校类型
Function Cls_SchoolType(Sch_Property)
 Dim SchoolType
 Select Case Sch_Property
  Case 10:SchoolType = "高等院校"
  Case 20:SchoolType = "中专学校"
  Case 30:SchoolType = "职业技校"
  Case 40:SchoolType = "培训机构"
  Case 50:SchoolType = "其他"
 End Select
 Cls_SchoolType = SchoolType
End Function

'//获取培训机构类型
Function Cls_EducateType(Sch_Property)
 Dim SchoolType
 Select Case Sch_Property
  Case 10:SchoolType = "国有企业"
  Case 20:SchoolType = "民营企业"
  Case 30:SchoolType = "外商独资企业"
  Case 40:SchoolType = "合资企业"
  Case 50:SchoolType = "股份制企业"
  Case 60:SchoolType = "集体企业"
  Case 70:SchoolType = "事业单位"
  Case 80:SchoolType = "社会团体"
  Case 90:SchoolType = "行政机关"
  Case 100:SchoolType = "其他类别"
  Case 110:SchoolType = "高等院校"
   
 End Select
 Cls_EducateType = SchoolType
End Function

Function Cls_Valid(Valid)
 Dim Valid_str
 Select Case Valid
  Case 0:Valid_str = "长年招生"
  Case 7:Valid_str = "一星期"
  Case 15:Valid_str = "半个月"
  Case 30:Valid_str = "一个月"
  Case 60:Valid_str = "二个月"
  Case 90:Valid_str = "三个月"
  Case 180:Valid_str = "半年"
 End Select 
 Cls_Valid = Valid_str
End Function


'//分页函数
Function Cls_Page(FileName,PageNo,PCount,RCount)
 Dim Page_Str
 Page_Str = "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""1"" class=""text01"">"
 Page_Str = Page_Str&"<tr><td width=""50%"">共有"&RCount&"条记录 | 分"&PCount&"页显示</td>"
 Page_Str = Page_Str&"<td align=""right"">"
 If PageNo > 1 Then
  Page_Str = Page_Str&"<a href="""&FileName&"?PageNo=1"" class=""a4"">首页</a> "
  Page_Str = Page_Str&"<a href="""&FileName&"?PageNo="&PageNo-1&""" class=""a4"">上页</a> "
 Else
  Page_Str = Page_Str&"<font color=#666666>首页</font> "
  Page_Str = Page_Str&"<font color=#666666>上页</font> "
 End if 
 Page_Str = Page_Str&"<"&PageNo&"> "  
 If PageNo < PCount Then
  Page_Str = Page_Str&"<a href="""&FileName&"?PageNo="&PageNo+1&""" class=""a4"">下页</a> "
  Page_Str = Page_Str&"<a href="""&FileName&"?PageNo="&PCount&""" class=""a4"">尾页</a> "
 Else
  Page_Str = Page_Str&"<font color=#666666>下页</font> "
  Page_Str = Page_Str&"<font color=#666666>尾页</font> "
 End if 
 Page_Str = Page_Str&"</td></tr></table>"

 Cls_Page = Page_Str
End Function

Function Cls_Page2(FileName,PageNo,PCount,RCount)
 Dim Page_Str
 Page_Str = "<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""1"" class=""text01"">"
 Page_Str = Page_Str&"<tr><td width=""50%"">共有"&RCount&"条记录 | 分"&PCount&"页显示</td>"
 Page_Str = Page_Str&"<td align=""right"">"
 If PageNo > 1 Then
  Page_Str = Page_Str&"<a href="""&FileName&"&PageNo=1"" class=""a4"">首页</a> "
  Page_Str = Page_Str&"<a href="""&FileName&"&PageNo="&PageNo-1&""" class=""a4"">上页</a> "
 Else
  Page_Str = Page_Str&"<font color=#666666>首页</font> "
  Page_Str = Page_Str&"<font color=#666666>上页</font> "
 End if 
 Page_Str = Page_Str&"<"&PageNo&"> "  
 If PageNo < PCount Then
  Page_Str = Page_Str&"<a href="""&FileName&"&PageNo="&PageNo+1&""" class=""a4"">下页</a> "
  Page_Str = Page_Str&"<a href="""&FileName&"&PageNo="&PCount&""" class=""a4"">尾页</a> "
 Else
  Page_Str = Page_Str&"<font color=#666666>下页</font> "
  Page_Str = Page_Str&"<font color=#666666>尾页</font> "
 End if 
 Page_Str = Page_Str&"</td></tr></table>"

 Cls_Page2 = Page_Str
End Function

'//生成会员的标记字符串
Dim output,num
Function gen_key(digits)
 Dim char_array(50)
 char_array(0) = "0"
 char_array(1) = "1"
 char_array(2) = "2"
 char_array(3) = "3"
 char_array(4) = "4"
 char_array(5) = "5"
 char_array(6) = "6"
 char_array(7) = "7"
 char_array(8) = "8"
 char_array(9) = "9"
 char_array(10) = "a"
 char_array(11) = "b"
 char_array(12) = "c"
 char_array(13) = "d"
 char_array(14) = "e"
 char_array(15) = "f"
 char_array(16) = "g"
 char_array(17) = "h"
 char_array(18) = "i"
 char_array(19) = "j"
 char_array(20) = "k"
 char_array(21) = "l"
 char_array(22) = "m"
 char_array(23) = "n"
 char_array(24) = "o"
 char_array(25) = "p"
 char_array(26) = "q"
 char_array(27) = "r"
 char_array(28) = "s"
 char_array(29) = "t"
 char_array(30) = "u"
 char_array(31) = "v"
 char_array(32) = "w"
 char_array(33) = "x"
 char_array(34) = "y"
 char_array(35) = "z"
 randomize
 do while len(output) < digits
  num = char_array(Int((35 - 0 + 1) * Rnd + 0))
  output = output + num
 loop
 gen_key = output
End Function
'//生成新闻文件名
Function Makefilename(Fname)
  Fname = Year(Now()) &  Month(Now()) & Day(Now()) & Hour(Now()) & Minute(Now()) & Second(Now())
  Makefilename = Fname & ".html"
End Function

'//最新课程
Function Cls_Lesson_New(Lists,Length)
 'Lists     显示的数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" LessonName,Ncid,Schid From [pH_Educate_Lesson] Where Flag=1 Order By Ncid Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href=""../Educate/Info/Lesson.asp?Schid="&Tmp(2,i)&"&Param="&Tmp(1,i)&""" target=""_blank"">"&Title&"</a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Lesson_New = NewList
End Function

'//最新课程 (分站)
Function Cls_Lesson_New_City(Lists,Length,Cityid)
 'Lists     显示的数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" l.LessonName,l.Ncid,l.Schid From [pH_Educate_Lesson] As l Inner Join [pH_Educate_Base] As b On l.Schid=b.Schid Where l.Flag=1 And b.Cityid="&Cityid&" Order By l.Ncid Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href=""../Educate/Info/Lesson.asp?Schid="&Tmp(2,i)&"&Param="&Tmp(1,i)&""" target=""_blank"">"&Title&"</a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Lesson_New_City = NewList
End Function

'//课程分类列表(不显示 更多信息)
Function Cls_Lesson_List(TypeNames,Lists,Length)
 'TypeNames    类别名称
 'Lists     显示的数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Ncid,Schid,LessonName From [pH_Educate_Lesson] Where Properity Like '%"&TypeNames&"%' And Flag=1 Order By Ncid Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(2,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href=""../Educate/Info/Lesson.asp?Schid="&Tmp(1,i)&"&Param="&Tmp(0,i)&""" target=""_blank"">"&Title&"</a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Lesson_List = NewList
End Function

'//课程分类列表(分站)
Function Cls_Lesson_List_City(TypeNames,Lists,Length,Cityid)
 'TypeNames    类别名称
 'Lists     显示的数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Ncid,Schid,LessonName From [pH_Educate_Lesson] Where Properity Like '%"&TypeNames&"%' And Flag=1 And Schid In (Select Schid From [pH_Educate_Base] Where Cityid="&c_City&") Order By Ncid Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(2,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href=""../Educate/Info/Lesson.asp?Schid="&Tmp(1,i)&"&Param="&Tmp(0,i)&""" target=""_blank"">"&Title&"</a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Lesson_List_City = NewList
End Function


'//新闻的列表
Function Cls_News_List(Typeid,Lists,Length)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_News_List = NewList
End Function

'//资讯的列表(不显示 更多信息)
Function Cls_Hr_List(Typeid,Lists,Length)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Hr_List = NewList
End Function

'//资讯的列表 (分站)
Function Cls_Hr_List_City(Typeid,Lists,Length,Cityid)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Hr_List_City = NewList
End Function

'//职业指导的列表
Function Cls_Train_List(Typeid,Lists,Length)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Person/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Train_List = NewList
End Function

'//职业指导的列表 (分站)
Function Cls_Train_List_City(Typeid,Lists,Length,Cityid)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Person/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Train_List_City = NewList
End Function


'//HR资讯首页内的列表
Function Cls_Hrindex_List(Typeid,Lists,Length)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Company/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Hrindex_List = NewList
End Function

'//HR资讯首页内的列表 (分站)
Function Cls_Hrindex_List_City(Typeid,Lists,Length,Cityid)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Company/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Hrindex_List_City = NewList
End Function


'//资讯中心的列表
Function Cls_Info_List(Typeid,Lists,Length)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&" <li> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""> "&Title&" </a></li>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 
 Cls_Info_List = NewList
End Function


'//资讯中心的列表，前面带点
Function Cls_Info_List2(Typeid,Lists,Length)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&" <li><a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""> "&Title&" </a></li>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 
 Cls_Info_List2 = NewList
End Function



 


'//资讯中心的列表
Function Cls_Info_List_City(Typeid,Lists,Length,Cityid)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""2"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=../Images/Info/icon11.gif> <a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_Info_List_City = NewList
End Function

'//置顶新闻的列表(跟目录文件显示)
Function Cls_News_Top_Root(Typeid,Lists,Length)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 And Topall=1 Order By NewId Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href="""&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_News_Top_Root = NewList
End Function


'//新闻的列表(跟目录文件显示)
Function Cls_News_List_Root(Typeid,Lists,Length)
 'Typeid    类别ID
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where Typeid="&Typeid&" And Flag=1 Order By NewId Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href="""&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_News_List_Root = NewList
End Function


'//热门或者推荐新闻的列表
Function Cls_News_Param(Param,Lists,Length)
 'Param     查询参数
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList,Param_Str
 Param_Str = Replace_Text(Param)
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where "&Param_Str&" And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 NewList = NewList&"</table>"
 Cls_News_Param = NewList
End Function

'//热门或者推荐新闻的列表 (分站)
Function Cls_News_Param_City(Param,Lists,Length,Cityid)
 'Param     查询参数
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList,Param_Str
 Param_Str = Replace_Text(Param)
 NewList = "<table width=""100%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where "&Param_Str&" And Flag=1 And Cityid="&Cityid&" Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22"">·<a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 NewList = NewList&"</table>"
 Cls_News_Param_City = NewList
End Function


'//职位搜索页 -- 最新资讯
Function Cls_News_City(City,Lists,Length)
 'Lists     显示的新闻数目
 'Length    显示的文字长度
 Dim NewList
 NewList = "<table width=""98%""  border=""0"" cellpadding=""0"" cellspacing=""0"">"
 SQL = "Select Top "&Lists&" Title,FileName,Path,t_Color From [pH_New_Info] Where City='"&City&"' And Flag=1 Order By DateAndTime Desc"                
 Set Rs1 = Conn.Execute(SQL)
 If Rs1.Eof Then
  NewList = NewList&"<tr><td height=""22"">&middot;没有相关信息...</td></tr>"
 Else
  Tmp = Rs1.GetRows()
  Rs1.Close:Set Rs1 = Nothing
  For i = 0 to Ubound(Tmp,2)
   Title = Left(Tmp(0,i),Length)
   NewList = NewList&"<tr valign=""middle""><td height=""22""><img src=""../Images/Search/arrow_home.gif"" width=""12"" height=""16""><a href=""../"&Tmp(2,i)&"/"&Tmp(1,i)&""" target=""_blank""><font color="&Tmp(3,i)&">"&Title&"</font></a></td></tr>"
  Next
 End if
 'NewList = NewList&"<tr><td align=right>| <a href=""../Public/News.asp?Param="&Typeid&""">更多信息</a></td></tr>"
 NewList = NewList&"</table>"
 Cls_News_City = NewList
End Function


Function CreateVote(ID,Title,VoteText,Mtype)
	Dim Result,Content,i
	Content=split(VoteText,"|")
	Result="<Table Width=100% ><Form action=../Public/vote.asp method=post target=_blank><tr><td>"&Title&"</td></tr>"
	
	IF Mtype=False Then
		For i=0 To Ubound(Content)
			Result=Result&"<tr><td>"
			Result=Result&"<input type='radio' name='vote' value="&i&">&nbsp;"&Content(i)
			Result=Result&"</td></tr>"
		Next
	End if

	If Mtype=True Then
	For i=0 To Ubound(Content)
			Result=Result&"<tr><td>"
			Result=Result&"<input type='checkbox' name='vote' value="&i&">&nbsp;&nbsp;&nbsp;"&Content(i)
			Result=Result&"</td></tr>"
		Next
	End if
	
	Result=Result&"<tr><td align=center><input name=VoteType type=hidden value="&Mtype&"><input name=VoteID type=hidden value="&ID&"><input type=submit name=submit value=投票 class=LoginInput> <input type=button name=view value=查看 class=LoginInput onclick=window.open('../Public/vote.asp?VoteID="&ID&"','_blank','scrollbars=yes,width=645,height=320')></td></tr>"
	Result=Result&"</Form></Table>"
	CreateVote=Result
End Function

'//组织会员输出编号
Function Cls_Ncidstr(Ncid)
 Dim Ncidstr
 If Len(Ncid) > 5 Then
  Ncidstr = Ncid
 Else
 Select Case Len(Ncid)
  Case 1: Ncidstr = "0000"&Ncid
  Case 2: Ncidstr = "000"&Ncid
  Case 3: Ncidstr = "00"&Ncid
  Case 4: Ncidstr = "0"&Ncid
  Case 5: Ncidstr = Ncid  
 End Select
 End if
 Cls_Ncidstr = Ncidstr
End Function


'//--------------------------学历约定--------------------------------
'//Edus
'// 10 小学
'// 20 初中
'// 30 高中
'// 40 中专
'// 50 大专
'// 60 本科
'// 70 硕士
'// 80 博士
'// 90 博士后
'//--------------------------企业所属行业约定--------------------------------
'//  <option value="1">互联网、电子商务</option>
'//  <option value="2">计算机业（软件、数据库、系统集成）</option>
'//  <option value="3">计算机业（硬件、网络设备）</option>
'//  <option value="4">电子、微电子技术</option>
'//  <option value="5">通讯、电信业</option>
'//  <option value="6">家电业</option>
'//  <option value="7">批发零售(百货、超市、专卖店)</option>
'//  <option value="8">贸易、商务、进出口</option>
'//  <option value="9">电气</option>
'//  <option value="10">电力、能源、矿产业</option>
'//  <option value="11">石油、化工业</option>
'//  <option value="12">生物工程、制药、环保</option>
'//  <option value="13">机械制造、机电设备、重工业</option>
'//  <option value="14">汽车、摩托车</option>
'//  <option value="15">仪器仪表、电工设备</option>
'//  <option value="16">广告、公关、设计</option>
'//  <option value="17">媒体、影视制作、新闻出版</option>
'//  <option value="18">艺术、文化传播</option>
'//  <option value="19">快速消费品（食品、饮料、粮油、化妆品、烟酒）</option>
'//  <option value="20">纺织品业（服饰、鞋类、家纺用品、皮具）</option>
'//  <option value="21">咨询业（顾问、会计师、审计师、法律）</option>
'//  <option value="22">金融业（投资、保险、证券、银行、基金）</option>
'//  <option value="23">建筑、房地产、物业管理、装潢</option>
'//  <option value="24">餐饮、娱乐、酒店</option>
'//  <option value="25">运输、物流、快递</option>
'//  <option value="26">旅游业</option>
'//  <option value="27">办公设备、文化体育休闲用品、家居用品</option>
'//  <option value="28">印刷、包装、造纸</option>
'//  <option value="29">生产、制造、加工</option>
'//  <option value="30">教育、培训、科研院所</option>
'//  <option value="31">医疗、保健、卫生服务</option>
'//  <option value="32">人才交流、中介</option>
'//  <option value="33">协会、社团、政府公用事业、社区服务</option>
'//  <option value="34">农、林、牧、副、渔业</option>
'//  <option value="35">其他</option>

'//--------------------------企业性质约定--------------------------------
'//  <option value="1">国有企业</option>
'//  <option value="2">外资企业</option>
'//  <option value="3">合资企业</option>
'//  <option value="4">私营企业</option>
'//  <option value="5">民营企业</option>
'//  <option value="6">股份制企业</option>
'//  <option value="7">集体企业</option>
'//  <option value="8">集体事业</option>
'//  <option value="9">乡镇企业</option>
'//  <option value="10">行政机关</option>
'//  <option value="11">社会团体</option>
'//  <option value="12">事业单位</option>
'//  <option value="13">跨国企业</option>
'//  <option value="14">其他</option>

'//--------------------------资金约定--------------------------------
'//  <option value="1">人民币</option>
'//  <option value="2">美元</option>
'//  <option value="3">欧元</option>
'//  <option value="4">英镑</option>
'//  <option value="5">港币</option>
'//  <option value="6">台币</option>

'//--------------------------员工人数约定--------------------------------
'//  <OPTION value=9>10人以下</OPTION>
'//  <OPTION value=49>10～50人</OPTION>
'//  <OPTION value=199>50～200人</OPTION>
'//  <OPTION value=499>200～500人</OPTION>
'//  <OPTION value=999>500～1000人</OPTION>
'//  <OPTION value=1000>1000人以上</OPTION>

'//--------------------------院校类型约定--------------------------------
'//  <option value="10">高等院校</option>
'//  <option value="20">中专学校</option>
'//  <option value="30">职业技校</option>
'//  <option value="40">培训机构</option>
'//  <option value="50">其他</option>

'//--------------------------工作年限约定--------------------------------
'//  <option value="0">一年以内</option>
'//  <option value="1">一年以上</option>
'//  <option value="2">二年以上</option>
'//  <option value="3">三年以上</option>
'//  <option value="4">四年以上</option>
'//  <option value="5">五年以上</option>
'//  <option value="10">十年以上</option>
'//  <option value="20">二十年以上</option>
'//  <option value="30">三十年以上</option>
'//  <option value="50">退休人员</option>

'//--------------------------外语类型约定--------------------------------
'//  <option  value="1">英语</option>
'//  <option  value="2">日语</option>
'//  <option  value="3">法语</option>
'//  <option  value="4">德语</option>
'//  <option  value="5">阿拉伯语</option>
'//  <option  value="6">朝鲜语</option>
'//  <option  value="7">西班牙语</option>
'//  <option  value="8">俄语</option>
'//  <option  value="9">意大利语</option>
'//  <option  value="10">其他语言</option>

'//--------------------------普通话水平约定-------------------------------- 
'//  <option value="4">标准</option>
'//  <option value="3">一般</option>
'//  <option value="2">较差</option>
'//  <option value="1">差</option>

'//--------------------------计算机水平约定-------------------------------- 
'//  <OPTION value=1>初级</OPTION>
'//  <OPTION value=2>中级</OPTION>
'//  <OPTION value=3>高级</OPTION>
'//  <OPTION value=4>高校非计算机专业二级</OPTION>
'//  <OPTION value=5>高校非计算机专业三级(偏软)</OPTION>
'//  <OPTION value=6>高校非计算机专业三级(偏硬)</OPTION>
'//  <OPTION value=7>初级程序员</OPTION>
'//  <OPTION value=8>程序员</OPTION>
'//  <OPTION value=9>高级程序员</OPTION>
'//  <OPTION value=10>系统分析员</OPTION>
'//  <OPTION value=11>网络程序员</OPTION>
'//  <OPTION value=12>网络设计师</OPTION>
'//  <OPTION value=13>全国计算机等级考试一级</OPTION>
'//  <OPTION value=14>全国计算机等级考试二级</OPTION>
'//  <OPTION value=15>全国计算机等级考试三级</OPTION>
'//  <OPTION value=16>全国计算机等级考试四级</OPTION>
'//  <OPTION value=17>微软认证产品专家(MCP)</OPTION>
'//  <OPTION value=18>微软认证网站建造专家(MCP+Site Builder)</OPTION>
'//  <OPTION value=19>微软认证系统工程师(MCSE)</OPTION>
'//  <OPTION value=20>微软认证数据库管理员(MCDBA)</OPTION>
'//  <OPTION value=21>微软认证开发专家(MCSD)</OPTION>
'//  <OPTION value=22>Cisco职业资格认证CCNA</OPTION>
'//  <OPTION value=23>Cisco职业资格认证CCDP</OPTION>
'//  <OPTION value=24>Cisco职业资格认证CCNP</OPTION>
'//  <OPTION value=25>Cisco职业资格认证CCIE</OPTION>
'//  <OPTION value=26>Oracle8数据库管理员</OPTION>
'//  <OPTION value=27>Lotus资格认证</OPTION>
'//  <OPTION value=28>Lotus-CLS资格认证</OPTION>
'//  <OPTION value=29>Lotus-CLI资格认证</OPTION>
'//  <OPTION value=30>Notes应用开发工程师</OPTION>
'//  <OPTION value=31>Notes系统管理工程师</OPTION>
'//  <OPTION value=32>Notes高级应用开发工程师</OPTION>
'//  <OPTION value=33>Notes高级系统管理工程师</OPTION>
'//  <OPTION value=34>IBM-DB2 Database Administrator</OPTION>
'//  <OPTION value=35>IBM-DB2 Application Developer</OPTION>
'//  <OPTION value=36>IBM-MQSeries Engineer</OPTION>

'//--------------------------到岗位时间约定-------------------------------- 
'//  <option  value="10">三天内</option>
'//  <option  value="20">一周内</option>
'//  <option  value="30">两周内</option>
'//  <option  value="40">三周内</option>
'//  <option  value="50">一个月内</option>
'//  <option  value="60">三个月内</option>
'//  <option  value="70">半年内</option>
'//  <option  value="80">一年内</option>               
 %>
