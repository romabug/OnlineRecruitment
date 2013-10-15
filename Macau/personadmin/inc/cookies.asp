<!--#include file="../../inc/Function.asp"-->
<%
if request.cookies("01387job")("uid")="" or request.cookies("01387job")("personusername")="" then 
response.redirect("login.asp")
response.End()
end if
set rs=server.createobject("adodb.recordset")
rs.open "select uid,username from [01387member] where uid='"&request.cookies("01387job")("uid")&"' and username='"&request.cookies("01387job")("personusername")&"'",conn,1,1
if rs(0)<>session("01387jobuid") then
response.redirect("login.asp")
response.End()
end if
if rs.eof or rs.bof then
response.redirect("login.asp")
response.End()
end if
rs.close
set rs=nothing
%>