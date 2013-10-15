<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
MyChkgo=request("ChkNo")
if MyChkgo="" then
Call ShowError("未选择！")
end if
MyChk=split(MyChkgo,", ")
uid=""
for i=0 to Ubound(MyChk)
uid=uid&"'"&MyChk(i)&"',"
next
uid=left(uid,len(uid)-1)
page=cint(request.QueryString("page"))
cid=request.cookies("01387job")("cid")
conn.execute("delete from [01387favorite] where uid in ("&uid&") and cid='"&cid&"'")
Call ShowErrorTo("操作成功！","Myfavo.asp?page="&page&"")
%>