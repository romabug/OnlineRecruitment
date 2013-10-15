<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="../Include/Class_Main.asp" -->

<%
Dim SQL,Rs
Dim Username,Password,Code,Re,LoginIp,Thesoft
Username=SafeRequestform("username")
Password=SafeRequestform("password")
Password=Enpas(md5(mistake(password)))
' Response.Write Password
 'Response.End()
Code=SafeRequestform("code")
'//检测是否是跨站登陆
'If Instr(Lcase(request.serverVariables("HTTP_REFERER")),Lcase(request.ServerVariables("Server_Name")))=0 Then
 'Response.Write Cls_WebName&"提示：非法操作！"
 'Response.End()
'End If 

If username="" or Password="" Then 
 Response.Write"<script>alert(""用户名和密码不能为空！ "");history.back(-1)"";</script>"
 Response.end
End If

If  Code <> CStr(Session("GetCode"))  Then 
 Response.Write"<script>alert(""验证码不正确，请刷新后重新登陆! "");location.href=""Web_Login.asp"";</script>"
 Response.end
End If

Thesoft=Request.ServerVariables("HTTP_USER_AGENT")
If instr(thesoft,"Windows NT 5.0") Then
	vOS="Win2000"
ElseIf instr(thesoft,"Windows NT 5.2") Then
	vOs="Win2003"
ElseIf instr(thesoft,"Windows NT 5.1") Then
	vOs="WinXP"
ElseIf instr(thesoft,"Windows NT") Then
	vOs="WinNT"
ElseIf instr(thesoft,"Windows 9") Then
	vOs="Win9x"
ElseIf instr(thesoft,"unix") or instr(thesoft,"linux") or instr(thesoft,"SunOS") or instr(thesoft,"BSD") Then
	vOs="类Unix"
ElseIf instr(thesoft,"Mac") Then
	vOs="Mac"
Else
	vOs="Other"
End If
Loginip=Request.serverVariables("REMOTE_ADDR")

Set Rs = Server.createobject("ADODB.recordset")
Set Re = Server.createobject("ADODB.recordset")

SQL = "Select su_SupperName From [pH_Web_Supper] Where su_SupperName='"&UserName&"'"
Rs.open SQL,Conn,1,1
If Rs.eof  Then
 '//管理员用户名不正确
 Rs.close
 Set Rs=Nothing
 Set Re=Nothing
 '//将失败的登陆记录插入到日志表
 Conn.Execute "Insert Into [pH_Web_Login] (sl_user,sl_loginip,sl_Ostype,sl_result,sl_logindate) Values ('"&Username&"','"&loginip&"','"&vos&"','Errorname',getdate())"
 CloseDB
 Response.Write "<script>alert('管理用户帐号或者密码不正确，请重新登陆...');location.href='Web_Login.asp';</script>"
 response.End()
Else
 Re.open "select su_SupperName,su_Password,su_Iflag from [pH_Web_Supper] where su_SupperName='"&UserName&"' And su_Password='"&Password&"'",conn,1,1
 If re.eof Then
  '//管理员密码不正确
  rs.close
  re.close
  set rs=nothing
  set re=nothing
  '//将失败的登陆记录插入到日志表
  conn.execute "insert into [pH_Web_Login] (sl_user,sl_loginip,sl_Ostype,sl_result,sl_logindate,sl_errorpas) values ('"&Username&"','"&loginip&"','"&vos&"','Errorpass',getdate(),'"&SafeRequestform("password")&"')"  
  CloseDB
  Response.Write "<script>alert('管理用户帐号或者密码不正确，请重新登陆...');location.href='Web_Login.asp';</script>"
  response.End()
 Else
   '//再次检测密码是否正确
   If Password=Trim(re("su_password")) Then
    '//检测管理员帐号是否有效
    If Re("su_Iflag") = True Then
	  '//生成登陆标记
	  Dim key
      Randomize
	  key=cstr(Int((999999-1+100000)*Rnd+1))
	  
	  Response.Cookies ("Web_cookies") = key
	  Session("Web_Suppername")        = Re("su_suppername")
	  Session("Web_PassWord")          = Re("su_PassWord")
	  '//更新管理员登陆信息
	  Conn.Execute "Update [pH_Web_Supper] Set su_Cookies='"&Key&"',su_Lastime=getdate(),su_LastIp='"&LoginIp&"' Where su_Suppername='"&Username&"'"
	  '//插入正确的登陆记录到日志表
      Conn.execute "insert into [pH_Web_Login] (sl_user,sl_loginip,sl_Ostype,sl_logindate) values ('"&Username&"','"&loginip&"','"&vos&"',getdate())"  
      '//登陆成功，跳转到管理中心
	  Response.Redirect "Web_Index.asp"
     Else
      Response.Write "<script>alert('该管理帐号被屏蔽！不能登陆...');location.href='Web_Login.asp';</script>"
      Response.End()
     End if 
    Else 
	  Response.Write "<script>alert('不能登陆...');location.href='Web_Login.asp';</script>"
      Response.End()
    End If

 End If
End If
'//关闭数据库连接
Rs.close
Re.close
Set rs=nothing
Set re=nothing
Call CloseDB()	

%>

