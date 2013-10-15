<!--#include file="../Include/Class_Conn.asp" -->

<% 
dim action,values,rs
action=replace_text(request.querystring("action"))
values=replace_text(request.querystring("value"))
set rs=server.createobject("ADODB.recordset")
select case action
 case "cusername"
  call cusername()  '//检测会员用户名
 case "cmailbox"
  call cmailbox()   '//检测邮箱地址
end select

sub cusername()
 rs.open "select username from [pH_Company_Base] where username='"&values&"'",conn,1,1
 if rs.eof then
  rs.close
  set rs=nothing
  closedb
  response.write "<b>恭喜！您可以使用这个用户名</b>"
  response.write "<script>alert('-恭喜！您可以使用这个用户名-');window.close();</script>"
  response.End()
 else
  rs.close
  set rs=nothing
  closedb
  response.write "<b>抱歉！您不能使用这个用户名</b>"
  response.write "<script>alert('-抱歉！您不能使用这个用户名-');window.close();</script>"
  response.End()

 end if
end sub

sub cmailbox()
 rs.open "select Email from [pH_Company_Base] where Email='"&values&"'",conn,1,1
 if rs.eof then
  rs.close
  set rs=nothing
  closedb
  response.write "<b>该邮箱没有被使用，可以注册！</b>"
  response.write "<script>alert('-该邮箱没有被使用，可以注册！-');window.close();</script>"
  response.End()
 else
  rs.close
  set rs=nothing
  closedb
  response.write "<b>该邮箱已经被使用，不能注册！</b>"
  response.write "<script>alert('-该邮箱已经被使用，不能注册！-');window.close();</script>"
  response.End()

 end if

end sub
 %>
