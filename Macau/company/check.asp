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
rs.open "select username,password,cid,lastlogin,power,closed from [01387company] where username='"&username&"'",conn,1,1
if rs.eof and rs.bof then
	response.write"<SCRIPT language=JavaScript>alert('用户名不存在，请重新输入，谢谢！');"
	response.write"this.location.href='login.asp';</script>"
	response.End()    
else
	if password<>rs("password") then
	response.write"<SCRIPT language=JavaScript>alert('密码错误，请重新输入，谢谢！');"
	response.write"this.location.href='login.asp';</script>"
	response.End()
	else
    	if rs(5)=true then
	    	response.redirect("Closed.asp?cid="&rs(2)&"")
			response.end()
	   else
	   		if request.cookies("01387job")("cid")="" or request.cookies("01387job")("companyusername")<>username or session("lastlogin")="" then
				session("lastlogin")=""
				session("lastlogin")=datevalue(rs(3))
				conn.execute("update [01387company] set lastlogin='"&now()&"',logintime=logintime+1 where username='"&username&"'")
			end if
			response.cookies("01387job")("cid")=rs("cid")
			response.cookies("01387job")("companyusername")=username
			response.Cookies("01387job")("cidpower")=rs(4)
			session("01387jobcid")=rs("cid")
			session("typesgo")=1
			session.timeout=20
        	response.redirect "default.asp"
		end if
	end if
end if
call closeconn()
%>