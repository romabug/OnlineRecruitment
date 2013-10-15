<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
'//定义变量
Dim Rs,SQL,Tmp(3)
Dim UserName,Comid,Password,Email,Question,Answer
Dim CompanyName,Licence,Industry,Properity,Set_year,Set_month,Set_day,Workers,Reg_Currency,CurrencyType
Dim Company_Memo,ContactPerson,Phone,PhoneKeep,CompanyFax,EmailKeep,Locus_Area,Locus_City,Address
Dim ZipCode,WebHome,LastIp

LastIp = Request.Servervariables("Remote_Addr")
'//验证是否有同名用户或者同邮件的用户
UserName                     = Replace_Text(Request.Form("username"))
Password                     = Replace_Text(Request.Form("password"))
Password2					 = Password
Password                     = Md5(Password)
Comid                        = Replace_Text(Request.Form("comid"))
Email                        = Replace_Text(Request.Form("email"))
Cityid 						 = Replace_text(Request.Form("Cityid")) '//地区站点

Set Rs = Server.createobject("ADODB.recordset")
Rs.open "Select username,Email,comid From [pH_Company_Base] Where username='"&username&"' or Email='"&Email&"' or comid='"&comid&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("username")=username or rs("comid")=comid then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，你的帐号已经使用了,请重新选择帐号并继续注册...');history.back(-1);</script>"
		response.end
    end if
    if rs("Email") = Email then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" 提示：\n\n对不起，系统中有同名的邮箱,请重新选择邮箱并继续注册...');history.back(-1);</script>"
	  response.end
    end if

end if 
CloseRs

'//提交数据
Question                   = Replace_Text(Request.Form("Question"))
Answer                     = Replace_Text(Request.Form("Answer"))
CompanyName                = Replace_Text(Request.Form("CompanyName"))
Licence                    = Replace_Text(Request.Form("Licence"))
Industry                   = Replace_Text(Request.Form("Industry"))
Properity                  = Replace_Text(Request.Form("Properity"))
Set_year                   = Replace_Text(Request.Form("Set_year"))
Set_month                  = Replace_Text(Request.Form("Set_month"))
Set_day                    = Replace_Text(Request.Form("Set_day"))
Workers                    = Replace_Text(Request.Form("Workers"))
Reg_Currency               = Replace_Text(Request.Form("Reg_Currency"))
CurrencyType               = Replace_Text(Request.Form("CurrencyType"))
Company_Memo               = Replace_Text(Request.Form("Company_Memo"))
ContactPerson              = Replace_Text(Request.Form("ContactPerson"))
Phone                      = Replace_Text(Request.Form("Phone"))
PhoneKeep                  = Replace_Text(Request.Form("PhoneKeep"))
CompanyFax                 = Replace_Text(Request.Form("CompanyFax"))
EmailKeep                  = Replace_Text(Request.Form("EmailKeep"))
Locus_Area                 = Replace_Text(Request.Form("x_suozaidi"))
Locus_City                 = Replace_Text(Request.Form("x_suozaidi1"))
Address                    = Replace_Text(Request.Form("Address"))
ZipCode                    = Replace_Text(Request.Form("ZipCode"))
WebHome                    = Replace_Text(Request.Form("WebHome"))

If PhoneKeep = "" Then PhoneKeep = 0
If EmailKeep = "" Then EmailKeep = 0
If Comnpany_Memo <> "" Then Comnpany_Memo = Replace(Comnpany_Memo,Chr(13),"<br>")
'//保存数据到数据库[pH_Company_Base]表
SQL = "Insert Into [pH_Company_Base] (Comid,Username,Password,CompanyName,Question,Answer,Licence,Industry,Properity,Set_Year,Set_Month,Set_Day,Workers,Reg_Currency,CurrencyType,Company_Memo,ContactPerson,Phone,PhoneKeep,CompanyFax,Email,EmailKeep,Locus_Area,Locus_City,Address,ZipCode,WebHome,RegDate,LastIp,LoginCount,LastDate,LastUpdate_Time,LogoKeep,Nc_Vip_Flag,ViewClicks,PublishCount,Nc_Vip_Clicks,Nc_Vip_Jobs,Flag,Nc_Video,Video_Flag,Video_Bestflag,Websub,Cityid) Values ('"&Comid&"','"&Username&"','"&Password&"','"&CompanyName&"','"&Question&"','"&Answer&"','"&Licence&"',"&Industry&","&Properity&","&Set_year&","&Set_month&","&Set_day&","&Workers&","&Reg_Currency&","&CurrencyType&",'"&Company_Memo&"','"&ContactPerson&"','"&Phone&"',"&	PhoneKeep&",'"&CompanyFax&"','"&Email&"',"&EmailKeep&",'"&Locus_Area&"','"&Locus_City&"','"&Address&"','"&ZipCode&"','"&WebHome&"',getdate(),'"&LastIp&"',1,getdate(),getdate(),0,0,0,0,0,5,0,0,0,0,'www',"&Cityid&")"
Conn.Execute(SQL)  '//[pH_Company_Base]表

'//登陆
Tmp(0) = Username
Tmp(1) = Password
Tmp(2) = Comid
Session("Company") = Tmp
Session("Server") = Request.ServerVariables("Server_Name")
Session("Nc_Vip") = 0       '//免费会员
'//关闭数据库连接参数
CloseDB
'//发送邮件给会员
Set Fso = Server.CreateObject("Scripting.FileSystemObject") '///打开文件
Set FileAll = Fso.OpenTextFile(server.mappath("Mail_Register.htm"), 1)
HtmlStr = FileAll.ReadAll
HtmlStr = Replace(HtmlStr,"Html_Username",Username)
HtmlStr = Replace(HtmlStr,"Html_Password",Password2)
Set Fso = Nothing
Call SendEmail(Email,HtmlStr,"您的帐号注册成功")
'//注册结束
Response.Write "<meta http-equiv=refresh content=""5;URL=User_Center.asp"">"
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 企业会员注册</title>
</head>

<body>
<p>&nbsp;</p><table width="80%" border="0" align="center" cellspacing="1" bgcolor="#eeeeee">
  <tr> 
    <td height="100" bgcolor="f5f5f5"><table width="90%" border="0" align="center" cellspacing="0" class="text01">
        <tr> 
          <td height="30" align="center">你已经成功地注册成为<font color="#FF0000"><%= Cls_WebName %></font>的企业会员 进入<a href="User_Center.asp">企业管理平台</a></td>
        </tr>
        <tr> 
          <td height="3" bgcolor="ff6600"></td>
        </tr>
        <tr> 
          <td height="30" align="center"><font color=#999999>如果不能跳转，请点击这里进入<a href="User_Center.asp"><font color=#999999>企业管理平台</font></a></font></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
