<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request("ChkNo")
if chkNO="" then
Call ShowError("请选择一家企业！")
end if
if len(chkNO)<>15 then
Call ShowError("参数错误！")
end if
dim reason,howlong,overtime
reason=request.Form("reason")
howlong=request.Form("howlong")
overtime=dateadd("h",howlong,now())
conn.execute("update [01387company] set closed=1,closed_reason='"&reason&"',closed_time='"&now()&"',closed_overtime='"&overtime&"' where cid='"&ChkNo&"'")
conn.execute("insert into [01387ClosedRecord] (cid,reason,closed_time,Closed_overtime,myaction,userdo) values ('"&ChkNo&"','"&reason&"','"&now()&"','"&overtime&"','冻结','"&request.cookies("01387job")("superlogin")&"')")
Call ShowErrorTo("冻结成功！",""&request("url")&"")
Call CLoseConn()
%>