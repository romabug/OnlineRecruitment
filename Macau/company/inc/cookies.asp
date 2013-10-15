<!--#include file="../../inc/Function.asp"-->
<%
if request.cookies("01387job")("cid")="" or request.cookies("01387job")("companyusername")="" then 
response.redirect("login.asp")
response.End()
end if
set rs=server.createobject("adodb.recordset")
rs.open "select cid,username from [01387company] where cid='"&request.cookies("01387job")("cid")&"' and username='"&request.cookies("01387job")("companyusername")&"'",conn,1,1
if rs(0)<>session("01387jobcid") then
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