<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim id,uid,page
page=cint(request.querystring("page"))
id=Cint(request.QueryString("id"))
uid=request.cookies("01387job")("uid")
set rs=server.createobject("adodb.recordset")
rs.open"select uid from [01387sendresume] where id="&id,conn,3,3
if rs(0)<>uid then
response.Redirect("login.asp")
response.End()
end if
rs.delete
rs.update
call closeconn()
response.Write"<script language=javascript>alert('É¾³ý³É¹¦£¡');"
response.write"this.location.href='OutSendResume.asp?page="&page&"';</SCRIPT>"
response.end()
%>