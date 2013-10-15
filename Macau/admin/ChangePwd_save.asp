<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="../personadmin/inc/md5.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
server_v1=Request.ServerVariables("HTTP_REFERER")
server_v2=Request.ServerVariables("SERVER_NAME")
if mid(server_v1,8,len(server_v2))<>server_v2 then 
response.write("参数错误！") 
response.end()
end if 
id=Cint(request.form("id"))
call RsName(rs,"select id,username,password from [01387lch_admin] where id="&id&"",3,3)
if rs(1)<>request.cookies("01387job")("superlogin") then
Call ShowError("无权限！")
end if
rs(2)=md5(request.form("pwd1"))
rs.update
Call CloseRs()
Call CloseConn()
Call ShowErrorTo("操作成功！","ChangePwd.asp")
%>