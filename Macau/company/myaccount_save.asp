<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!--#include file="inc/md5.asp"-->
<%
if request.Form("pwd1")="" then
response.Redirect("login.asp")
end if
set rs=server.createobject("adodb.recordset")
rs.open"select cid,username,password from [01387company] where cid='"&request.cookies("01387job")("cid")&"' and username='"&request.cookies("01387job")("companyusername")&"'",conn,3,3
rs("password")=md5(request.form("pwd1"))
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('²Ù×÷³É¹¦£¡');"
response.write"this.location.href='myaccount.asp';</SCRIPT>"
response.end()
conn.close
%>
