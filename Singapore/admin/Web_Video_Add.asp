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
If Instr(1,Session("Web_Power"),"161") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))

Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到编辑函数
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻类别</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>添加视频招聘会</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="70%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">招聘会主题：</td>
                  <td bgcolor="f5f5f5"><input name="title" type="text" id="title" size="35"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">开始时间：</td>
                  <td bgcolor="f5f5f5"> <input name="begintime" type="text" id="begintime" size="12" maxlength="16"  onclick="SD(this,'document.all.begintime')"> 
                    <select name="begintime1">
                      <% For i=0 to 23 %>
                      <option value="<%= i %>" <% If i=9 Then Response.write "Selected" %>><%= i %></option>
                      <% Next%>
                    </select> <select name="begintime2">
                      <% For i=0 to 59 %>
                      <option value="<%= i %>"><%= i %></option>
                      <% Next%>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5">
                  <td height="25" align="right" bgcolor="f5f5f5">结束时间：</td>
                  <td bgcolor="f5f5f5"><input name="endtime" type="text" id="endtime" size="12" maxlength="16"  onclick="SD(this,'document.all.endtime')"> 
                    <select name="endtime1">
                      <% For i=0 to 23 %>
                      <option value="<%= i %>" <% If i=17 Then Response.write "Selected" %>><%= i %></option>
                      <% Next%>
                    </select> <select name="endtime2">
                      <% For i=0 to 59 %>
                      <option value="<%= i %>"><%= i %></option>
                      <% Next%>
                    </select></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="添 加">
                    <input name="cityid" type="hidden" id="cityid" value="0"></td>
                </tr>
              </form>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() 
 Title      = Replace_Text(Request.Form("Title"))
 Cityid		= Replace_Text(Request.Form("Cityid"))
 BeginTime = SafeRequest("begintime")&" "&SafeRequest("begintime1")&":"&SafeRequest("begintime2")&":00"
 EndTime = SafeRequest("endtime")&" "&SafeRequest("endtime1")&":"&SafeRequest("endtime2")&":00"
 '//检测结束时间是否大于开始时间
 If DateDiff("n",BeginTime,EndTime) <= 0 Then
  Response.write "<script>alert('-结束时间必须大于开始时间-');history.back(-1);</script>"
  Response.End()  
 End if
 '// 添加记录
 SQL = "Insert Into [pH_Video_Type](Title,CreateTime,BeginTime,EndTime,Coms,Cityid) Values ('"&Title&"',getdate(),'"&BeginTime&"','"&EndTime&"',0,"&Cityid&")"
 Conn.Execute(SQL)
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='Web_Video_All.asp';</script>"
End Sub

Call CloseDB()
 %>

