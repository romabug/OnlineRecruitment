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
conn.execute("delete from [01387PartTime] where pid='"&pid&"'")
call CloseConn()
Call ShowErrorTo("�����ɹ���","FreeList.asp")
%>
