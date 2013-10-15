<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/random.asp"-->
<!--#include file="inc/md5.asp"-->
<%
if not (instr(1,Request.ServerVariables("http_Referer"),Request.ServerVariables ("SERVER_NAME"),1)=8) then
  response.Redirect("reg_first.asp")
  response.End()
end if 
if request.form("username")="" or request.Form("pwd1")="" or request.Form("question")="" or request.Form("answer")="" then
response.Redirect("reg_first.asp")
response.End()
end if
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select username from [01387member] where username='"&request.form("username")&"'"
rs.open sql,conn,1,1
if rs.recordcount>=1 then
response.write"<SCRIPT language=JavaScript>alert('用户帐号已经存在，请重新选择！');"
response.write"javascript:history.go(-1)</SCRIPT>"
response.End()
rs.close
set rs=nothing
end if
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select email from [01387member] where email='"&request.form("email")&"'"
rs.open sql,conn,1,1
if rs.recordcount>=1 then
response.write"<SCRIPT language=JavaScript>alert('邮箱名已经存在，请重新选择！');"
response.write"javascript:history.go(-1)</SCRIPT>"
response.End()
rs.close
set rs=nothing
end if
if session("reg")<>"" then
  if DateDiff("s",session("reg"),Now())<10 then
  response.write "<li>系统保护：你重复提交数据,系统中止运行.<br><li>请5分钟后再注册资料.<br><li>你可以等待<font color=red><b><span id=yu></span><a href=javascript:countDown></a></b></font>秒,系统自动注册你的信息<meta http-equiv=refresh content=300;url=javascript:location.reload()><script>function countDown(secs){yu.innerText=secs;if(--secs>0)setTimeout('countDown('+secs+')',1000);}countDown(300);</script>"
  response.end()
  end if
end if

dim uid,username,password,question,answer,email,HTML,question_temp
uid=gen_key(7)
session("uid")=uid
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from [01387member] where uid='"&session("uid")&"'"
rs.open sql,conn,1,1
if rs.recordcount>=1 then
session("uid")=gen_key(7)
rs.close
set rs=nothing
end if
session("username")=request.form("username")
session("pwd1")=request.form("pwd1")
Session.Timeout   =   20
password=md5(session("pwd1"))
question=request.form("question")
answer=request.form("answer")
email=request.form("email")
conn.execute("insert into [01387member] (uid,username,password,question,answer,email,pic,lookcount,logintime,promember,canshow,uname,job_career,edu_career,regtime,lastlogin) values ('"&session("uid")&"','"&session("username")&"','"&password&"','"&question&"','"&answer&"','"&email&"','',0,1,0,'no','','','','"&now()&"','"&now()&"')")
session("reg")=now()
response.Redirect("reg_second_go.asp")
response.End()
conn.close
set conn=nothing
%>