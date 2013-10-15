<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Comid,PageNo
Dim Locid,Sortid,CompanyName,JobName,Require,Place,Valid,InviteDate
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"171") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If
Action = Replace_text(request("action"))
Param  = Replace_text(request("Param"))


Select Case Action
 Case "edit"
  Call Edit_Submit() '//跳转到编辑函数
End Select

Set Rs = Conn.Execute("Select * From [pH_Locale_Jobs] Where Ncid="&Cstr(Param))
 Locid					= Rs("Locid")
 CompanyName			= Rs("CompanyName")
 JobName				= Rs("JobName")
 Require				= Rs("Require")
 Valid					= Rs("Valid")
 Locus_Area				= Rs("Locus_Area")
 Locus_City				= Rs("Locus_City")
 Users					= Rs("Users")
 Deal					= Rs("Deal")
 
 If Require <> "" Then Require = Replace(Require,"<br>",Chr(13))
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>添加招聘企业的招聘职位</strong></font></td>
  </tr>
  <tr>
    <td height="2"></td>
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
          <td bgcolor="#FFFFFF"> <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post" name="edit">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">企业名称：</td>
                  <td><%= CompanyName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" align="right">职位名称：</td>
                  <td> 
                    <input name="jobname" type="text" id="jobname" size="30" value="<%= jobname %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">招聘人数：</td>
                  <td> 
                    <input name="users" type="text" id="users" style="width:100px" value="<%= users %>" maxlength="4">
                    人 ( 默认为0,表示若干人 ) </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">待 遇：</td>
                  <td> 
                    <input name="deal" type="text" style="width:100px" value="<%= deal %>" maxlength="4">
                    元/月 ( 默认为0,表示待遇面议 )</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">有效期：</td>
                  <td> 
                    <select name="valid" size=1 >
                      <option value="0" <% If valid = 0 Then Response.write "Selected" %>>长期有效 
                      <option value="7" <% If valid = 7 Then Response.write "Selected" %>>一星期 
                      <option value="15" <% If valid = 15 Then Response.write "Selected" %>>半个月 
                      <option value="30" <% If valid = 30 Then Response.write "Selected" %>>一个月 
                      <option value="60" <% If valid = 60 Then Response.write "Selected" %>>两个月 
                      <option value="90" <% If valid = 90 Then Response.write "Selected" %>>三个月 
                      <option value="180" <% If valid = 180 Then Response.write "Selected" %>>半年 </select></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">工作地区：</td>
                  <td> 
                    <!--#include file="../Include/Class_Locus2.asp" -->
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">职位要求：</td>
                  <td> 
                    <textarea name="require" cols="45" rows="6" id="require"><%= require %></textarea></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">&nbsp; </td>
                  <td> 
                    <input type="submit" name="Submit" value="保存"> 
                    <input name="ncid" type="hidden" id="ncid" value="<%= Param %>"> 
                    <input name="companyname" type="hidden" id="companyname" value="<%= CompanyName %>"> 
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
Sub Edit_Submit() '修改密码
 
 ncid					= Replace_text(Request.form("ncid"))
 CompanyName			= Replace_text(Request.form("CompanyName"))
 JobName				= Replace_text(Request.form("JobName"))
 Require				= Replace_text(Request.form("Require"))
 Valid					= Replace_text(Request.form("Valid"))
 Users					= Replace_text(Request.form("Users"))
 Deal					= Replace_text(Request.form("Deal"))
 Locus_Area				= Replace_text(Request.form("x_suozaidi"))
 Locus_City				= Replace_text(Request.form("x_suozaidi1"))
 
 If Require <> "" Then Require = Replace(Require,Chr(13),"<br>")
 
 '保存数据
 SQL = "Update [pH_Locale_Jobs] Set CompanyName='"&CompanyName&"',JobName='"&JobName&"',Require='"&Require&"',Valid="&Valid&",Deal="&Deal&",Users="&Users&",Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"' Where Ncid="&Cstr(Ncid)
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='Web_Locale_Jobs.asp';</script>"
 Response.End()
End Sub

Call CloseDB()
 %>

