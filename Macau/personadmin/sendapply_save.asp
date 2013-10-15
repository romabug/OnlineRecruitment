<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!--#include file="inc/random.asp"-->
<%
jid=request.QueryString("jid")
cid=request.QueryString("cid")
uid=request.cookies("01387job")("uid")
applyid=gen_key(7)

if request.form("member_message")="" then
response.Write"<script language=javascript>alert('请输入留言内容！');</SCRIPT>"
response.end()
else
conn.execute("insert into [01387applylist] (applyid,jid,cid,uid,member_message,status,applytime) values ('"&applyid&"','"&jid&"','"&cid&"','"&uid&"','"&replace(replace(request.form("member_message"),chr(32),"&nbsp;"),chr(13),"<br>")&"',1,'"&date()&"')")
conn.close
set conn=nothing
end if
%>
<script language="javascript">
alert("发送成功！");
window.close();
</script>
