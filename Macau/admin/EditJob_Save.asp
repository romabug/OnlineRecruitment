<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim jid
jid=request.Form("jid")

set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387joblist] where jid='"&jid&"'",conn,3,3
rs("maincatelog")=request.Form("maincatelog")
rs("subcatelog")=request.Form("subcatelog")
rs("jobname")=request.Form("jobname")
rs("neednum")=request.Form("neednum")
rs("overtime")=request.Form("overtime")
rs("degree")=request.Form("degree")
rs("jobcity")=request.Form("jobcity")
rs("doneyear")=request.Form("doneyear")
rs("sex")=request.Form("sex")
rs("needage")=request.Form("needage")
rs("demand")=replace(replace(request.Form("demand"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("salary")=request.Form("salary")
rs("interview")=replace(replace(request.Form("interview"),chr(32),"&nbsp;"),chr(13),"<br>")
if request.form("contact")<>"" and request.Form("tel")<>"" then
rs("contact")=request.Form("contact")
rs("tel")=request.Form("tel")
rs("fax")=request.Form("fax")
rs("email")=request.form("email")
rs("address")=request.Form("address")
rs("zipcode")=request.Form("zipcode")
rs("publishtime")=date()
rs("detailtime")=now()
rs("canshow")="ok"
end if
rs.update
rs.close
set rs=nothing
conn.close
Call ShowErrorTo("²Ù×÷³É¹¦£¡","JobList.asp")
%>