<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"125") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
 
Username = Replace_text(Request.Form("username")) '//用户名
Password = Replace_text(Request.Form("password")) '//密码
Password = Md5(Password)
Randomize timer
Znum = Cint(8999*Rnd+1000)
Perid = Cls_WebKey&gen_key(10)&Znum               '//会员ID
Useremail=replace_text(request.form("useremail")) '//邮件
Question = replace_text(request.form("question")) '//问题提示
Answer = replace_text(request.form("answer"))     '//提示答案
JobType = replace_text(request.form("jobtype"))     '//会员类型

Set Rs = Server.Createobject("ADODB.recordset")
'//检测是否含有同名帐号
Rs.Open "Select UserName,UserEmail,Perid From [pH_Person_Base] Where Username='"&username&"' or Useremail='"&useremail&"'  or Perid='"&Perid&"'",Conn,1,1

If Not Rs.Eof Then
    '//同名的帐号
	If Rs("Username") = UserName or Rs("Perid") = Perid Then
	    CloseRs
		CloseDB
		Response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，你的帐号已经使用了,请重新选择帐号并继续注册...');history.back(-1);</script>"
		Response.end
    End if
	'//同名的邮件
    If Rs("Useremail") = Useremail Then
	    CloseRs
	    CloseDB
		Response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，系统中有同名的邮箱,请重新选择邮箱并继续注册...');history.back(-1);</script>"
	    Response.end
    End if

End if 
Rs.Close

'//检测论坛的会员表
rs.open "select id,User_name,Email from [User] where user_name='"&username&"' or email='"&useremail&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("user_name")=username then
	    CloseRs
	    CloseDB
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，你的帐号已经使用了,请重新选择帐号并继续注册...');history.back(-1);</script>"
		response.end
    end if
    if rs("email")=useremail then
	    CloseRs
	    CloseDB
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，系统中有同名的邮箱,请重新选择邮箱并继续注册...');history.back(-1);</script>"
	  response.end
    end if

end if 
'//提交数据
JobType                    = Replace_text(Request.Form("jobtype"))
Question                   = Replace_Text(Request.Form("Question"))
Answer                     = Replace_Text(Request.Form("Answer"))
RealName                   = Replace_Text(Request.Form("RealName"))
Sex                        = Replace_Text(Request.Form("Sex"))
Nation                     = Replace_Text(Request.Form("Nation"))
Edus                       = Replace_Text(Request.Form("Edus"))
Marry                      = Replace_Text(Request.Form("Marry"))
BirthYear                  = Replace_Text(Request.Form("BirthYear"))
Age                  	   = Cint(Year(Date())) - Cint(BirthYear)
LastSchool                 = Replace_Text(Request.Form("LastSchool"))
ZyClass                    = Replace_Text(Request.Form("ZyClass"))
Speciality                 = Replace_Text(Request.Form("Speciality"))
Door_Area                  = Replace_Text(Request.Form("huji"))
Door_City                  = Replace_Text(Request.Form("huji1"))
Locus_Area                 = Replace_Text(Request.Form("x_suozaidi"))
Locus_City                 = Replace_Text(Request.Form("x_suozaidi1"))
Stature                    = Replace_Text(Request.Form("Stature"))
Tizhong                    = Replace_Text(Request.Form("Tizhong"))
Byear                      = Replace_Text(Request.Form("Byear"))
BirthMonth                 = Replace_Text(Request.Form("BirthMonth"))
BirthDay                   = Replace_Text(Request.Form("BirthDay"))
PersonPhone                = Replace_Text(Request.Form("PersonPhone"))
MsnQQ                      = Replace_Text(Request.Form("MsnQQ"))
WebHome                    = Replace_Text(Request.Form("WebHome"))
Codeid                     = Replace_Text(Request.Form("Codeid"))
CodeType                   = Replace_Text(Request.Form("CodeType"))
Mt                         = Replace_Text(Request.Form("Mt"))
ZipCode                    = Replace_Text(Request.Form("ZipCode"))
Address                    = Replace_Text(Request.Form("Address"))


'//保存数据到数据库[pH_Person_Base]和[pH_Person_Info]表
SQL = "Insert Into [pH_Person_Base] (Perid,Username,Password,UserEmail,Journal,RegDate,LastIp,LastDate,LastUpdate_Time,LoginCount,Question,Answer,Websub) Values ('"&Perid&"','"&Username&"','"&Password&"','"&UserEmail&"',1,getdate(),'"&LastIp&"',getdate(),getdate(),1,'"&Question&"','"&Answer&"','"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Person_Base]表

SQL = "Insert Into [pH_Person_Info] (Perid,UserName,RealName,Sex,Nation,Edus,Marry,Age,LastSchool,ZyClass,Speciality,Door_Area,Door_City,Locus_Area,Locus_City,Stature,Tizhong,Byear,BirthYear,BirthMonth,BirthDay,PersonPhone,MsnQQ,WebHome,InterView,ProvideHouse,Post,ViewClicks,ContactKeep,ResumeKeep,PhotoKeep,ResumeMode,Codeid,CodeType,Mt,ZipCode,Address,PerType,JobType,TopAll,Nc_Video,Video_Flag,Video_BestFlag,Websub) Values ('"&Perid&"','"&Username&"','"&Realname&"',"&Sex&",'"&Nation&"',"&Edus&","&Marry&","&Age&",'"&LastSchool&"','"&ZyClass&"','"&Speciality&"','"&Door_Area&"','"&Door_City&"','"&Locus_Area&"','"&Locus_City&"',"&Stature&","&TiZhong&","&Byear&","&BirthYear&","&BirthMonth&","&BirthDay&",'"&PersonPhone&"','"&MsnQQ&"','"&WebHome&"',0,0,0,0,0,0,0,1,'"&Codeid&"',"&CodeType&",'"&Mt&"','"&ZipCode&"','"&Address&"',1,"&JobType&",0,0,0,0,'"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Person_Info]表

'//在论坛会员表中添加记录
SQL = "Insert Into [User] (User_name,User_Pass,Login_Last_Date,Login_Last_Ip,Login_Count,Creat_Date,Up_Date,Pass_Matter,Pass_Key,Email,MsnQQ,Address,myWeb,TelPhone,RelName) Values ('"&Username&"','"&Replace_text(request.form("password"))&"',getdate(),'"&LastIp&"',1,getdate(),getdate(),'"&Question&"','"&Answer&"','"&UserEmail&"','"&MsnQQ&"','"&Address&"','"&WebHome&"','"&PersonPhone&"','"&Realname&"')"
Conn.Execute(SQL)

 '操作完成
 Response.write "<script language=JavaScript>alert('操作完成！');location.href='Web_Person_All.asp';</script>"
 Response.End()

Call CloseDB()
 %>

