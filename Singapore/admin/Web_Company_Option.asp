<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Comid,UserName,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"11") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("comid")) '��ҵ��ԱID
PageNo   = Replace_Text(Request("pageno")) '��ҵ��ԱID

'//�жϲ����Ƿ���Ч
If Param = "" Then
 Response.write "<script language=JavaScript>alert('��������');history.back(-1);</script>"
 Response.End()
End if

If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('��û��ѡ���¼��');history.back(-1);</script>"
 Response.End()
End if
Ncid  = Split(Ncid,",")
'//�жϲ�����֧
Select Case Param
 Case "delcompany":Call DelCompany_Submit()             'ɾ����ҵ����
 Case "shenhe":Call Shenhe_Submit()                     'ͨ����� 
 Case "noshenhe":Call NoShenhe_Submit()                 'ȡ����� 
 Case "novip":Call NoVip_Submit()                       'ȡ�����
 Case "novideo":Call NoVideo_Submit()                   'ȡ����Ƶ
 Case "delvideo":Call DelVideo_Submit()                 'ɾ����Ƶ
 Case "bestvideo":Call BestVideo_Submit()               '�Ƽ���Ƶ
 Case "nobestvideo":Call NoBestVideo_Submit()           'ȡ���Ƽ�
End Select


'//���ܺ���
'--------------------------------------ɾ����ҵ����----------------------------------------------
Sub DelCompany_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ����ҵ������ͼƬ����Ƶ�ļ�
   SQL = "Select LogoUrl,Video_File From [pH_Company_Base] Where Comid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
    LogoUrl    = Rs(0)
	Video_File = Rs(1)
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'ͼƬ�ļ�
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/CompanyFile/"&LogoUrl)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/CompanyFile/"&LogoUrl))
	End if
	'��Ƶ�ļ�
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/CompanyVideo/"&Video_File)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/CompanyVideo/"&Video_File))
	End if
	Set Fso = Nothing
   End if
   Rs.Close
   'ɾ����ҵ������Ϣ
   SQL = "Delete From [pH_Company_Base] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ������
   SQL = "Delete From [pH_Company_Dept] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ���ռ���
   SQL = "Delete From [pH_Company_InBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ�����Թ���
   SQL = "Delete From [pH_Company_OutBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ���˲ſ�
   SQL = "Delete From [pH_Company_PersonDB] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ������վ
   SQL = "Delete From [pH_Company_RecycleBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ��������
   SQL = "Delete From [pH_Company_Searcher] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ��������ְλ
   SQL = "Delete From [pH_Job_Base] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ�������ղؼ��漰�ļ�¼
   SQL = "Delete From [pH_Person_Favouriate] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ�������ռ����漰�ļ�¼
   SQL = "Delete From [pH_Person_InBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ�����˷������漰�ļ�¼
   SQL = "Delete From [pH_Person_OutBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ�����˻���վ�漰�ļ�¼
   SQL = "Delete From [pH_Person_RecycleBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ͨ�����----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_Base] Set Flag=1,Nc_Vip_Jobs=10 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ�����----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_Base] Set Flag=0 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ��VIP�ʸ�----------------------------------------------
Sub NoVip_Submit()

 For i = 0 To Ubound(Ncid)
 
   SQL = "Update [pH_Company_Base] Set Nc_Vip_Flag=0,Nc_Vip_Date=Null,Nc_Vip_EndDate=Null,Nc_Vip_Level=Null Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ����ҵ����Ƶ----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   'ȡ����Ƶ
   SQL = "Update [pH_Company_Base] Set Nc_Video=0 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ɾ����ҵ����Ƶ----------------------------------------------
Sub DelVideo_Submit()
 For i = 0 To Ubound(Ncid)
 
  Set Rs = Conn.Execute("Select Video_File From [pH_Company_Base] Where Comid='"&Trim(Ncid(i))&"'")
  If Rs(0) = Null or Rs(0) = "" Then
    CloseRs
    CloseDB
    Response.redirect PageNo
	Response.End()
  Else
     '//ɾ���ļ�
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/Com_VideoFile/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/Com_VideoFile/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Company_Base] Set Nc_Video=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Comid='"&Trim(Ncid(i))&"'"
    Conn.Execute(SQL)
  End if
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------�Ƽ���ҵ����Ƶ----------------------------------------------
Sub BestVideo_Submit()

 For i = 0 To Ubound(Ncid)
   'ȡ����Ƶ
   SQL = "Update [pH_Company_Base] Set Video_BestFlag=1 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ����ҵ��Ƶ���Ƽ�----------------------------------------------
Sub NoBestVideo_Submit()

 For i = 0 To Ubound(Ncid)
   'ȡ����Ƶ
   SQL = "Update [pH_Company_Base] Set Video_BestFlag=0 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'//�ر����ݿ�����
CloseDB
 %>

