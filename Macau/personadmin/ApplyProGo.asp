<%@ Language=VBScript %>
<%response.buffer=false%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select pic from [01387member] where uid='"&request.cookies("01387job")("uid")&"'",conn,1,1
if rs(0)="" then
response.Write("<script language=javascript>alert('δ�ϴ���Ƭ��');this.location.href='ApplyPro.asp';</script>")
response.end()
rs.close
set rs=nothing
end if
if session("591applyproidcard")="" then
response.Write("<script language=javascript>alert('δ�ϴ����֤��ӡ����');this.location.href='ApplyPro.asp';</script>")
response.end()
end if
if request.form("message")="" then
response.Write("<script language=javascript>alert('�������������ݣ�');javascript:history.go(-1);</script>")
response.end()
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387applypro] where uid='"&request.cookies("01387job")("uid")&"'",conn,1,1
if not (rs.eof and rs.bof) then
response.Write("<script language=javascript>alert('���Ѿ�������Ѿ�ͨ���˸߼��˲ŵ���ˣ�');javascript:history.go(-1);</script>")
response.end()
end if
conn.execute("insert into [01387applypro] (uid,idcardpic,message,passok,applytime) values ('"&request.cookies("01387job")("uid")&"','"&session("591applyproidcard")&"','"&replace(replace(request.form("message"),chr(32),"&nbsp;"),chr(13),"<br>")&"',1,'"&date()&"')")
session("591applyproidcard")=""
call CloseConn()
response.Write("<script language=javascript>alert('����ɹ�����ȴ���ˣ�');this.location.href='ApplyPro.asp';</script>")
response.end()
%>