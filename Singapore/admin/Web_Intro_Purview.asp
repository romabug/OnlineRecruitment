<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"225") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
If Action = "submit" Then Call Submit()

Set Rs = Conn.Execute("Select * From [pH_Intro_Purview] Where Ncid=1")
If Not Rs.Eof Then
 p_Job = Rs("p_Job")
 p_Headhunt = Rs("p_Headhunt")
 p_Person = Rs("p_Person")
 p_PersonBest = Rs("p_PersonBest")
 s_Person = Rs("s_Person")
 s_Headhunt = Rs("s_Headhunt")
 s_Job = Rs("s_Job")
 s_Introjob = Rs("s_Introjob")
End if
Rs.Close
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg">&nbsp;<font color="#FFFFFF">■ <strong>免费中介结构用户权限管理</strong></font></td>
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
  <tr> 
    <td align="left" bgcolor="#FFFFFF"> <table width="500" border="0" cellpadding="4" cellspacing="1">
        <tr align="center" bgcolor="f5f5f5"> 
          <td width="150">免费用户操作名称</td>
          <td>权限设置(开/关)</td>
        </tr>
        <form action="?action=submit" name="theForm" method="post">
          <tr align="center" bgcolor="f5f5f5"> 
            <td width="150">发布职位</td>
            <td><input type="radio" name="p_job" value="1" <% If p_job = True Then Response.write "Checked" %>>
              开 
              <input type="radio" name="p_job" value="0" <% If p_job = False Then Response.write "Checked" %>>
              关</td>
          </tr>
          <tr align="center" bgcolor="f5f5f5"> 
            <td>查看中介职位</td>
            <td align="center" bgcolor="f5f5f5"><input type="radio" name="s_introjob" value="1" <% If s_introjob = True Then Response.write "Checked" %>>
              开 
              <input type="radio" name="s_introjob" value="0" <% If s_introjob = False Then Response.write "Checked" %>>
              关</td>
          </tr>
          <tr align="center" bgcolor="f5f5f5"> 
            <td width="150">&nbsp;</td>
            <td align="center" bgcolor="f5f5f5"><input type="submit" name="Submit" value=" 保存设置 "></td>
          </tr>
        </form>
      </table></td>
</tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr> 
                <td height="25" bgcolor="f5f5f5">注意：这里设置的免费用户的权限范围，收费的中介机构用户都具备这样的权限</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<% 
Sub Submit()

 p_Job = Replace_Text(Request.Form("p_Job"))
 'p_Headhunt = Replace_Text(Request.Form("p_Headhunt"))
 'p_Person = Replace_Text(Request.Form("p_Person"))
 'p_PersonBest = Replace_Text(Request.Form("p_PersonBest"))
 's_Person = Replace_Text(Request.Form("s_Person"))
 's_Headhunt = Replace_Text(Request.Form("s_Headhunt"))
 's_Job = Replace_Text(Request.Form("s_Job"))
 s_Introjob = Replace_Text(Request.Form("s_Introjob"))
 
 SQL = "Update [pH_Intro_Purview] Set p_Job="&p_Job&",s_Introjob="&s_Introjob&" Where Ncid=1"
 Conn.Execute(SQL)

 Response.Redirect "Web_Intro_Purview.asp"
End Sub

Call CloseDB()
 %>

