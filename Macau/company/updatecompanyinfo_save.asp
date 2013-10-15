<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim cid,username
cid=request.cookies("01387job")("cid")
username=request.cookies("01387job")("companyusername")
if request.Form("trade")="" or request.Form("properity")="" then
response.Redirect("login.asp")
end if
set rs=server.createobject("adodb.recordset")
rs.open "select cid,username,licence,trade,properity,u_year,u_month,u_day,fund,employee,legal,intro,updatetime from [01387company] where cid='"&cid&"' and username='"&username&"'",conn,3,3
rs("licence")=request.Form("licence")
rs("trade")=request.Form("trade")
rs("properity")=request.Form("properity")
rs("u_year")=request.Form("u_year")
rs("u_month")=request.Form("u_month")
rs("u_day")=request.Form("u_day")
rs("fund")=request.Form("fund")
rs("employee")=request.Form("employee")
rs("legal")=request.Form("legal")
rs("intro")=replace(replace(request.Form("intro"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("updatetime")=now()
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('ÐÞ¸Ä³É¹¦£¡');"
response.write"this.location.href='updatecompanyinfo.asp';</SCRIPT>"
response.end()
conn.close
%>