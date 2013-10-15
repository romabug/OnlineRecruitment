<%@ Language=VBScript %>
<%response.buffer=false%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select pic from [01387member] where uid='"&request.cookies("01387job")("uid")&"'",conn,1,1
if rs(0)="" then
response.Write("<script language=javascript>alert('未上传相片！');this.location.href='ApplyPro.asp';</script>")
response.end()
rs.close
set rs=nothing
end if
if session("591applyproidcard")="" then
response.Write("<script language=javascript>alert('未上传身份证复印件！');this.location.href='ApplyPro.asp';</script>")
response.end()
end if
if request.form("message")="" then
response.Write("<script language=javascript>alert('请输入留言内容！');javascript:history.go(-1);</script>")
response.end()
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387applypro] where uid='"&request.cookies("01387job")("uid")&"'",conn,1,1
if not (rs.eof and rs.bof) then
response.Write("<script language=javascript>alert('你已经申请或已经通过了高级人才的审核！');javascript:history.go(-1);</script>")
response.end()
end if
conn.execute("insert into [01387applypro] (uid,idcardpic,message,passok,applytime) values ('"&request.cookies("01387job")("uid")&"','"&session("591applyproidcard")&"','"&replace(replace(request.form("message"),chr(32),"&nbsp;"),chr(13),"<br>")&"',1,'"&date()&"')")
session("591applyproidcard")=""
call CloseConn()
response.Write("<script language=javascript>alert('申请成功，请等待审核！');this.location.href='ApplyPro.asp';</script>")
response.end()
%>