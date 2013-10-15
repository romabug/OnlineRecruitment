<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"--> 
<%
dim Rs,Title,Fromwhere,Pubtime,Content,types
Title=Request.Form("title")
Fromwhere=Request.Form("Fromwhere")
Pubtime=Request.form("Pubtime")
Content=request.Form("Content")
Types=request.Form("Types")
if title="" then
call ShowError("标题不能为空！")
end if
Set Rs=Server.Createobject("ADODB.Recordset")
Rs.open "Select * From [01387services_info]",Conn,3,3
	Rs.addnew()
	Rs("type")=Types
	Rs("title")=Title
	Rs("content")=Content
	Rs("pubtime")=Pubtime
	Rs("fromwhere")=Fromwhere
	Rs.update
	Call ShowErrorTo("操作成功！","Services_add.asp")	
Call CloseRs()
Call CloseConn()
%>