<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../../conn.asp"-->
<%
set rs=server.createobject("ADODB.recordset") 
rs.Open "select uid,email from [01387member] where uid<>'"&request.cookies("01387job")("uid")&"' and email='"&request("email")&"'",conn,1,1
if rs.recordcount=1 then 
   can="not"
else
   can="yes"
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理</title>
<link href="../../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
window.onload = function() {
	window.returnValue = window.dialogArguments;
}
</script>

</head>

<body oncontextmenu="return false;" onselectstart="return false;" topmargin="5" leftmargin="5" bgcolor="#D4D0C8">
<table width="101%" border="0" cellpadding="10" style="border-collapse: collapse">
  <tr>
    <td align="center"><br>    <%if can="not" then%>
邮箱名<br />
<br />
<font class="wel2"><%=Request("email")%></font>　<br />
<br />
不可使用！请重新选择！
<%else%>
恭喜您！邮箱名<br />
<br />
　<font class="wel2"><%=Request("email")%></font>　<br />
<br />
可以使用！
<%end if%></td>
  </tr>
</table>
</body>
</html>
<%
rs.close
set rs=nothing
%>
