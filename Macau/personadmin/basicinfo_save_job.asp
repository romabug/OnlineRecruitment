<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
if request.Form("maincatelog")=""   or   request.Form("jobname")=""    then
response.Write"<script language=javascript>alert('填写未完整，不能提交！'); "
response.write"this.location.href='basicinfo_job.asp';</SCRIPT>"
response.end()


'response.Redirect("login.asp")
end if
set rs=server.createobject("adodb.recordset")
rs.open"select  maincatelog, subcatelog,maincatelog2, subcatelog2, jobname, jobtype, salary, workhouse, checkindate,updatetime    from [01387member] where uid='"&request.cookies("01387job")("uid")&"' and username='"&request.cookies("01387job")("personusername")&"'",conn,3,3

rs("maincatelog")=request.Form("maincatelog")
rs("subcatelog")=request.Form("subcatelog")
rs("maincatelog2")=request.Form("maincatelog2")
rs("subcatelog2")=request.Form("subcatelog2")
rs("jobname")=request.Form("jobname")

rs("jobtype")=request.Form("jobtype")

rs("salary")=request.Form("salary")
rs("workhouse")=request.Form("workhouse")
rs("checkindate")=request.Form("checkindate")

rs("updatetime")=now()
rs.update
rs.close
set rs=nothing
response.Write"<script language=javascript>alert('操作成功！');"
response.write"this.location.href='basicinfo_job.asp';</SCRIPT>"
response.end()
conn.close
%>