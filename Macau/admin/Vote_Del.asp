<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=Cint(request.QueryString("id"))
if request.QueryString("action")="title" then
conn.execute("delete from [01387VoteSelect] where titleid="&id)
conn.execute("delete from [01387VoteTitle] where id="&id)
end if
if request.QueryString("action")="select" then
conn.execute("delete from [01387VoteSelect] where id="&id)
end if
Call ShowErrorTo("²Ù×÷³É¹¦£¡","Vote.asp")
Call CloseConn()
%>