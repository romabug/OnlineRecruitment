<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
if request.Form("edu_career")="" then
response.Redirect("login.asp")
end if
set rs=server.createobject("adodb.recordset")
rs.open"select uid,username,degree,college,spec1,spec2,com_level,zzmm,l_type1,l_type2,l_level1,l_level2,certificate,edu_career,updatetime from [01387member] where uid='"&request.cookies("01387job")("uid")&"' and username='"&request.cookies("01387job")("personusername")&"'",conn,3,3
rs("degree")=request.Form("degree")
rs("college")=request.Form("college")
rs("spec1")=request.Form("spec1")
rs("spec2")=request.Form("spec2")
rs("com_level")=request.Form("com_level")
rs("zzmm")=request.Form("zzmm")
rs("l_type1")=request.Form("l_type1")
rs("l_type2")=request.Form("l_type2")
rs("l_level1")=request.Form("l_level1")
rs("l_level2")=request.Form("l_level2")
rs("certificate")=request.Form("certificate")
rs("edu_career")=replace(replace(request.Form("edu_career"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("updatetime")=now()
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('²Ù×÷³É¹¦£¡');"
response.write"this.location.href='educareer.asp';</SCRIPT>"
response.end()
conn.close
%>