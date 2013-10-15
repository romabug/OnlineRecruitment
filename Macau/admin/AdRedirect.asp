<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<%
Url=request.QueryString("Url")
id=Cint(request.QueryString("id"))
conn.execute("update [01387AdvLogo] set hit=hit+1 where id="&id)
response.Redirect(Url)
Call CloseConn()
%>