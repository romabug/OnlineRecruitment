<!--#include file="../../inc/Function.asp"-->
<%

set rs=server.createobject("adodb.recordset")
rs.open "select uid,username, promember from [01387member] where uid='"&request.cookies("01387job")("uid")&"' and username='"&request.cookies("01387job")("personusername")&"'",conn,1,1
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