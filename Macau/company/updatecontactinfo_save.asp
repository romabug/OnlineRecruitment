<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim cid,username
cid=request.cookies("01387job")("cid")
username=request.cookies("01387job")("companyusername")
if request.Form("contact")="" or request.Form("tel")="" then
response.Redirect("login.asp")
end if

 

set rs=server.createobject("adodb.recordset")
rs.open "select cid,username,contact,tel,fax,mobile,email,website,province,citys,address,zipcode,updatetime from [01387company] where cid='"&cid&"' and username='"&username&"'",conn,3,3
rs("contact")=request.Form("contact")
rs("tel")=request.Form("tel")
rs("fax")=request.Form("fax")
rs("mobile")=request.Form("mobile")
rs("email")=request.form("email")
rs("website")=request.Form("website")
rs("province")=request.Form("province")
rs("citys")=request.Form("citys")
rs("address")=request.Form("address")
rs("zipcode")=request.Form("zipcode")
rs("updatetime")=now()
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('²Ù×÷³É¹¦£¡');"
response.write"this.location.href='updatecontactinfo.asp';</SCRIPT>"
response.end()
conn.close
%>