<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim id,cid
id=Cint(request.QueryString("id"))
cid=request.cookies("01387job")("cid")

set rs=server.CreateObject("adodb.recordset")
rs.open"select cid,company_message,uid,replytime,cid,member_message,status,applytime from [01387applylist] where id="&id,conn,1,3
if rs(0)<>cid then
response.Redirect("login.asp")
response.End()
end if
if rs("status")<2 then
rs("status")=2
end if
rs.update
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>求职信</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<body>
<script language=jscript>
	function call_window(url)
	{
		showModelessDialog(url,window,"dialogWidth:530px;dialogHeight:250px;center:yes;help:no;resizable:no;status:no");
	}
</script>
<style type="text/css">
<!--
body {
	background-color: #D4D0C8;
	
}
.idt{ height:50px; width:100%; color:#333333; text-align:center; font-size:14px; font-weight:bold; margin-top:50px; line-height:160%;}
-->
</style>
<table width="100%" height="167" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#EEEEEE" >
  <tr bgcolor="dbdbdb"> 
    <td height="26" align="left" bgcolor="#EEEEEE" style="font-size:14px;">&nbsp; <img src="../images/99.gif" width="16" height="16" />
      <%
					  set rs2=server.createobject("adodb.recordset")
					  rs2.open "select uname from [01387member] where uid='"&rs("uid")&"'" ,conn,1,1
					  %><b><%=rs2(0)%></b> 给您求职信：</td>
  </tr>
  <tr bgcolor="f0f0f0"> 
    <td height="84" valign="top" bgcolor="#FCFDFE"><strong>求职信内容：</strong><%=rs("member_message")%></td>
  </tr>
  <tr bgcolor="f0f0f0"> 
    <td height="54" align="center" bgcolor="#FCFDFE">
	
<!--	<button accesskey="K" type="submit" onclick="call_window('Apply_InterviewSelf.asp?uid=<%=rs("uid")%>',250,430);" class="win_"><img src="../images/90.gif" width="18" height="15" /> 通知来面试</button>&nbsp;</td>   -->
  </tr>
</table>
</body>
<%
rs.close
set rs=nothing
rs2.close
set rs2=nothing
conn.close
set conn=nothing
%>