<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
server_v1=Request.ServerVariables("HTTP_REFERER")
server_v2=Request.ServerVariables("SERVER_NAME")
if mid(server_v1,8,len(server_v2))<>server_v2 then 
response.write("提交参数错误！") 
response.end()
end if 
if Trim(request.form("title"))="" or request.form("mytype")="" then
call showerror("请完整填写资料！")
end if
Session("votetitle")=Trim(request.form("title"))
conn.execute("insert into [01387VoteTitle] values ('"&Session("votetitle")&"','"&request.form("mytype")&"','"&date()&"')")
response.redirect("Vote_Add_Two.asp")
call CloseConn()
%>