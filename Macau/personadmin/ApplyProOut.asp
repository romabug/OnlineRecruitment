<%@ Language=VBScript %>
<%response.buffer=false%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("ADODB.recordset") 
rs.open "select idcardpic from [01387applypro] where uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
if rs.eof and rs.bof then
Call ShowErrorTo("û�иü�¼��","ApplyPro.asp")
end if
set fso=server.CreateObject("Scripting.FileSystemObject")
If fso.fileexists(server.MapPath("upload/"&rs(0)&"")) then
fso.deletefile(server.mappath("upload/"&rs(0)&""))
end if
conn.execute("delete from [01387applypro] where uid='"&request.cookies("01387job")("uid")&"'")
conn.execute("update [01387member] set promember=0,procommend=0 where uid='"&request.cookies("01387job")("uid")&"'")
call CloseConn()
Call ShowErrorTo("�����ɹ���","ApplyPro.asp")
%>