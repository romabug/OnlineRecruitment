<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim cid,jid
cid=request.cookies("01387job")("cid")
jid=request.querystring("jid")
Call RePublishJob(jid)
set rs=server.createobject("adodb.recordset")
rs.open "select jid,cid,publishtime,detailtime from [01387joblist] where jid='"&jid&"'",conn,3,3
if rs("cid")<>cid then
response.Redirect("login.asp")
end if
if rs("publishtime")>=DateAdd("d",-2,date) then
response.Write"<script language=javascript>alert('两天内不能重发！');"
response.write"this.location.href='javascript:history.go(-1)';</SCRIPT>"
response.end()
else
rs("publishtime")=date()
rs("detailtime")=now()
end if
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('操作成功！');"
response.write"this.location.href='joblist.asp';</SCRIPT>"
response.end()
conn.close
%>