<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<!--#include file="../personadmin/inc/md5.asp"-->
<%
ChkNo=request.Form("ChkNo")
if chkNO="" then
Call ShowError("请选择一家企业！")
end if
conn.execute("update [01387company] set password='"&md5("123456")&"' where cid='"&chkNO&"'")
Call ShowErrorTo("重置成功！",""&request.ServerVariables("HTTP_REFERER")&"")
Call CloseConn()
%>