<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<html>
<head>
<title>澳门劳工招聘网 Macau69.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="180,*" frameborder="NO" border="0" framespacing="0">
<%if Cint(request.cookies("01387job")("userpower"))<2 then%>
  <frame src="/admin/left_c.asp" name="leftFrame" scrolling="NO" noresize>
<%else%>
  <frame src="/admin/left.asp" name="leftFrame" scrolling="NO" noresize>
<%end if%>
  <frame src="/admin/main.asp" name="mainFrame">
</frameset>
<noframes><body>

</body></noframes>
</html>
