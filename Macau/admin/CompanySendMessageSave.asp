<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
cid=request.querystring("cid")
conn.execute("insert into [01387CompanyMessage] (cid,title,content,addtime) values ('"&cid&"','"&request.form("title")&"','"&replace(replace(request.form("content"),chr(13),"<br>"),chr(32),"&nbsp;")&"','"&date()&"')")
call ShowErrorTo("·¢ËÍ³É¹¦£¡","CompanyList.asp")
%>