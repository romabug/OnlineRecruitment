<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim pid
pid=request.form("pid")
if len(pid)<>15 then
Call ShowError("参数错误！")
end if
if pid="" then
Call ShowError("请选择一条信息！")
end if
conn.execute("update [01387PartTime] set passok=1 where pid='"&pid&"'")
call CloseConn()
Call ShowErrorTo("操作成功！","FreeList.asp")
%>
