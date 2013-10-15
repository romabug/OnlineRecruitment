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
<title>发送面试通知</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<body leftmargin="5" topmargin="10" marginwidth="0" marginheight="0">
<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#EEEEEE" >
  <tr bgcolor="dbdbdb"> 
    <td height="26" align="left" bgcolor="#D6EEFE"><img src="../images/90.gif" width="18" height="15" /> 发送给 
      <%
					  set rs2=server.createobject("adodb.recordset")
					  rs2.open "select uname from [01387member] where uid='"&rs("uid")&"'" ,conn,1,1
					  %><b><%=rs2(0)%></b> 面试通知：</td>
  </tr>
  <tr bgcolor="f0f0f0"> 
    <td height="40" bgcolor="#FCFDFE">内容：<%=rs(1)%></td>
  </tr>
  <tr bgcolor="f0f0f0"> 
    <td height="40" bgcolor="#FCFDFE"><img src="../images/99.gif" width="16" height="16" /> <b><%=rs2(0)%></b>的求职信：<%=rs("member_message")%></td>
  </tr>
  <tr bgcolor="f0f0f0"> 
    <td align="center" bgcolor="#FCFDFE"><input type="button" name="Button" value=" 关 闭 窗 口"  onClick="window.close()"style="height=30;width=130;font-size=12px"></td>
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