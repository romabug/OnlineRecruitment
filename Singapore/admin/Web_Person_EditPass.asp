<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Comid,PageNo
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"120") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Perid  = Replace_text(request("Perid"))
PageNo = Replace_text(request("pageno"))

Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到编辑函数
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改密码</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>修改密码</strong>[系统自动将修改后的密码发送到个人邮箱]</font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="50%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <% 	
'查找会员的数据  
 Set Rs = Conn.Execute("Select B.Username,I.RealName,B.UserEmail From pH_Person_Base As B,pH_Person_Info As I Where B.Perid=I.Perid And B.Perid='"&Perid&"'")
 If Not Rs.Eof Then
  Username      = Rs(0) 
  RealName      = Rs(1)
  Email         = Rs(2)
%>
              <form action="?action=edit" method="post">
                <tr bgcolor="f5f5f5">
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">姓 
                    名：</td>
                  <td bgcolor="f5f5f5"><%= RealName %></td>
                </tr>
                <tr bgcolor="f5f5f5">
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">帐 
                    号：</td>
                  <td bgcolor="f5f5f5"><%= Username %></td>
                </tr>
                <tr bgcolor="f5f5f5">
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">修改密码：</td>
                  <td bgcolor="f5f5f5"><input name="password" type="text" id="password" size="16" maxlength="30">
                    <input name="perid" type="hidden" id="perid" value="<%= Perid %>">
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>">
					<input name="email" type="hidden" id="email" value="<%= Email %>">
					<input name="realname" type="hidden" id="realname" value="<%= Realname %>">
					</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="保存新密码"></td>
                </tr>
              </form>
 <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">没有找到该帐号!</td>
              </tr>
              <% 
 End if
 Rs.Close
 Set Rs = Nothing
 %>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() '修改密码
 Perid       = Replace_text(request("Perid"))
 PageNo      = Replace_text(request("PageNo"))
 Password    = Replace_text(request("Password"))
 Email       = Replace_text(request("Email"))
 RealName = Replace_text(request("realName"))
 '加密
 Pass        = Md5(Password)
 '修改密码
 SQL = "UPdate [pH_Person_Base] Set Password='"&Trim(Pass)&"' Where Perid='"&Trim(Perid)&"'"
 Conn.Execute(SQL)
 '发送邮件
 HtmlStr = "您好，我们是"&Cls_WebName&"，您在"&Cls_WebName&"的新密码是<u>"&Password&"</u>，请及时用新的密码登陆到网站并修改该密码！"
 Call SendEmail(Email,HtmlStr,"您的密码修改成功")
 
 Response.write "<script language=JavaScript>alert('密码修改成功！');location.href='"&PageNo&"';</script>"
End Sub

Call CloseDB()
 %>

