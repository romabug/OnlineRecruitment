<%
if request.cookies("01387job")("superlogin")="" or request.cookies("01387job")("userpower")="" then 
response.redirect("login.asp")
end if
set rs=server.createobject("adodb.recordset")
rs.open "select username from [01387lch_admin] where username='"&request.cookies("01387job")("superlogin")&"' and userpower="&request.cookies("01387job")("userpower"),conn,1,1
if rs(0)<>session("591adminlogin") then
response.redirect("login.asp")
response.End()
end if
if rs.eof and rs.bof then
response.redirect("login.asp")
response.End()
end if
rs.close
set rs=nothing
%>