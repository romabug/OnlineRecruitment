<!--#include file="../conn.asp"-->
<!--#include file="../inc/Function.asp"-->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
Call RsName(rs22,"select top 1 * from [01387applylist]  where cid='20071081644'',1,1)
%>
简历数量 <%=rs22(0)%>



</body>
</html>
