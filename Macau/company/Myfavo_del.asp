<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
MyChkgo=request("ChkNo")
if MyChkgo="" then
Call ShowError("δѡ��")
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
Call ShowErrorTo("�����ɹ���","Myfavo.asp?page="&page&"")
%>