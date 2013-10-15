<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=Cint(request.QueryString("id"))
call RsName(rs,"select doc from [01387HR_club] where id="&id&"",1,1)
filepath="../hr_club/doc/"&rs(0)&""
set fso=server.CreateObject("Scripting.FileSystemObject")
if fso.FileExists(server.mappath(filepath)) then
fso.deletefile(server.mappath(filepath))
end if
conn.execute("delete from [01387HR_club] where id="&id)
Call ShowErrorTo("²Ù×÷³É¹¦£¡","HR_add.asp")
Call CloseRs()
Call CloseConn()
%>