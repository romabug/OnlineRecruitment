<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../personadmin/inc/md5.asp"-->
<%
if not (instr(1,Request.ServerVariables("http_Referer"),Request.ServerVariables ("SERVER_NAME"),1)=8) then
  response.Redirect("reg_one.asp")
  response.End()
end if 
if request.form("contact")="" or session("username")="" or session("password")=""   then
response.Redirect("reg_one.asp")
response.End()
end if
dim question_temp
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where companyname='"&request.Form("companyname")&"' ",conn,3,3

if not rs.eof then
response.write"<SCRIPT language=JavaScript>alert('该公司名称已存在，请输入其它名称！');"
response.write"javascript:history.go(-1)</SCRIPT>"
else
rs.addnew
rs("cid")=session("cid")
rs("username")=session("username")
rs("password")=session("password")
rs("question")=session("question")
rs("answer")=session("answer")
rs("email")=session("email")
rs("companyname")=request.Form("companyname")
rs("licence")=request.Form("licence")
rs("trade")=request.Form("trade")
rs("properity")=request.Form("properity")
rs("u_year")=request.Form("u_year")
rs("u_month")=request.Form("u_month")
rs("u_day")=request.Form("u_day")
rs("fund")=request.Form("fund")
rs("employee")=request.Form("employee")
rs("legal")=request.Form("legal")
rs("intro")=replace(replace(request.Form("intro"),chr(32),"&nbsp;"),chr(13),"<br>")
rs("contact")=request.Form("contact")
rs("tel")=request.Form("tel")
rs("fax")=request.Form("fax")
rs("mobile")=request.Form("mobile")
rs("website")=request.Form("website")
rs("province")=request.Form("province")
rs("citys")=request.Form("citys")
rs("address")=request.Form("address")
rs("zipcode")=request.Form("zipcode")
rs("knowfrom")=request.Form("knowfrom")
rs("hurry")=0

<!--   注册时自动设置为普通会员   -->
rs("power")=1


rs("powertime")=1
rs("lookcount")=0
rs("logintime")=1
rs.update
rs.close
set rs=nothing
end if

response.cookies("01387job")("cid")=session("cid")
response.cookies("01387job")("companyusername")=session("username")
response.Cookies("01387job")("cidpower")=0
session("01387jobcid")=session("cid")
session.timeout=20
session("username")=""
session("password")=""
session("question")=""
session("answer")=""
session("email")=""
session("cid")=""
session("pwd1")=""
Call ShowErrorTo("注册成功！\n享受更多高价值服务，请联系本站客服！\n联系电话：400-6756-269 ","login_just_reg.asp")
'Call ShowErrorTo("注册成功！\n请及时传真给我们营业执照复本复印件，开通会员服务！\n联系电话：0086-0591-88831918   传真：0086-0591-83078766－5782","default.asp")

response.End()
conn.close

'重新定向到注册成功页面

%>