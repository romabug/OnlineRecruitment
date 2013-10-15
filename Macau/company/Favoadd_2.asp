<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%

<!-- 只有权利1以上的才能收藏人才简历-->
Call PowerCheck(0)   
dim cid,chkNO
cid=request.cookies("01387job")("cid")
uid=request.QueryString("uid")

set rs=server.createobject("adodb.recordset")
  rs.open"select * from [01387favorite] where mytype=1 and uid='"&uid&"' and cid='"&cid&"'",conn,3,3
  if rs.eof and rs.bof then
  
  conn.execute("insert into [01387favorite] (mytype,uid,cid,favotime) values (1,'"&uid&"','"&cid&"','"&date()&"')")
  rs.close
response.Write("<script language=javascript>alert('已成功放入收藏夹！');history.back(-1);</script>")
  else
response.Write("<script language=javascript>alert('该人才已收藏过！');history.back(-1);</script>")
  end if
%>
<%
conn.close
set conn=nothing
%>