<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!--#include file="../company/inc/md5.asp"-->
<%
if request.Form("pwd1")="" or request.Form("pwd2")="" then
response.Redirect("login.asp")
end if
set rs=server.createobject("adodb.recordset")
rs.open "select uid,email from [01387member] where uid<>'"&request.cookies("01387job")("uid")&"' and email='"&request.form("email")&"'",conn,1,1
if rs.recordcount=1 then
  response.Write"<script language=javascript>alert('此邮箱名已经存在，请重新输入！');"
  response.write"javascript:history.go(-1)</SCRIPT>"
  response.end()
end if
rs.close
set rs=nothing
set rs=server.createobject("adodb.recordset")
rs.open"select uid,username,password,email,updatetime from [01387member] where uid='"&request.cookies("01387job")("uid")&"' and username='"&request.cookies("01387job")("personusername")&"'",conn,3,3
rs("password")=md5(request.form("pwd1"))
rs("email")=request.Form("email")
rs("updatetime")=now()
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('操作成功！');"
response.write"this.location.href='myaccount.asp';</SCRIPT>"
response.end()
conn.close
%>
