<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<%
cid=request("cid")

Call RsName(rs,"select closed,closed_reason,closed_time,closed_overtime from [01387company] where cid='"&cid&"'",1,1)
if rs.recordcount=0 then
	Response.redirect("Index.asp")
	response.end()	
end if
if rs(0)=false then
	Response.redirect("Index.asp")
	response.end()
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-企业招聘管理</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.abc {
	font-size: 12px;
	line-height: 24px;
}
.STYLE1 {
	color: #00CC00;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="93%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40" class="td">&nbsp;</td>
  </tr>
  <tr>
    <td width="553" class="abc" style="word-break:break-all">您好！贵企业帐号目前为<span class="STYLE1">冻结状态</span>！<br>
      冻结原因：<font color="#003399"><%=rs(1)%></font><br>
      冻结时间：<font color="#FF3300" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs(2)%></strong></font><br>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
