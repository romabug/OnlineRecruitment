<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../personadmin/inc/md5.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
if request.form("verifycode")="" then
Call ShowErrorTo("¸½¼ÓÂë²»ÄÜÎª¿Õ£¡","login.asp")
end if		
if session("getcode")="9999" then
Call ShowErrorTo("¸½¼ÓÂë´íÎó£¡","login.asp")
end if
if cstr(session("getcode"))<>cstr(trim(request.form("verifycode"))) then
Call ShowErrorTo("¸½¼ÓÂë´íÎó£¡","login.asp")
end if
session("getcode")=""
dim username,password
username=trim(replace(request.form("username"),"'"," "))
password=md5(trim(replace(request.form("password"),"'"," ")))
set rs=server.CreateObject("ADODB.RecordSet")
rs.open "select id,username,password,userpower from [01387lch_admin] where username='"&username&"'",conn,1,1
if rs.eof and rs.bof then
  response.write"<SCRIPT language=JavaScript>alert('ÃÜÂë´íÎó£¬ÇëÖØĞÂÊäÈë£¬Ğ»Ğ»£¡');"
  response.write"this.location.href='login.asp';</script>"
  response.End()
else
  if password<>rs("password") then
  response.write"<SCRIPT language=JavaScript>alert('ÃÜÂë´íÎó£¬ÇëÖØĞÂÊäÈë£¬Ğ»Ğ»£¡');"
  response.write"this.location.href='login.asp';</script>"
  response.End()
  else
		conn.execute("insert into [01387loginrecord] values ('"&rs(0)&"',"&rs(3)&",'"&now()&"','"&request.ServerVariables("REMOTE_ADDR")&"')")
		response.cookies("01387job")("superlogin")=username
		response.cookies("01387job")("userpower")=rs(3)
		session("logintime")=now()
		session("591adminlogin")=username
		session.timeout=100
        response.redirect "index.asp"
  end if
end if
call closers()
call closeconn()
%>