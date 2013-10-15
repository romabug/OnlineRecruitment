<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim id,cid,page
page=cint(request.querystring("page"))
id=Cint(request.QueryString("id"))
cid=request.cookies("01387job")("cid")
set rs=server.createobject("adodb.recordset")
rs.open"select id,cid,jid from [01387joblist] where id="&id,conn,3,3
conn.execute("delete from [01387applylist] where jid='"&rs("jid")&"'")
conn.execute("delete from [01387favorite] where jid='"&rs("jid")&"'")
if rs("cid")<>request.cookies("01387job")("cid") then
response.Redirect("login.asp")
response.End()
end if
rs.delete
rs.update
rs.close
set rs=nothing
response.Redirect "joblist.asp?page="&page&""
conn.close
set conn=nothing
%>