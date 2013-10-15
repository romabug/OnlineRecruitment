<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim MyChkgo,MyChk,resultuid,resultid
MyChkgo=request("ChkNo")
if MyChkgo="" then
Call ShowError("未选择！")
end if
MyChk=split(MyChkgo,", ")
resultuid=""
resultid=""
for i=0 to Ubound(MyChk)
Myuid=split(MyChk(i),"|")
resultuid=resultuid&"'"&Myuid(0)&"'," '把所有uid写在一起，形式：'aaa','bbb','ccc',
resultid=resultid&"'"&Myuid(1)&"'," '把所有id写在一起，形式：'1','2','3',
next
resultuid=left(resultuid,len(resultuid)-1) '去除最后一个逗号，形式：'aaa','bbb','ccc'
resultid=left(resultid,len(resultid)-1) '去除最后一个逗号，形式：'1','2','3'
'response.Write(resultuid)
'response.End()
page=cint(request.querystring("page"))
cid=request.cookies("01387job")("cid")
conn.execute("update [01387applylist] set status=4 where id in ("&resultid&") and cid='"&cid&"'")
response.Write"<script language=javascript>alert('操作成功！');"
response.write"this.location.href='ApplyList.asp?page="&page&"';</SCRIPT>"
response.end()
conn.close
set conn=nothing
%>