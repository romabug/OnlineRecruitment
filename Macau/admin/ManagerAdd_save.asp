<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="../personadmin/inc/md5.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
server_v1=Request.ServerVariables("HTTP_REFERER")
server_v2=Request.ServerVariables("SERVER_NAME")
if mid(server_v1,8,len(server_v2))<>server_v2 then 
response.write("提交参数错误！") 
response.end()
end if 
if Trim(request.form("userpower"))="" or request.form("username")="" then
call showerror("请完整填写资料！")
end if
Call RsName(rs,"select username from [01387lch_admin] where username='"&request.Form("username")&"'",1,1)
if rs.recordcount>=1 then
Call ShowError("用户名重复！")
end if
conn.execute("insert into [01387lch_admin] values ('"&request.Form("username")&"','"&md5(123456)&"','"&request.form("userpower")&"','"&date()&"')")
call showerrorTo("操作成功！","ManagerAdd.asp")
call CloseConn()
%>