<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../personadmin/inc/random.asp"-->
<%
'if not (instr(1,Request.ServerVariables("http_Referer"),Request.ServerVariables ("SERVER_NAME"),1)=8) then
 ' response.Redirect("reg_one.asp")
 ' response.End()
'end if 

dim question_temp
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where companyname='"&request.Form("companyname")&"' ",conn,3,3
if not rs.eof then
response.write"<SCRIPT language=JavaScript>alert('该公司名称已存在，请输入其它名称！');"
response.write"javascript:history.go(-1)</SCRIPT>"
else
username=request.Form("username")
password="1a4e75352730cec9"
companyname=request.Form("companyname")
licence=request.Form("licence")
trade=request.Form("trade")
intro=request.Form("intro")
contact=request.Form("contact")
email=request.Form("email")
tel=request.Form("tel")
mobile=request.Form("mobile")
fax=request.Form("fax")
website=request.Form("website")
province=request.Form("province")
citys=request.Form("citys")
address=request.Form("address")
zipCode=request.Form("zipCode")
power=1
cid=gen_key(7)

conn.execute("insert into [01387company] (cid,power,username, password,companyname,licence,trade,intro,contact,email,tel,mobile,fax,website,province,citys,address,zipCode)  values ('"&cid&"','"&power&"','"&username&"','"&password&"','"&companyname&"','"&licence&"','"&trade&"' ,'"&intro&"', '"&contact&"','"&email&"','"&tel&"','"&mobile&"','"&fax&"','"&website&"','"&province&"','"&citys&"','"&address&"','"&zipCode&"')")
conn.close
set conn=nothing

response.cookies("01387job")("cid")=cid

response.write"<SCRIPT language=JavaScript>alert('快速登记成功');"
response.write"Javascript:location='quick_pub_job.asp'</SCRIPT>"'Call ShowErrorTo("快速登记成功，请发布职位！ ","default.asp")

end if
response.End()
conn.close

%>
