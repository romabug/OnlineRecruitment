<!--#include file="../conn.asp"-->
<!--#include file="inc/md5.asp"-->
<%
'response.Write session("username")
'response.End()
'if session("username")="" or session("uid")="" or session("pwd1")="" then
'response.Redirect("reg_first.asp")
'response.End()
'end if
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where username='"&session("username")&"'",conn,3,3
rs("uname")=trim(request.Form("uname"))
rs("sex")=request.Form("sex")
rs("nation")=request.Form("nation")
rs("u_year")=request.Form("u_year")
rs("u_month")=request.Form("u_month")
rs("u_day")=request.Form("u_day")
rs("birthday")=request.Form("u_year")&"-"&request.Form("u_month")&"-"&request.Form("u_day")
rs("height")=request.Form("height")
rs("cardtype")=request.Form("cardtype")
rs("cardno")=request.Form("cardno")
rs("marry")=request.Form("marry")
rs("province")=request.Form("province")
rs("citys")=request.Form("citys")
rs("degree")=request.Form("degree")
rs("college")=request.Form("college")
rs("spec1")=request.Form("spec1")
rs("spec2")=request.Form("spec2")
rs("com_level")=request.Form("com_level")
rs("zzmm")=request.Form("zzmm")
rs("l_type1")=request.Form("l_type1")
rs("l_type2")=request.Form("l_type2")
rs("l_level1")=request.Form("l_level1")
rs("l_level2")=request.Form("l_level2")
rs("certificate")=request.Form("certificate")
rs("edu_career")=replace(replace(request.Form("edu_career"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("maincatelog")=request.Form("maincatelog")
rs("subcatelog")=request.Form("subcatelog")
rs("maincatelog2")=request.Form("maincatelog2")
rs("subcatelog2")=request.Form("subcatelog2")
rs("jobname")=request.Form("jobname")
rs("jobtype")=request.Form("jobtype")
rs("salary")=request.Form("salary")
rs("workhouse")=request.Form("workhouse")
rs("jobplace")="澳门"
rs("checkindate")=request.Form("checkindate")
rs("selfintro")=replace(replace(request.Form("selfintro"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("doneyear")=request.Form("doneyear")
rs("job_career")=replace(replace(request.Form("job_career"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("tel")=request.Form("tel")
rs("mobile")=request.Form("mobile")
rs("chatno")=request.Form("chatno")
rs("selfweb")=request.Form("selfweb")
rs("address")=request.Form("address")
rs("zipcode")=request.Form("zipcode")
rs("resumestatus")=request.Form("resumestatus")
rs("canshow")="ok"
rs("regtime")=now()
rs("updatetime")=now()
rs.update
rs.close
set rs=nothing
session("lastlogin")=""
response.cookies("01387job")("uid")=session("uid")
response.cookies("01387job")("personusername")=session("username")
session("01387jobuid")=session("uid")
session.timeout=20
session("username")=""
session("reg")=""
session("uid")=""
session("pwd1")=""

response.write"<SCRIPT language=JavaScript>alert('恭喜！您已成功注册为免费劳工会员。');"
response.write"Javascript:location='login_just_reg.asp'</SCRIPT>"
response.End()
conn.close
set conn=nothing
%>