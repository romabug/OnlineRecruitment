<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim id,uid,page
page=cint(request.querystring("page"))
id=Cint(request.QueryString("id"))
uid=request.cookies("01387job")("uid")
conn.execute("delete from [01387favorite] where id="&id&" and uid='"&uid&"'")
conn.close
set conn=nothing
response.Write"<script language=javascript>alert('ɾ���ɹ���');"
response.write"this.location.href='myfavo.asp?page="&page&"';</SCRIPT>"
response.end()
%>