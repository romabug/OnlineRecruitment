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

dim reason,howlong,overtime
reason=request.Form("reason")
howlong=request.Form("howlong")
overtime=dateadd("h",howlong,now())
conn.execute("update [01387joblist] set closed=1,closed_reason='"&reason&"',closed_time='"&now()&"',closed_overtime='"&overtime&"' where jid='"&ChkNo&"'")
conn.execute("insert into [01387ClosedRecord] (jid,reason,closed_time,Closed_overtime,myaction,userdo) values ('"&ChkNo&"','"&reason&"','"&now()&"','"&overtime&"','����','"&request.cookies("01387job")("superlogin")&"')")
Call ShowErrorTo("����ɹ���",""&request("url")&"")
Call CLoseConn()
%>