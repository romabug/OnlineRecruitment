<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request("ChkNo")
if chkNO="" then
Call ShowError("��ѡ��һ��ְλ��")
end if
if len(chkNO)<>15 then
Call ShowError("��������")
end if
conn.execute("update [01387joblist] set closed=0,closed_reason='',closed_time='"&now()&"',closed_overtime='' where jid='"&ChkNo&"'")
conn.execute("insert into [01387ClosedRecord] (jid,reason,closed_time,Closed_overtime,myaction,userdo) values ('"&ChkNo&"','','"&now()&"','','�ⶳ','"&request.cookies("01387job")("superlogin")&"')")
Call ShowErrorTo("�ⶳ�ɹ���",""&request("url")&"")
Call CLoseConn()
%>