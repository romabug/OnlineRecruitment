<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim applyid,uid
applyid=request.QueryString("applyid")
uid=request.cookies("01387job")("uid")

set rs=server.CreateObject("adodb.recordset")
rs.open"select applyid,uid,company_message from [01387applylist] where applyid='"&applyid&"'",conn,1,1
if rs(1)<>uid then
response.Redirect("login.asp")
response.End()
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>面试通知</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<body ><style type="text/css">
<!--
body {
	background-color: #D4D0C8;
	margin:0px;
}
-->
</style>
<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
  <tr >
    <td align="left" valign="bottom" ><img src="image/21.gif" width="16" height="16" /><strong> 面试通知内容</strong><br />
      <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="ter">
        <tr>
          <td height="85" valign="top" class="ter2">&nbsp;&nbsp;<%=rs("company_message")%></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>