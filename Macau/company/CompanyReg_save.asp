<!--#include file="../conn.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
Call Remote()
if request.form("uname")="" or request.form("email")=""  then
Call ShowError("����δ��д������")
end if
Conn.execute("insert into [01387Feedback] (uname,cid,email,mytype,company,tel,content,addtime) values ('"&request.form("uname")&"','"&request.cookies("01387job")("cid")&"','"&request.form("email")&"',8,'"&request.form("company")&"','"&request.form("tel")&"','"&replace(replace(request.form("content"),chr(13),"<br>"),chr(32),"&nbsp;")&"','"&now()&"')")
Call CloseConn()
Call ShowErrorTo("����ɹ�����ȴ�������ˣ�","default.asp")
%>