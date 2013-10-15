<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
Call PowerCheck(0)
dim cid,chkNO
cid=request.cookies("01387job")("cid")
chkNO=request.form("chkNO")
chkNO=split(chkNO,", ")
set rs=server.createobject("adodb.recordset")
for i=0 to ubound(chkNO) 
  rs.open"select * from [01387favorite] where mytype=1 and uid='"&chkNO(i)&"' and cid='"&cid&"'",conn,3,3
  if rs.eof and rs.bof then
  conn.execute("insert into [01387favorite] (mytype,uid,cid,favotime) values (1,'"&chkNO(i)&"','"&cid&"','"&date()&"')")
  end if
  rs.close
next
response.Write("<script language=javascript>alert('²Ù×÷³É¹¦£¡');this.location.href='MemberList.asp';</script>")
%>
<%
conn.close
set conn=nothing
%>