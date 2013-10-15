<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=Cint(request.QueryString("id"))
call RsName(rs,"select img from [01387AdvLogo] where id="&id&"",3,3)
set fso=server.CreateObject("Scripting.FileSystemObject")
fso.deletefile(server.mappath("../ad/"&rs(0)&""))
conn.execute("delete from [01387AdvLogo] where id="&id)
Call ShowErrorTo("²Ù×÷³É¹¦£¡","Adver_Right.asp")
Call CloseRs()
Call CloseConn()
%>