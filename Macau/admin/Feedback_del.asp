<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim page,action,id
page=request.QueryString("page")
action=request.QueryString("action")
id=request("id")
if id="" or isnumeric(id)=false then
Call ShowError("参数错误！")
end if
conn.execute("delete from [01387feedback] where id="&id)
call CloseConn()
Call ShowErrorTo("删除成功！",""&action&".asp?page="&page&"")
%>
