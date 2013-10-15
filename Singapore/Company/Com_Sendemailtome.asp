<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
'//获取用户的登陆标记
If IsArray(Session("Company")) Then
 Comid = Session("Company")(2)
 UserName = Session("Company")(0)
Else
 Session.Abandon() 
 Response.write "<script>alert('-登录后才能进行该操作！-');window.close();</script>"
 Response.End()
End if

'//判断企业会员的类型，免费会员不能发送面试邀请
If Session("Nc_Vip") <> 1 Then
  Response.write "<script>alert('免费会员不能进行该操作！请升级会员...');window.close();</script>"
  Response.End()
End if

'//获取和判断参数
Perid = Replace_Text(Request("perid")) '个人会员ID
If Perid = "" Then
 Response.write "<script language=JavaScript>alert('您没有选择记录！');window.close();</script>"
 Response.End()
End if

'//获取企业邮件等
SQL = "Select CompanyName,Email From [pH_Company_Base] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then 
 CompanyName     = Rs(0) 
 Email           = Rs(1)
End if
Rs.Close

'获取个人信息
SQL = "Select UserEmail From [pH_Person_Base] Where Perid='"&Perid&"'"
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then 
 Response.write "<script language=JavaScript>alert('没有找到该简历！');window.close();</script>"
 Response.End()
End if
UserEmail = Rs("UserEmail")
Rs.Close

SQL = "Select * From [pH_Person_Info] Where Perid='"&Perid&"'"
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then 
 Response.write "<script language=JavaScript>alert('没有找到该简历！');window.close();</script>"
 Response.End()
End if

'//组织邮件内容
Set Fso = Server.CreateObject("Scripting.FileSystemObject") '///打开文件
Set FileAll = Fso.OpenTextFile(server.mappath("../Person/Resume/Template.html"), 1)
HtmlStr = FileAll.ReadAll
Set Fso = Nothing

HtmlStr = Replace(HtmlStr,"{html_Logo}",Cls_Weburl&"Images/Logo.jpg")
HtmlStr = Replace(HtmlStr,"{html_Realname}",Rs("Realname"))
HtmlStr = Replace(HtmlStr,"{html_Sex}",Cls_Sex(Rs("Sex")))
HtmlStr = Replace(HtmlStr,"{html_Nation}",Rs("Nation"))
HtmlStr = Replace(HtmlStr,"{html_Birth}",Rs("BirthYear")&"年"&Rs("BirthMonth")&"月"&Rs("BirthDay")&"日")
HtmlStr = Replace(HtmlStr,"{html_Codetype}",Cls_CodeType(Rs("CodeType")))
HtmlStr = Replace(HtmlStr,"{html_Codeid}",Rs("CodeId"))
HtmlStr = Replace(HtmlStr,"{html_Marry}",Cls_Marry(Rs("Marry")))
HtmlStr = Replace(HtmlStr,"{html_Tizhong}",Rs("Tizhong"))
HtmlStr = Replace(HtmlStr,"{html_Stature}",Rs("Stature"))
HtmlStr = Replace(HtmlStr,"{html_Door}",Rs("Door_Area")&Rs("Door_City"))
HtmlStr = Replace(HtmlStr,"{html_Locus}",Rs("Locus_Area")&Rs("Locus_City"))
HtmlStr = Replace(HtmlStr,"{html_LastSchool}",Rs("LastSchool"))
HtmlStr = Replace(HtmlStr,"{html_Edus}",Cls_Edus(Rs("Edus")))
HtmlStr = Replace(HtmlStr,"{html_Speciality}",Rs("Speciality"))
HtmlStr = Replace(HtmlStr,"{html_Byear}",Rs("Byear")&"年")
HtmlStr = Replace(HtmlStr,"{html_Workyears}",Cls_Works(Rs("Works")))
HtmlStr = Replace(HtmlStr,"{html_Jobtitle}",Cls_JobTitle(Rs("JobTitle")))
'//个人照片显示 判断语句
If Rs("PhotoKeep") = 1 Then
 PhotoUrl = ""
Else
If Rs("PhotoUrl") <> Null or Rs("PhotoUrl") <> "" Then
 PhotoUrl = "<img src="&Cls_Weburl&"UpLoadFiles/PersonFile/"&Rs("PhotoUrl")&" width=""135"" height=""160"">"
Else
 PhotoUrl = "<img src="&Cls_Weburl&"UpLoadFiles/DefaultFile/Person.gif width=""135"" height=""160"">"
End if
End if
HtmlStr = Replace(HtmlStr,"{html_Photourl}",PhotoUrl)
'视频简历判断语句
Video_Str = ""
If Rs("Nc_Video") = True And DateDiff("d",Rs("Video_Date"),Date()) >= 0 And DateDiff("d",Rs("Video_EndDate"),Date()) <= 0 Then
 If Rs("Video_Flag") = 0 Then
    Video_Str = "<a href="&Cls_Weburl&"Person/Per_VideoView.asp?Perid="&Perid&" target=_blank><font color=#ff6600><u>点击访问"&Rs("RealName")&"视频简历<u></font></a>" '完全开放
 End if
End if
HtmlStr = Replace(HtmlStr,"{html_Videourl}",Video_Str)
'教育培训经历
Education_Str = ""
Education_Str = Education_Str & "<TABLE cellSpacing=1 cellPadding=3 width=""92%"" border=0>"
SQL = "Select Begin_Year,Begin_Month,End_Year,End_Month,SchoolName,Speciality,Edus From [pH_Person_Education] Where Perid='"&Perid&"' Order By Type"
Set Rs_a = Conn.Execute(SQL)
If Not Rs_a.Eof Then
 While Not Rs_a.eof
  BeginAndEndTime = Rs_a("Begin_Year")&"年"&Rs_a("Begin_Month")&"月 - "&Rs_a("End_Year")&"年"&Rs_a("End_Month")&"月"
  SchoolName      = Rs_a("SchoolName")
  Speciality      = Rs_a("Speciality")
  Edus            = Cls_Edus(Rs_a("Edus"))
  Education_Str = Education_Str & "<TR align=""left"">"
  Education_Str = Education_Str & "<TD class=navy>"&BeginAndEndTime&"</TD>"
  Education_Str = Education_Str & "<TD class=navy>"&SchoolName&"</TD>"
  Education_Str = Education_Str & "<TD class=navy>"&Speciality&"</TD>"
  Education_Str = Education_Str & "<TD class=navy>"&Edus&"</TD>"
  Education_Str = Education_Str & "</TR>"
  Rs_a.Movenext
 Wend 
Else
 Education_Str = Education_Str & "<TR align=""left""><TD class=navy>&nbsp; </TD><TD class=navy>&nbsp;</TD><TD class=navy>&nbsp;</TD><TD class=navy>&nbsp;</TD></TR>"
End if
Rs_a.Close
Education_Str = Education_Str & "</TABLE>"
HtmlStr = Replace(HtmlStr,"{html_Education}",Education_Str)
'工作经历
Works_Str = ""
SQL = "Select Begin_Year,Begin_Month,End_Year,End_Month,CompanyName,Properity,Industry,WorkName,WorkMemo,Demission From [pH_Person_Work] Where Perid='"&Perid&"'"
Set Rs_a = Conn.Execute(SQL)
If Not Rs_a.Eof Then
 While Not Rs_a.eof
 If Rs_a("End_Year") = 0 Then
  BeginAndEndTime = Rs_a("Begin_Year")&"年"&Rs_a("Begin_Month")&"月 - "&"至今"
 Else
  BeginAndEndTime = Rs_a("Begin_Year")&"年"&Rs_a("Begin_Month")&"月 - "&Rs_a("End_Year")&"年"&Rs_a("End_Month")&"月"
 End if
  CompanyName     = Rs_a("CompanyName")
  Properity       = Cls_Properity(Rs_a("Properity"))
  Industry        = Cls_Industry(Rs_a("Industry"))
  WorkName        = Rs_a("WorkName")
  WorkMemo        = Rs_a("WorkMemo")
  Demission       = Rs_a("Demission")
  Works_Str = Works_Str & "<TR><TD align=middle>"
  Works_Str = Works_Str & "<TABLE cellSpacing=1 cellPadding=3 width=""92%"" border=0><TBODY>"
  Works_Str = Works_Str & "<TR><TD><STRONG class=font14b>▌"&CompanyName&"</STRONG>&nbsp;&nbsp; <SPAN class=navy>"&BeginAndEndTime&"</SPAN></TD></TR>"
  Works_Str = Works_Str & "<TR><TD align=middle> "
  Works_Str = Works_Str & "<TABLE cellSpacing=1 cellPadding=3 width=""92%"" border=0><TBODY>"
  Works_Str = Works_Str & "<TR><TD width=250>企业性质：<span class=navy>"&Properity&"</span></TD><TD>行业类别：<span class=navy>"&Industry&"</span></TD></TR>"
  Works_Str = Works_Str & "<TR><TD colSpan=2>担任职位：<span class=navy>"&WorkName&"</span></TD></TR>"
  Works_Str = Works_Str & "<TR><TD colSpan=2>工作描述：<span class=navy>"&WorkMemo&"</span></TD></TR>"
  Works_Str = Works_Str & "<TR><TD colSpan=2>离职原因：<span class=navy>"&Demission&"</span></TD></TR>"
  Works_Str = Works_Str & "</TBODY></TABLE>"
  Works_Str = Works_Str & "</TD></TR></TBODY></TABLE>"
  Works_Str = Works_Str & "</TD></TR>"
  Rs_a.Movenext
 Wend
Else
 Works_Str = Works_Str & "<tr><td></td></tr>"
End if
Rs_a.Close 
HtmlStr = Replace(HtmlStr,"{html_Works}",Works_Str)
'语言能力
Language_Str = ""
Language_One = Cls_Language(Rs("Language_One"))
Language_Two = Cls_Language(Rs("Language_Two"))
Mandarin = Cls_Mandarin(Rs("Mandarin"))
If Language_One <> "" Then 
 Language_Str = Language_Str & Language_One&" "&Rs("Level_Two")&" ; "
End if
If Language_Two <> "" Then 
 Language_Str = Language_Str & Language_Two&" "&Rs("Level_Two")&" ; "
End if
If Mandarin <> "" Then 
 Language_Str = Language_Str & "普通话 "&Mandarin
End if
HtmlStr = Replace(HtmlStr,"{html_Language}",Language_Str)

'//计算机能力
Computer_Str = ""
Computer = Cls_Computer(Rs("Computer"))
If Computer <> "" Then
 Computer_Str = Computer_Str  &"证书 "&Computer&" ;"
End if
If Rs("ComputerOther") <> "" Then
 Computer_Str = Computer_Str & "技能 "&Rs("ComputerOther")
End if
HtmlStr = Replace(HtmlStr,"{html_Computer}",Computer_Str)
If Rs("Skill_memo") <> "" Then 
 HtmlStr = Replace(HtmlStr,"{html_Skillmemo}",Rs("Skill_memo"))
Else
 HtmlStr = Replace(HtmlStr,"{html_Skillmemo}","")
End if
'//求职类型
PerType = Rs("PerType")
If PerType = 1 Then
 PerType_Str = "全 职"
Elseif PerType = 2 Then
 PerType_Str = "兼 职"
End if
HtmlStr = Replace(HtmlStr,"{html_Pertype}",PerType_Str)
'//希望的工作岗位类别
WorkWillClass_Str = ""
If Rs("WorkWillClass1") <> "" or Rs("WorkWillClass1") <> Null Then
 WorkWillClass_Str = WorkWillClass_Str & Rs("WorkWillClass1")&"<Br>"
End if
If Rs("WorkWillClass2") <> "" or Rs("WorkWillClass2") <> Null Then
 WorkWillClass_Str = WorkWillClass_Str & Rs("WorkWillClass2")&"<Br>"
End if 
If Rs("WorkWillClass3") <> "" or Rs("WorkWillClass3") <> Null Then
 WorkWillClass_Str = WorkWillClass_Str & Rs("WorkWillClass3")&"<Br>"
End if 
HtmlStr = Replace(HtmlStr,"{html_Workwillclass}",WorkWillClass_Str)
'//求职职位名称
WorkWill_Str = ""
If Rs("WorkWill1") <> "" or Rs("WorkWill1") <> Null Then
 WorkWill_Str = WorkWill_Str & Rs("WorkWill1")&" ; "
End if
If Rs("WorkWill2") <> "" or Rs("WorkWill2") <> Null Then
 WorkWill_Str = WorkWill_Str & Rs("WorkWill2")&" ; "
End if
If Rs("WorkWill3") <> "" or Rs("WorkWill3") <> Null Then
 WorkWill_Str = WorkWill_Str & Rs("WorkWill3")
End if
HtmlStr = Replace(HtmlStr,"{html_Workwill}",WorkWill_Str)
'//希望工作地区
AreaWill_Str = ""
If Rs("AreaWill1") <> "" or Rs("AreaWill1") <> Null Then
 AreaWill_Str = AreaWill_Str & Rs("AreaWill1")&" ; "
End if
If Rs("AreaWill2") <> "" or Rs("AreaWill2") <> Null Then
 AreaWill_Str = AreaWill_Str & Rs("AreaWill2")&" ; "
End if
If Rs("AreaWill3") <> "" or Rs("AreaWill3") <> Null Then
 AreaWill_Str = AreaWill_Str & Rs("AreaWill3")
End if
HtmlStr = Replace(HtmlStr,"{html_Areawill}",AreaWill_Str)
'//待遇要求
Deal_Str = Rs("Deal")&"元/月 "
If Rs("InterView") = True Then
 Deal_Str = Deal_Str&" 可面议 ; "
End if
If Rs("ProvideHouse") = 1 Then
 Deal_Str = Deal_Str&"需要提供住房"
Else
 Deal_Str = Deal_Str&"不需要提供住房" 
End if
HtmlStr = Replace(HtmlStr,"{html_Deal}",Deal_Str)
'//到岗时间
If Rs("Post") = 0 Then
 Posts_Str = "可随时到岗"
Elseif Rs("Post") = 1 Then
 Posts_Str = Cls_Posts(Rs("Posts")) 
End if
HtmlStr = Replace(HtmlStr,"{html_Posttime}",Posts_Str)
If Rs("Appraise") <> "" Then
 HtmlStr = Replace(HtmlStr,"{html_Appraise}",Rs("Appraise"))
Else
 HtmlStr = Replace(HtmlStr,"{html_Appraise}","")
End if

If Rs("Develop") <> "" Then
 HtmlStr = Replace(HtmlStr,"{html_Develop}",Rs("Develop"))
Else
 HtmlStr = Replace(HtmlStr,"{html_Develop}","")
End if

If Rs("Other") <> "" Then
 HtmlStr = Replace(HtmlStr,"{html_Other}",Rs("Other"))
Else
 HtmlStr = Replace(HtmlStr,"{html_Other}","")
End if

HtmlStr = Replace(HtmlStr,"{html_Phone}",Rs("PersonPhone"))
HtmlStr = Replace(HtmlStr,"{html_Mt}",Rs("Mt"))
HtmlStr = Replace(HtmlStr,"{html_Email}",UserEmail)
HtmlStr = Replace(HtmlStr,"{html_Qq}",Rs("MsnQq"))
HtmlStr = Replace(HtmlStr,"{html_Webhome}",Rs("Webhome"))
HtmlStr = Replace(HtmlStr,"{html_Zipcode}",Rs("Zipcode"))
HtmlStr = Replace(HtmlStr,"{html_Address}",Rs("Address"))
HtmlStr = Replace(HtmlStr,"{html_Webname}","<a href="&Cls_WebUrl&" target=_blank>"&Cls_Webname&"</a>")

'发送邮件
Call SendEmail(Email,HtmlStr,Rs("Realname")&"求职简历")

Rs.Close

Response.write "<script language=JavaScript>alert('简历已成功发送到您的邮箱！');window.close();</script>"
%>
