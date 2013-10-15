<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim id,cid,page
page=cint(request.querystring("page"))
id=Cint(request.QueryString("id"))
cid=request.cookies("01387job")("cid")
conn.execute("update [01387applylist] set status=4 where id="&id&" and cid='"&cid&"'")
response.Write"<script language=javascript>alert('²Ù×÷³É¹¦£¡');"
response.write"this.location.href='"&request.QueryString("from")&".asp?page="&page&"';</SCRIPT>"
response.end()
conn.close
set conn=nothing
%>