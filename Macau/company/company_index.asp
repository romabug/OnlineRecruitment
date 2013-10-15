<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"'",conn,1,1
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%=rs("username")%><br>
<%
knowfrom=split(rs("knowfrom"),",")
for i=0 to ubound(knowfrom)
response.Write(""&knowfrom(i)&"<br>")
next
%>
<br><a href="logout.asp">退出登录 </a><br>
</body>
</html>
