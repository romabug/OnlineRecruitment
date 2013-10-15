<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
if request.Form("doneyear")="" or request.Form("job_career")="" then
response.Redirect("login.asp")
end if
set rs=server.createobject("adodb.recordset")
rs.open"select uid,username,doneyear,job_career,selfintro,updatetime from [01387member] where uid='"&request.cookies("01387job")("uid")&"' and username='"&request.cookies("01387job")("personusername")&"'",conn,3,3
rs("doneyear")=request.Form("doneyear")
rs("job_career")=replace(replace(request.Form("job_career"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("selfintro")=replace(replace(request.Form("selfintro"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("updatetime")=now()
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('²Ù×÷³É¹¦£¡');"
response.write"this.location.href='jobcareer.asp';</SCRIPT>"
response.end()
conn.close
%>