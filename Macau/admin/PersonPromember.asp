<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
uid=request("ChkNo")
if uid="" then
Call ShowError("未选择！")
end if
if len(uid)>15 then
Call ShowError("请单选操作！")
end if
set rs=conn.execute("select Count(id) from [01387applypro] where uid='"&uid&"'")
if rs(0)>=1 then
Call ShowError("已经是高级人才！")
else
conn.execute("insert into [01387applypro] (uid,passok,refuse,passtime,applytime) values ('"&uid&"',3,'','"&date()&"','"&date()&"')") 
conn.execute("update [01387member] set promember=1 where uid='"&uid&"'")
end if
Call CloseRs()
call CloseConn()
Call ShowErrorTo("推荐成功！","PersonList.asp")
%>
