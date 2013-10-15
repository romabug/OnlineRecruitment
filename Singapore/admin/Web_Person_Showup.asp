<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Perid,PageNo
Dim TypeId,TypeName,News
'//检测是否跨站
Call Check_url()
'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"12") <= 0 Then 
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">■ <strong>设置个人会员的自荐</strong></font></td>
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
 Set Rs = Conn.Execute("Select Username,Nc_Best_Level,Nc_Best_Ads From [pH_Person_Base] Where Perid='"&Perid&"'")
 If Not Rs.Eof Then
  Username      = Rs(0) 
  Level			= Rs(1)
  Ads			= Rs(2)
%>
              <form action="?action=edit" method="post">
                <tr bgcolor="f5f5f5">
                  <td height="25" align="right" bgcolor="f5f5f5">帐 号：</td>
                  <td bgcolor="f5f5f5"><%= Username %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">自荐广告词：</td>
                  <td bgcolor="f5f5f5"><textarea name="ads" id="ads"><%= Ads %></textarea></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">期 限：</td>
                  <td bgcolor="f5f5f5"> <select name="level" id="level">
                      <option value="7" <% If Level = 7 Then Response.write "Selected" %>>一周</option>
                      <option value="14" <% If Level = 14 Then Response.write "Selected" %>>两周</option>
                      <option value="30" <% If Level = 30 Then Response.write "Selected" %>>一个月</option>
                      <option value="60" <% If Level = 60 Then Response.write "Selected" %>>两个月</option>
                      <option value="90" <% If Level = 90 Then Response.write "Selected" %>>三个月</option>
                      <option value="180" <% If Level = 180 Then Response.write "Selected" %>>半年</option>
                      <option value="365" <% If Level = 365 Then Response.write "Selected" %>>一年</option>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">开始时间：</td>
                  <td bgcolor="f5f5f5"> <input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= Date() %>"> 
                    <input name="Perid" type="hidden" id="Perid" value="<%= Perid %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="设 置"></td>
                </tr>
              </form>
              <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">没有找到该会员!</td>
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
 Level       = Replace_text(request("Level"))
 Ads		 = Replace_text(request("Ads"))
 BeginDate   = Replace_text(request("BeginDate"))
 '判断会员是否被审核过
 Set Rs = Conn.Execute("Select Flag From [pH_Person_Base] Where Perid='"&Trim(Perid)&"'")
 If Rs(0) = False Then
   Response.write "<script language=JavaScript>alert('操作错误！请先通过对该会员的审核');location.href='"&PageNo&"';</script>"
   Response.End()
 End if
 Rs.Close
 
 '设置
 SQL = "UPdate [pH_Person_Base] Set Nc_Best_Flag=1,Nc_Best_Level="&Level&",Nc_Best_Date='"&BeginDate&"',Nc_Best_EndDate=DateAdd(d,"&Level&",'"&BeginDate&"'),Nc_Best_ApplyDate=null,Nc_Best_Ads='"&Ads&"' Where Perid='"&Trim(Perid)&"'"
 Conn.Execute(SQL)

 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

Call CloseDB()
 %>

