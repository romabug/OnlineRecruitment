<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim pid
pid=request.form("pid")
if len(pid)<>15 then
Call ShowError("��������")
end if
if pid="" then
Call ShowError("��ѡ��һ����Ϣ��")
end if
conn.execute("update [01387PartTime] set passok=1 where pid='"&pid&"'")
call CloseConn()
Call ShowErrorTo("�����ɹ���","FreeList.asp")
%>
