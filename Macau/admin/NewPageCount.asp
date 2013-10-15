<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim mydate
mydate=request("mydate")
if request("mydate")<>"" then
Call RsName(rs,"Select mycount from [01387NewPageCount] where visittime='"&mydate&"'",1,1)
if rs.eof and rs.bof then
  Call ShowErrorTo("无记录！",""&request.ServerVariables("HTTP_REFERER")&"")
end if
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<!--#include file="PageCountTop.asp"-->
<%
else
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<!--#include file="PageCountTop.asp"-->
<%
response.end()
end if
%>
<!--#include file="inc/Page15.inc"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td width="100%" height="25" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF"> 
        页 面 流 量 统 计 结 果</font></strong></div></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="30"><strong><font color="#333333">　查看当日时间：</font><font color="#FF0000" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=mydate%></strong></font>　　本日页面总流量：<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=rs(0)%></font></strong></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
'call CloseRs()
'rs1.close
'set rs1=nothing
call CloseConn()
%>
</body>
</html>