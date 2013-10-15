<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Jobid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"150") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Jobid  = Replace_text(request("Jobid"))
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
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>设为固顶</strong></font></td>
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
    <td align="left"> <table width="60%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <% 	
'查找职位的数据  
 Set Rs = Conn.Execute("Select JobName,TopDate,TopEndDate From [pH_Job_Base] Where Jobid="&Cstr(Jobid))
 If Not Rs.Eof Then
  JobName         = Rs(0)
  TopDate         = Rs(1)
  Top_EndDate     = Rs(2) 
  
%>
              <form action="?action=edit" method="post" name="up">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">职位名称：</td>
                  <td bgcolor="f5f5f5"><%= JobName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">开始日期：</td>
                  <td bgcolor="f5f5f5"><input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= TopDate %>"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">截止日期：</td>
                  <td bgcolor="f5f5f5"><input name="enddate" type="text" id="enddate" size="16" maxlength="30" onclick="SD(this,'document.all.enddate')" value="<%= Top_EndDate %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="保 存"> 
                    <input name="Jobid" type="hidden" id="Jobid" value="<%= Jobid %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>"> 
                    
                   
                  </td>
                </tr>
              </form>
              <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">没有找到该职位!</td>
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
 Jobid       = Replace_text(request("Jobid"))
 PageNo      = Replace_text(request("PageNo"))
 BeginDate   = Replace_text(request("BeginDate"))
 EndDate     = Replace_text(request("EndDate"))

 
 '保存数据
 SQL = "UPdate [pH_Job_Base] Set TopAll=1,TopDate='"&BeginDate&"',TopEndDate='"&EndDate&"' Where Jobid="&Cstr(Jobid)
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

Call CloseDB()
 %>

