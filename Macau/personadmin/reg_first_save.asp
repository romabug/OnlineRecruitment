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
response.write"<SCRIPT language=JavaScript>alert('�û��ʺ��Ѿ����ڣ�������ѡ��');"
response.write"javascript:history.go(-1)</SCRIPT>"
response.End()
rs.close
set rs=nothing
end if
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select email from [01387member] where email='"&request.form("email")&"'"
rs.open sql,conn,1,1
if rs.recordcount>=1 then
response.write"<SCRIPT language=JavaScript>alert('�������Ѿ����ڣ�������ѡ��');"
response.write"javascript:history.go(-1)</SCRIPT>"
response.End()
rs.close
set rs=nothing
end if
if session("reg")<>"" then
  if DateDiff("s",session("reg"),Now())<10 then
  response.write "<li>ϵͳ���������ظ��ύ����,ϵͳ��ֹ����.<br><li>��5���Ӻ���ע������.<br><li>����Եȴ�<font color=red><b><span id=yu></span><a href=javascript:countDown></a></b></font>��,ϵͳ�Զ�ע�������Ϣ<meta http-equiv=refresh content=300;url=javascript:location.reload()><script>function countDown(secs){yu.innerText=secs;if(--secs>0)setTimeout('countDown('+secs+')',1000);}countDown(300);</script>"
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