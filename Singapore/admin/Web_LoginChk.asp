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
'//����Ƿ��ǿ�վ��½
'If Instr(Lcase(request.serverVariables("HTTP_REFERER")),Lcase(request.ServerVariables("Server_Name")))=0 Then
 'Response.Write Cls_WebName&"��ʾ���Ƿ�������"
 'Response.End()
'End If 

If username="" or Password="" Then 
 Response.Write"<script>alert(""�û��������벻��Ϊ�գ� "");history.back(-1)"";</script>"
 Response.end
End If

If  Code <> CStr(Session("GetCode"))  Then 
 Response.Write"<script>alert(""��֤�벻��ȷ����ˢ�º����µ�½! "");location.href=""Web_Login.asp"";</script>"
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
	vOs="��Unix"
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
 '//����Ա�û�������ȷ
 Rs.close
 Set Rs=Nothing
 Set Re=Nothing
 '//��ʧ�ܵĵ�½��¼���뵽��־��
 Conn.Execute "Insert Into [pH_Web_Login] (sl_user,sl_loginip,sl_Ostype,sl_result,sl_logindate) Values ('"&Username&"','"&loginip&"','"&vos&"','Errorname',getdate())"
 CloseDB
 Response.Write "<script>alert('�����û��ʺŻ������벻��ȷ�������µ�½...');location.href='Web_Login.asp';</script>"
 response.End()
Else
 Re.open "select su_SupperName,su_Password,su_Iflag from [pH_Web_Supper] where su_SupperName='"&UserName&"' And su_Password='"&Password&"'",conn,1,1
 If re.eof Then
  '//����Ա���벻��ȷ
  rs.close
  re.close
  set rs=nothing
  set re=nothing
  '//��ʧ�ܵĵ�½��¼���뵽��־��
  conn.execute "insert into [pH_Web_Login] (sl_user,sl_loginip,sl_Ostype,sl_result,sl_logindate,sl_errorpas) values ('"&Username&"','"&loginip&"','"&vos&"','Errorpass',getdate(),'"&SafeRequestform("password")&"')"  
  CloseDB
  Response.Write "<script>alert('�����û��ʺŻ������벻��ȷ�������µ�½...');location.href='Web_Login.asp';</script>"
  response.End()
 Else
   '//�ٴμ�������Ƿ���ȷ
   If Password=Trim(re("su_password")) Then
    '//������Ա�ʺ��Ƿ���Ч
    If Re("su_Iflag") = True Then
	  '//���ɵ�½���
	  Dim key
      Randomize
	  key=cstr(Int((999999-1+100000)*Rnd+1))
	  
	  Response.Cookies ("Web_cookies") = key
	  Session("Web_Suppername")        = Re("su_suppername")
	  Session("Web_PassWord")          = Re("su_PassWord")
	  '//���¹���Ա��½��Ϣ
	  Conn.Execute "Update [pH_Web_Supper] Set su_Cookies='"&Key&"',su_Lastime=getdate(),su_LastIp='"&LoginIp&"' Where su_Suppername='"&Username&"'"
	  '//������ȷ�ĵ�½��¼����־��
      Conn.execute "insert into [pH_Web_Login] (sl_user,sl_loginip,sl_Ostype,sl_logindate) values ('"&Username&"','"&loginip&"','"&vos&"',getdate())"  
      '//��½�ɹ�����ת����������
	  Response.Redirect "Web_Index.asp"
     Else
      Response.Write "<script>alert('�ù����ʺű����Σ����ܵ�½...');location.href='Web_Login.asp';</script>"
      Response.End()
     End if 
    Else 
	  Response.Write "<script>alert('���ܵ�½...');location.href='Web_Login.asp';</script>"
      Response.End()
    End If

 End If
End If
'//�ر����ݿ�����
Rs.close
Re.close
Set rs=nothing
Set re=nothing
Call CloseDB()	

%>

