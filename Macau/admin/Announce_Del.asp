<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=Cint(request.QueryString("id"))
conn.execute("delete from [01387Announce] where id="&id)
Call ShowErrorTo("²Ù×÷³É¹¦£¡","AnnounceAdd.asp")
Call CloseConn()
%>