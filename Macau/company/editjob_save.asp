<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
canshow=request.Form("canshow")
'response.Write canshow
'response.End()
dim cid,jid
cid=request.Cookies("01387job")("cid")
jid=request.Form("jid")
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387joblist] where jid='"&jid&"'",conn,3,3

rs("maincatelog")=request.Form("maincatelog")
rs("subcatelog")=request.Form("subcatelog")
rs("jobname")=request.Form("jobname")
rs("neednum")=request.Form("neednum")

overtime=cdate(request.Form("zpyear")&"-"&request.Form("zpmonth")&"-"&request.Form("zpday"))
if datevalue(overtime)>=date() then
rs("overtime")=overtime
else
	response.write"<SCRIPT language=JavaScript>alert('有效期必须大于现在日期！');"
	response.write"history.go(-1);</script>"
end if
rs("canshow")=canshow
rs("degree")=request.Form("degree")
rs("doneyear")=request.Form("doneyear")
rs("sex")=request.Form("sex")
rs("needage")=request.Form("needage")
rs("demand")=replace(replace(request.Form("demand"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("salary")=request.Form("salary")
rs("interview")=replace(replace(request.Form("interview"),chr(32),"&nbsp;"),chr(13),"<br>")
if request.form("contact")<>"" and request.Form("tel")<>"" then
rs("contact")=request.Form("contact")
rs("tel")=request.Form("tel")
rs("fax")=request.Form("fax")
rs("email")=request.form("email")
rs("address")=request.Form("address")
rs("zipcode")=request.Form("zipcode")

rs("publishtime")=date()
rs("detailtime")=now()
end if
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('操作成功！');"
response.write"this.location.href='joblist.asp';</SCRIPT>"
response.end()
conn.close
%>