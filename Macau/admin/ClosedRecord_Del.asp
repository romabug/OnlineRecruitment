<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=request.form("id")
if id="" then
	Call ShowError("δѡ��")
end if
conn.execute("delete from [01387ClosedRecord] where id in ("&id&")")
Call ShowErrorTo("�����ɹ���","ClosedRecord.asp?page="&request.QueryString("page")&"")
Call CloseConn()
%>