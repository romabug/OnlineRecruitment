<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
'//�������
Dim Rs,SQL,Tmp(3)
Dim UserName,UserType,Password,LastIp
Dim UserStr,UserUrl
VT_SysNum                    = 1
UserName                     = Replace_Text(Request.Form("username"))
Password                     = Replace_Text(Request.Form("password"))
UserType                     = Replace_Text(Request.Form("UserType"))
Prevurl						 = Replace_Text(Request.Form("Prevurl"))
Password                     = Md5(Password)
LastIp                       = Request.Servervariables("Remote_Addr")

Select Case UserType
 Case "person"
  Call PersonLogin()
 Case "company" 
  Call CompanyLogin()
 Case "school" 
  Call SchoolLogin()
 Case "educate"
  Call EducateLogin()
 Case "intro"
  Call IntroLogin()
End Select

'//���˻�Ա��½
Sub PersonLogin()
 UserStr = "����"
 UserUrl = "Person"
 SQL = "Select Username,Perid,Password From [pH_Person_Base] Where UserName='"&Username&"' And Password='"&Password&"'"
 Set Rs = Conn.Execute(SQL)
 If Not Rs.Eof Then
   If Rs("Password") = Password Then
    Conn.Execute("Update [pH_Person_Base] Set LastDate=getdate(),LastIp='"&LastIp&"',LoginCount=LoginCount+1 Where UserName='"&Username&"'")
	Tmp(0) = Rs("UserName")
	Tmp(1) = Rs("Password")
	Tmp(2) = Rs("Perid")
	'//���������Ա�ĵ�½���
	Session("Company") = ""
	Session("School") = ""
	'//�������

	Session("Person") = Tmp
	Session("Server") = Request.ServerVariables("Server_Name")
	
	'//��Ƶ����
    Session(VT_SysNum & "_" & "WebVT_MemberName") = Rs("Username")
	Session(VT_SysNum & "_" & "WebVT_IsNameOK") = 1
    '���˸�������
	Conn.Execute("Update [pH_Person_Base] Set LastUpdate_Time=Getdate() Where Perid='"&Rs("Perid")&"'")
	
	If Prevurl <> "" Then
	 Response.write "<meta http-equiv=refresh content=""3;URL="&Prevurl&""">"
	Else
	 Response.write "<meta http-equiv=refresh content=""3;URL=../Person/User_Center.asp"">"
	End if
    
    Call Login()
   Else
    Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
    Call LoginError()
   End if
 Else
  Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
  Call LoginError()
 End if
 
End Sub
'//��ҵ��Ա��½
Sub CompanyLogin()
 UserStr = "��ҵ"
 UserUrl = "Company"
 SQL = "Select Username,Comid,Password,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate From [pH_Company_Base] Where UserName='"&Username&"' And Password='"&Password&"'"
 Set Rs = Conn.Execute(SQL)
 If Not Rs.Eof Then
   If Rs("Password") = Password Then
    Conn.Execute("Update [pH_Company_Base] Set LastDate=getdate(),LastIp='"&LastIp&"',LoginCount=LoginCount+1 Where UserName='"&Username&"'")
	Tmp(0) = Rs("UserName")
	Tmp(1) = Rs("Password")
	Tmp(2) = Rs("Comid")
	'//���������Ա�ĵ�½���
	Session("Person") = ""
	Session("School") = ""
	'//�������

	Session("Company") = Tmp
	Session("Server") = Request.ServerVariables("Server_Name")
    '//��Ƶ����
    Session(VT_SysNum & "_" & "WebVT_MemberName") = Rs("Username")
	Session(VT_SysNum & "_" & "WebVT_IsNameOK") = 1
	'//�ж��Ƿ���VIP��Ա
	If Rs("Nc_Vip_Flag") = True Then
	 If DateDiff("d",Rs("Nc_Vip_Date"),Date()) >= 0 And DateDiff("d",Rs("Nc_Vip_EndDate"),Date()) <= 0 Then
	    Session("Nc_Vip") = 1       '//VIP��Ա
	 Else
	    Session("Nc_Vip") = 2       '//���ڵ�VIP��Ա
	 End if
	Else
	    Session("Nc_Vip") = 0       '//��ѻ�Ա
	End if
	
	'������ҵ������ְλ�ĸ�������
	Conn.Execute("Update [pH_Company_Base] Set LastUpdate_Time=Getdate() Where Comid='"&Rs("Comid")&"'")
	Conn.Execute("Update [pH_Job_Base] Set LastUpdate_Time=Getdate() Where Comid='"&Rs("Comid")&"'")
	
	If Prevurl <> "" Then
	 Response.write "<meta http-equiv=refresh content=""3;URL="&Prevurl&""">"
	Else
	 Response.write "<meta http-equiv=refresh content=""3;URL=../Company/User_Center.asp"">"
	End if	
   
    Call Login()
   Else
    Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
    Call LoginError()
   End if
 Else
  Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
  Call LoginError()
 End if
 
End Sub
'//ԺУ��Ա��½
Sub SchoolLogin()
 UserStr = "ԺУ"
 UserUrl = "School"
 SQL = "Select Username,Schid,Password From [pH_School_Base] Where UserName='"&Username&"' And Password='"&Password&"'"
 Set Rs = Conn.Execute(SQL)
 If Not Rs.Eof Then
   If Rs("Password") = Password Then
    Conn.Execute("Update [pH_School_Base] Set LastDate=getdate(),LastIp='"&LastIp&"',LoginCount=LoginCount+1 Where UserName='"&Username&"'")
	Tmp(0) = Rs("UserName")
	Tmp(1) = Rs("Password")
	Tmp(2) = Rs("Schid")
	'//���������Ա�ĵ�½���
	Session("Person") = ""
	Session("Company") = ""
	'//�������

	Session("School") = Tmp
	Session("Server") = Request.ServerVariables("Server_Name")
		
    Response.write "<meta http-equiv=refresh content=""3;URL=../School/User_Center.asp"">"
    Call Login()
   Else
    Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
    Call LoginError()
   End if
 Else
  Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
  Call LoginError()
 End if

End Sub

'//��ѵ������Ա��½
Sub EducateLogin()
 UserStr = "��ѵ����"
 UserUrl = "Educate"
 SQL = "Select Username,Schid,Password,VipFlag,VipDate,VipEndDate From [pH_Educate_Base] Where UserName='"&Username&"' And Password='"&Password&"'"
 Set Rs = Conn.Execute(SQL)
 If Not Rs.Eof Then
   If Rs("Password") = Password Then
    Conn.Execute("Update [pH_Educate_Base] Set LastDate=getdate(),LastIp='"&LastIp&"',LoginCount=LoginCount+1 Where UserName='"&Username&"'")
	Tmp(0) = Rs("UserName")
	Tmp(1) = Rs("Password")
	Tmp(2) = Rs("Schid")
	'//���������Ա�ĵ�½���
	Session("Person") = ""
	Session("Company") = ""
	Session("School") = ""
	Session("Educate") = ""
	'//�������

	Session("Educate") = Tmp
	Session("Server") = Request.ServerVariables("Server_Name")
	'//�ж��Ƿ���VIP��Ա
	If Rs("VipFlag") = True Then
	 If DateDiff("d",Rs("VipDate"),Date()) >= 0 And DateDiff("d",Rs("VipEndDate"),Date()) <= 0 Then
	    Session("Nc_Vip") = 1       '//VIP��Ա
	 Else
	    Session("Nc_Vip") = 2       '//���ڵ�VIP��Ա
	 End if
	Else
	    Session("Nc_Vip") = 0       '//��ѻ�Ա
	End if	
    Response.write "<meta http-equiv=refresh content=""3;URL=../Educate/User_Center.asp"">"
    Call Login()
   Else
    Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
    Call LoginError()
   End if
 Else
  Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
  Call LoginError()
 End if

End Sub

'-----------------------------------------------ְ���Ա��½----------------------------------------------------
Sub IntroLogin()
 UserStr = "�н�"
 UserUrl = "Intro"
 SQL = "Select Username,Corid,Password,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate,Flag From [pH_Intro_Base] Where UserName='"&Username&"' And Password='"&Password&"'"
 Set Rs = Conn.Execute(SQL)
 If Not Rs.Eof Then
   If Rs("Password") = Password Then
    Conn.Execute("Update [pH_Intro_Base] Set LastDate='"&Now()&"',LastIp='"&LastIp&"',LoginCount=LoginCount+1 Where UserName='"&Username&"'")
	Tmp(0) = Rs("UserName")
	Tmp(1) = Rs("Password")
	Tmp(2) = Rs("Corid")
	'//���������Ա�ĵ�½���
	Session("Person") = ""
	Session("Company") = ""
	Session("School") = ""
	'//�������

	Session("Intro") = Tmp
	Session("Server") = Request.ServerVariables("Server_Name")
	'//�ж��Ƿ���VIP��Ա
	If Rs("Nc_Vip_Flag") = True Then
	 If DateDiff("d",Rs("Nc_Vip_Date"),Date()) >= 0 And DateDiff("d",Rs("Nc_Vip_EndDate"),Date()) <= 0 Then
	    Session("Nc_Vip") = 1       '//VIP��Ա
	 Else
	    Session("Nc_Vip") = 2       '//���ڵ�VIP��Ա
	 End if
	Else
	  If Rs("Flag") = True Then
	   Session("Nc_Vip") = 0       '//��ѻ�Ա
	  Else
	   Session("Nc_Vip") = 3       '//δ��˻�Ա
	  End if 	
	End if
    Response.write "<meta http-equiv=refresh content=""3;URL=../Intro/User_Center.asp"">"
    Call Login()
   Else
    Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
    Call LoginError()
   End if
 Else
  Response.write "<meta http-equiv=refresh content=""3;URL=/Public/MemberLogin.asp"">"
  Call LoginError()
 End if
End Sub


CloseDB
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css_offices.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ա��¼</title>
</head>

<body>

<% Sub  Login() %>
<LINK href="../Css/Css_offices.css" type=text/css rel=stylesheet>
<p>&nbsp;</p>
<table width="80%" border="0" align="center" cellspacing="1" bgcolor="#eeeeee">
  <tr> 
    <td height="100" bgcolor="f5f5f5"><table width="90%" border="0" align="center" cellspacing="0" class="text01">
      <tr>
        <td height="30" align="center">��¼�ɹ� <%= Cls_WebName %>��ӭ���ĵ���</td>
      </tr>
      <tr>
        <td height="4" bgcolor="#040C66"></td>
      </tr>
      <tr>
        <td height="30" align="center"><font color=#999999>���������ת�������������<a href="../<%= UserUrl %>/User_Center.asp"><font color=#999999><%= UserStr %>����ƽ̨</font></a></font></td>
      </tr>
    </table></td>
  </tr>
</table>
<% 
End Sub

Sub LoginError()
 %>
 
 
<LINK href="../Css/Css_offices.css" type=text/css rel=stylesheet>
<p>&nbsp;</p>
<table width="80%" border="0" align="center" cellspacing="1" bgcolor="#eeeeee">
  <tr> 
    <td height="100" bgcolor="f5f5f5"><table width="90%" border="0" align="center" cellspacing="0" class="text01">
      <tr>
        <td height="30" align="center"> ��¼ʧ�� ���������û����������Ƿ���д��ȷ </td>
      </tr>
      <tr>
        <td height="4" bgcolor="040C66"></td>
      </tr>
      <tr>
        <td height="30" align="center"><font color=#999999>���������ת��<a href="/Public/MemberLogin.asp"><font color=#999999>��������</font></a></font></td>
      </tr>
    </table></td>
  </tr>
</table>
<% 
End Sub
 %>
</body>
</html>
