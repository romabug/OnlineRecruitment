<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request.Form("ChkNo")
if chkNO="" then
Call ShowError("请选择一家企业！")
end if
conn.execute("delete from [01387joblist] where cid='"&ChkNo&"'")
conn.execute("delete from [01387applylist] where cid='"&ChkNo&"'")
conn.execute("delete from [01387favorite] where cid='"&ChkNo&"'")
conn.execute("delete from [01387company] where cid='"&ChkNo&"'")
Call ShowErrorTo("操作成功！","CompanyList.asp")
Call CloseConn()
%>