<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
server_v1=Request.ServerVariables("HTTP_REFERER")
server_v2=Request.ServerVariables("SERVER_NAME")
if mid(server_v1,8,len(server_v2))<>server_v2 then 
response.write("�ύ��������") 
response.end()
end if 
if Trim(request.form("title"))="" or request.form("mytype")="" or Trim(request.Form("content"))="" then
call showerror("��������д���ϣ�")
end if
conn.execute("insert into [01387Announce] values ('"&request.Form("mytype")&"','"&request.Form("title")&"','"&replace(replace(request.form("content"),chr(13),"<br>"),chr(32),"&nbsp;")&"','"&date()&"')")
call showerrorTo("�����ɹ���","AnnounceAdd.asp")
call CloseConn()
%>