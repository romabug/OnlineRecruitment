<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<%
cid=request("cid")
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where cid='"&cid&"'",conn,3,3
rs("lastlogin")=request.Form("lastlogin")
rs("companyname")=request.Form("companyname")
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
rs("contact")=request.Form("contact")
rs("tel")=request.Form("tel")
rs("fax")=request.Form("fax")
rs("mobile")=request.Form("mobile")
rs("email")=request.Form("email")
rs("website")=request.Form("website")
rs("province")=request.Form("province")
rs("citys")=request.Form("citys")
rs("address")=request.Form("address")
rs("zipcode")=request.Form("zipcode")
rs.update
rs.close
set rs=nothing
Call CloseConn()
Call ShowErrorTo("ÐÞ¸Ä³É¹¦£¡","CompanyList.asp?page="&request("page")&"")
%>