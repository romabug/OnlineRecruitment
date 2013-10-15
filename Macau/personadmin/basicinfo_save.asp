<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
if request.Form("uname")="" or request.Form("tel")="" then
response.Redirect("login.asp")
end if
set rs=server.createobject("adodb.recordset")
rs.open"select * from [01387member] where uid='"&request.cookies("01387job")("uid")&"' and username='"&request.cookies("01387job")("personusername")&"'",conn,3,3
rs("uname")=request.Form("uname")
rs("sex")=request.Form("sex")
rs("nation")=request.Form("nation")
rs("u_year")=request.Form("u_year")
rs("u_month")=request.Form("u_month")
rs("u_day")=request.Form("u_day")
rs("birthday")=request.Form("u_year")&"-"&request.Form("u_month")&"-"&request.Form("u_day")
rs("height")=request.Form("height")
rs("cardtype")=request.Form("cardtype")
rs("cardno")=request.Form("cardno")
rs("marry")=request.Form("marry")
rs("province")=request.Form("province")
rs("citys")=request.Form("citys")
rs("tel")=request.Form("tel")
rs("mobile")=request.Form("mobile")
rs("chatno")=request.Form("chatno")
rs("selfweb")=request.Form("selfweb")
rs("address")=request.Form("address")
rs("zipcode")=request.Form("zipcode")
rs("updatetime")=now()
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('²Ù×÷³É¹¦£¡');"
response.write"this.location.href='basicinfo.asp';</SCRIPT>"
response.end()
conn.close
%>