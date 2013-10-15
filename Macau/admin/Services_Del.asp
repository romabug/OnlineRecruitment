<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=Cint(request.QueryString("id"))
conn.execute("delete from [01387services_info] where id="&id)
Call ShowErrorTo("²Ù×÷³É¹¦£¡","Services_add.asp")
Call CloseRs()
Call CloseConn()
%>