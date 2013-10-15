<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!--#include file="../personadmin/inc/random.asp"-->
<%
dim cid
cid=request.cookies("01387job")("cid")
if request.Form("maincatelog")="" or request.Form("jobname")="" or request.Form("demand")="" then
response.Redirect("login.asp")
end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387joblist]",conn,3,3
rs.addnew
rs("jid")=gen_key(7)
rs("cid")=cid
rs("jobtype")=request.Form("jobtype")
rs("maincatelog")=request.Form("maincatelog")
rs("subcatelog")=request.Form("subcatelog")
rs("jobname")=request.Form("jobname")
rs("neednum")=request.Form("neednum")

overtime=cdate(request.Form("zpyear")&"-"&request.Form("zpmonth")&"-"&request.Form("zpday"))
rs("overtime")=overtime

'response.Write overtime
'response.End()
rs("jobcity")=request.Form("jobcity")
rs("zhufang")=request.Form("zhufang")
rs("fangfa")=request.Form("fangfa")
rs("degree")=request.Form("degree")
rs("doneyear")=request.Form("doneyear")
rs("sex")=request.Form("sex")
rs("canshow")="ok"
rs("needage")=request.Form("needage")
rs("demand")=replace(replace(request.Form("demand"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("salary")=request.Form("salary")
rs("interview")=replace(replace(request.Form("interview"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("hurry")=0
if request.form("contact")="" or request.Form("tel")="" then
  set rs1=server.createobject("adodb.recordset")
  rs1.open "select * from [01387company] where cid='"&cid&"'",conn,1,1
  rs("contact")=rs1("contact")
  rs("tel")=rs1("tel")
  rs("fax")=rs1("fax")
  rs("email")=rs1("email")
  rs("address")=rs1("address")
  rs("zipcode")=rs1("zipcode")
else
  rs("contact")=request.Form("contact")
  rs("tel")=request.Form("tel")
  rs("fax")=request.Form("fax")
  rs("email")=request.form("email")
  rs("address")=request.Form("address")
  rs("zipcode")=request.Form("zipcode")
end if
rs("publishtime")=date()
rs("detailtime")=now()
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('²Ù×÷³É¹¦£¡');"
response.write"this.location.href='joblist.asp';</SCRIPT>"
response.end()
conn.close
%>