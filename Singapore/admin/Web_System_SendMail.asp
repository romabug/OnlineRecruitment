<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
'Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"192") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))

Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到函数
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="javascript">
<!--
function CheckForm()
{
	document.form1.content.value=document.form1.doc_html.value;
	return true
}
//-->
</script>
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>群发邮件</strong></font></td>
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
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post" name="form1">
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">收件会员：</td>
                  <td bgcolor="f5f5f5">
                             <select name="usertype" style="width:100px;">
                                <option value="person" selected>-个人会员-</option>
                                <option value="company">-企业会员-</option>
								<option value="educate">-培训机构-</option>
                                <option value="school">-院校会员-</option>
                              </select>				  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">邮件标题：</td>
                  <td bgcolor="f5f5f5"><input name="title" type="text" id="title" size="40" maxlength="50" value="<%= "您好,我们是"&Cls_WebName %>">
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">内 
                    容：</td>
                  <td bgcolor="f5f5f5"><textarea name="n_content" cols="60" rows="10"></textarea> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="80" height="25" align="right" bgcolor="f5f5f5">&nbsp; </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="发送邮件">
                  
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

 UserType    = request("UserType")
 Title       = Replace_text(request("Title"))
 Memo        = Replace_text(request("n_Content"))
 
 Select Case UserType
  Case "person":
  	SQL = "Select UserEmail From [pH_Person_Base]"
  Case "company":
  	SQL = "Select Email From [pH_Company_Base]"
  Case "educate":
  	SQL = "Select Email From [pH_Educate_Base]"	
  Case "school":
  	SQL = "Select Email From [pH_School_Base]"
 End Select
 Set Rs = Conn.Execute(SQL)
 
 While Not Rs.Eof	
  '查找会员的数据  
  Email    = Rs(0)
  '发送邮件
  Call SendEmail(Email,Memo,Title)
  Rs.Movenext
 Wend
 Rs.Close
 Response.write "<script language=JavaScript>alert('邮件发送成功！');history.back(-1);</script>"
End Sub

Call CloseDB()
 %>

