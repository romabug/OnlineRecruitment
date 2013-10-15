<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request.form("ChkNo")
page=request.form("page")
if chkNO="" then
Call ShowError("请选择一家企业！")
end if
if len(chkNO)<>15 then
Call ShowError("参数错误！")
end if
Call RsName(rs,"Select famous from [01387company] where cid='"&ChkNo&"'",1,1)
if rs(0)=true then
ShowError("知名企业不可加急！")
Call CloseRs()
end if
Call RsName(rs,"Select Count(id) from [01387company] where hurry=1 and cid<>'"&ChkNo&"'",1,1)
if rs(0)>=6 then
ShowError("加急企业已经达到6家，不可再新增加急！")
Call CloseRs()
end if
Call RsName(rs,"Select hurry from [01387company] where cid='"&ChkNo&"'",3,3)
if rs(0)=true then
conn.execute("update [01387company] set hurry='0' where cid='"&ChkNo&"'")
else
conn.execute("update [01387company] set hurry='1' where cid='"&ChkNo&"'")
end if
call closers()
call closeconn()
call ShowErrorTo("操作成功！","CompanyList.asp?Page="&page&"")
%>