<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Perid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"172") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
id  = Replace_text(request("id"))


Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到编辑函数
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/Css.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript">

function theForm_Submit(id)
{
		
		if (id=="video")
		{
		    up.target='_self';
			up.action="Web_Person_Option.asp?param=video&perid=<%= perid %>&pageno=Web_Person_VideoManage.asp?perid=<%= perid %>"
			up.submit();	   
		}			
		
}

</script>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>企业申请猎头</strong></font></td>
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
              <% 	
'查找会员的数据  
 Set Rs = Conn.Execute("Select * From [pH_Locale_comApply] Where ac_id="&Id)
 If Not Rs.Eof Then

%>
              <tr bgcolor="f5f5f5">
                <td height="25" align="right">公司名称：</td>
                <td><%= Rs("ac_CompanyName") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td width="100" height="25" align="right">联系人：</td>
                <td><%= Rs("ac_Name") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td width="100" height="25" align="right">电 话：</td>
                <td><%= Rs("ac_Phone") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td height="25" align="right">电子邮件：</td>
                <td><%= Rs("ac_Mail") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td height="25" align="right">QQ/MSN：</td>
                <td><%= Rs("ac_QQ") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td height="25" align="right">需求内容：</td>
                <td height="100"><%= Rs("ac_Memo") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td height="25" align="right">提交时间：</td>
                <td><%= Rs("ac_Adddate") %> <input type="button" name="Submit" value="返 回" onClick="history.back(-1);"> 
                </td>
              </tr>
              <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2">没有找到该数据!</td>
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
Call CloseDB()
 %>

