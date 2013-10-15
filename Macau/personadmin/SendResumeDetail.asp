<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
id=Cint(request.QueryString("id"))
set rs1=server.createobject("adodb.recordset")
rs1.open "select otherdemand,uid from [01387sendresume] where id='"&id&"'" ,conn,1,1
if rs1(1)<>request.cookies("01387job")("uid") then
response.Redirect("login.asp")
response.End()
end if
%>
<html>
<head>
<title>其它说明/要求</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.12 {
	font-size: 12px;
	line-height: 26px;
}
-->
</style>
</head>

<body leftmargin="0" topmargin="5" marginwidth="0" marginheight="0">
<table width="400" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC" class="12">
  <tr> 
    <td bgcolor="dbdbdb"><div align="center">其它说明/要求</div></td>
  </tr>
  <tr> 
    <td bgcolor="f0f0f0"><div align="center"><%=rs1(0)%></div></td>
  </tr>
  <tr>
    <td bgcolor="f0f0f0"><div align="center"><a href="javascript:window.close()">[关闭窗口]</a></div></td>
  </tr>
</table>
</body>
</html>
<%rs1.close
set rs1=nothing
conn.close
set conn=nothing%>