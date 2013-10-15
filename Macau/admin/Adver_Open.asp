<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=Cint(request.QueryString("id"))
if request.QueryString("action")="open" then
conn.execute("update [01387AdvLogo] set show=1 where id="&id)
else
conn.execute("update [01387AdvLogo] set show=0 where id="&id)
end if
Call ShowErrorTo("²Ù×÷³É¹¦£¡","Adver_Right.asp")
Call CloseConn()
%>