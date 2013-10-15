<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=request.form("id")
conn.execute("delete from [01387loginrecord] where id in ("&id&")")
Call ShowErrorTo("²Ù×÷³É¹¦£¡","LoginRecord.asp?page="&request.QueryString("page")&"")
Call CloseConn()
%>