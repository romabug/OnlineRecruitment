<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim jid,cid,uid,url,urlgo
url=request.ServerVariables("HTTP_REFERER")
urlgo=right(url,len(url)-instrrev(url,"/"))
jid=request.QueryString("jid")
cid=request.QueryString("cid")
uid=request.cookies("01387job")("uid")
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from [01387favorite] where uid='"&uid&"' and jid='"&jid&"'",conn,3,3
if rs.recordcount>=1 then
response.Write"<script language=javascript>alert('��ְλ�Ѿ��ղأ�');javascript:history.go(-1);</script>"
response.end()
end if
rs.addnew
rs("mytype")=2 '1����ҵ��Ա,2�Ǹ��˻�Ա
rs("jid")=jid
rs("uid")=uid
rs("cid")=cid
rs("favotime")=date()
rs.update
rs.close
set rs=nothing
conn.close
set conn=nothing
response.Write"<script language=javascript>alert('�����ɹ���');this.location.href='"&urlgo&"';</script>"
response.end()
%>