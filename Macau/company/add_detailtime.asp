<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../inc/function.asp"-->
<%
Call RsName(rs,"select publishtime,detailtime,id from [01387joblist] order by id desc",3,3)
do while not rs.eof
conn.execute("update [01387joblist] set detailtime='"&Cdate(rs(0)&" 00:00:01")&"' where id="&rs(2))
rs.movenext
loop
%>