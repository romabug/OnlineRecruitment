<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim MyChkgo,MyChk,resultuid,resultid
MyChkgo=request("ChkNo")
if MyChkgo="" then
Call ShowError("δѡ��")
end if
MyChk=split(MyChkgo,", ")
resultuid=""
resultid=""
for i=0 to Ubound(MyChk)
Myuid=split(MyChk(i),"|")
resultuid=resultuid&"'"&Myuid(0)&"'," '������uidд��һ����ʽ��'aaa','bbb','ccc',
resultid=resultid&"'"&Myuid(1)&"'," '������idд��һ����ʽ��'1','2','3',
next
resultuid=left(resultuid,len(resultuid)-1) 'ȥ�����һ�����ţ���ʽ��'aaa','bbb','ccc'
resultid=left(resultid,len(resultid)-1) 'ȥ�����һ�����ţ���ʽ��'1','2','3'
'response.Write(resultuid)
'response.End()
page=cint(request.querystring("page"))
cid=request.cookies("01387job")("cid")
conn.execute("update [01387applylist] set status=4 where id in ("&resultid&") and cid='"&cid&"'")
response.Write"<script language=javascript>alert('�����ɹ���');"
response.write"this.location.href='ApplyList.asp?page="&page&"';</SCRIPT>"
response.end()
conn.close
set conn=nothing
%>