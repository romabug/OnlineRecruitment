<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../personadmin/inc/md5.asp"-->
<%
'if not (instr(1,Request.ServerVariables("http_Referer"),Request.ServerVariables ("SERVER_NAME"),1)=8) then
 ' response.Redirect("reg_one.asp")
 ' response.End()
'end if 

dim question_temp
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where companyname='"&request.Form("companyname")&"' ",conn,3,3
if not rs.eof then
response.write"<SCRIPT language=JavaScript>alert('�ù�˾�����Ѵ��ڣ��������������ƣ�');"
response.write"javascript:history.go(-1)</SCRIPT>"
else

rs.addnew

rs("cid")=gen_key(7)
rs("username")=request.Form("username") 
rs("password")="iamadm"
rs("question")="question_question_question"
rs("answer")="answer"
rs("email")=request.Form("email")
rs("companyname")=request.Form("companyname")
rs("licence")=request.Form("licence")
rs("trade")=request.Form("trade")
'rs("properity")=request.Form("properity")
'rs("u_year")=request.Form("u_year")
'rs("u_month")=request.Form("u_month")
'rs("u_day")=request.Form("u_day")
'rs("fund")=request.Form("fund")
'rs("employee")=request.Form("employee")
'rs("legal")=request.Form("legal")
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
rs("hurry")=0

<!--   ע��ʱ�Զ�����Ϊ��ͨ��Ա   -->
rs("power")=1

rs("powertime")=1
rs("lookcount")=0
rs("logintime")=1
rs.update
rs.close
set rs=nothing
end if

'response.cookies("01387job")("cid")=session("cid")
'response.cookies("01387job")("companyusername")=session("username")
'response.Cookies("01387job")("cidpower")=0
'session("01387jobcid")=session("cid")
'session.timeout=20
session("username")=""
'session("password")=""
'session("question")=""
'session("answer")=""
session("email")=""
session("cid")=""
'session("pwd1")=""
response.write"<SCRIPT language=JavaScript>alert('���ٵǼǳɹ�');"
response.write"Javascript:location='login_just_reg.asp'</SCRIPT>"'Call ShowErrorTo("ע��ɹ���\n�뼰ʱ���������Ӫҵִ�ո�����ӡ������ͨ��Ա����\n��ϵ�绰��0086-0591-88831918   ���棺0086-0591-83078766��5782","default.asp")

response.End()
conn.close

'���¶���ע��ɹ�ҳ��

%>