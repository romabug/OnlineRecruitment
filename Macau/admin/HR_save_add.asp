<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim Rs,Title,Fromwhere,Pubtime,Content,types,Doc
session("filename")=""
session("filename1")=""
Title=Request.Form("title")
Doc=Request.Form("Doc")
Fromwhere=Request.Form("Fromwhere")
Pubtime=Request.form("Pubtime")
Content=request.Form("Content")
Types=request.Form("Types")
if title="" then
call ShowError("标题不能为空！")
end if
Set Rs=Server.Createobject("ADODB.Recordset")
Rs.open "Select * From [01387HR_Club]",Conn,3,3
	Rs.addnew()
	Rs("type")=Types
	Rs("title")=Title
	Rs("content")=Content
	Rs("pubtime")=Pubtime
	Rs("fromwhere")=Fromwhere
	If doc<>"" Then
	rs("Doc")=Doc
	End If
	Rs.update
	Call ShowErrorTo("操作成功！","HR_add.asp")	
Call CloseRs()
Call CloseConn()
%>