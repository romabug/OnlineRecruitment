<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Schid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
'Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"140") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Schid  = Replace_text(request("Schid"))
PageNo = Replace_text(request("pageno"))
If Schid = "" Then
 Response.write "<script language=JavaScript>alert('请选择记录！');location.href='"&PageNo&"';</script>"
 Response.End()
End if

Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到函数
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻类别</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>发送邮件</strong></font></td>
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
    <td align="left"> <table width="55%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post">
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">收件机构：</td>
                  <td bgcolor="f5f5f5">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
				 <% 
Ncid = Split(Schid,",")
For i = 0 To UBound(Ncid)	
 '查找会员的数据  
 SchoolName    = ""
 Set Rs = Conn.Execute("Select SchoolName From [pH_Educate_Base] Where Schid='"&Trim(Ncid(i))&"'")
 If Not Rs.Eof Then
  SchoolName   = Rs(0)
 End if
 Rs.Close
%>

                      <tr><td><u><%= SchoolName %></u></td></tr>
<% 
Next
 %>
                   </table>
				</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">邮件标题：</td>
                  <td bgcolor="f5f5f5"><input name="title" type="text" id="title" size="40" maxlength="50" value="<%= "您好,我们是"&Cls_WebName %>">
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">内 
                    容：</td>
                  <td bgcolor="f5f5f5"><textarea name="memo" cols="40" rows="8" id="memo"></textarea></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">&nbsp; </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="发送邮件">
                    <input name="Schid" type="hidden" id="Schid" value="<%= Schid %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>"> 
                   </td>
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
Sub Edit_Submit() '发送邮件
 Schid       = Replace_text(request("Schid"))
 PageNo      = Replace_text(request("PageNo"))
 Title       = Replace_text(request("Title"))
 Memo        = Replace_text(request("Memo"))
 
 Ncid = Split(Schid,",")
 For i = 0 To UBound(Ncid)	
  '查找会员的数据  
  Email    = ""
  Set Rs = Conn.Execute("Select Email From [pH_Educate_Base] Where Schid='"&Trim(Ncid(i))&"'")
  If Not Rs.Eof Then
   Email   = Rs(0)
  End if
  Rs.Close
  '发送邮件
  Call SendEmail(Email,Memo,Title)
 Next
 
 Response.write "<script language=JavaScript>alert('邮件发送成功！');location.href='"&PageNo&"';</script>"
End Sub

Call CloseDB()
 %>

