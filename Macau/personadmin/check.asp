<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/md5.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
if request.form("verifycode")="" then
Call ShowErrorTo("附加码不能为空！","login.asp")
end if		
if session("getcode")="9999" then
Call ShowErrorTo("附加码错误！","login.asp")
end if
if cstr(session("getcode"))<>cstr(trim(request.form("verifycode"))) then
Call ShowErrorTo("附加码错误！","login.asp")
end if
session("getcode")=""
dim username,password
username=trim(replace(request.form("username"),"'"," "))
password=md5(trim(replace(request.form("password"),"'"," ")))
set rs=server.CreateObject("ADODB.RecordSet")
rs.open "select username,password,uid,lastlogin  from [01387member] where username='"&username&"'",conn,1,1
if rs.eof and rs.bof then
  response.write"<SCRIPT language=JavaScript>alert('密码错误，请重新输入，谢谢！');"
  response.write"this.location.href='login.asp';</script>"
  response.End()
else
  if password<>rs("password") then
  response.write"<SCRIPT language=JavaScript>alert('密码错误，请重新输入，谢谢！');"
  response.write"this.location.href='login.asp';</script>"
  response.End()
  else
        if request.cookies("01387job")("uid")="" or request.cookies("01387job")("personusername")<>username  or session("lastloginperson")="" then
		session("lastloginperson")=""
		session("lastloginperson")=rs(3)
		conn.execute("update [01387member] set lastlogin='"&now()&"',logintime=logintime+1 where username='"&username&"'")
		end if
		response.cookies("01387job")("uid")=rs("uid")
		response.cookies("01387job")("personusername")=username
		session("01387jobuid")=rs("uid")
		session("typesgo")=2
		session.Timeout=20
		
	'判断是否是赞助会员,如果是就跳转到

	
		response.redirect "default.asp"
		
  end if
end if
rs.close
set rs=nothing
conn.close
%>