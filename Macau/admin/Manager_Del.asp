<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=Cint(request.QueryString("id"))
Call RsName(rs,"select userpower from [01387lch_admin] where id="&id&"",1,1)
if Cint(request.cookies("01387job")("userpower"))<=Cint(rs(0)) then
Call ShowError("��Ȩ�ޣ�")
end if
conn.execute("delete from [01387lch_admin] where id="&id)
conn.execute("delete from [01387loginrecord] where userid="&id)
Call ShowErrorTo("�����ɹ���","ManagerAdd.asp")
Call CloseConn()
%>