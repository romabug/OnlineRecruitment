<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<!--#include file="../personadmin/inc/md5.asp"-->
<%
ChkNo=request.Form("ChkNo")
if chkNO="" then
Call ShowError("��ѡ��һ����ҵ��")
end if
conn.execute("update [01387company] set password='"&md5("123456")&"' where cid='"&chkNO&"'")
Call ShowErrorTo("���óɹ���",""&request.ServerVariables("HTTP_REFERER")&"")
Call CloseConn()
%>