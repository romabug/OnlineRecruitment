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
dim i,j
Call RsName(rs,"select id from [01387VoteTitle] where title='"&session("votetitle")&"'",1,1)
for i=0 to request.form.count-3
  if Trim(request.form("selectitem"&i&""))="" then
  call showerror("请完整输入全部投票选项！")
  end if
next
for j=0 to request.form.count-3  
conn.execute("insert into [01387VoteSelect] values ('"&rs(0)&"','"&request.form("selectitem"&j&"")&"',0)")
next
Session("votetitle")=""
Call ShowErrorTo("操作成功！","Vote.asp")
Call CLoseRs()
Call CloseConn()
%>