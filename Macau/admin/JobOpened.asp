<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request("ChkNo")
if chkNO="" then
Call ShowError("请选择一个职位！")
end if
if len(chkNO)<>15 then
Call ShowError("参数错误！")
end if
conn.execute("update [01387joblist] set closed=0,closed_reason='',closed_time='"&now()&"',closed_overtime='' where jid='"&ChkNo&"'")
conn.execute("insert into [01387ClosedRecord] (jid,reason,closed_time,Closed_overtime,myaction,userdo) values ('"&ChkNo&"','','"&now()&"','','解冻','"&request.cookies("01387job")("superlogin")&"')")
Call ShowErrorTo("解冻成功！",""&request("url")&"")
Call CLoseConn()
%>