<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Schid,UserName,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"130") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Schid")) '��ҵ��ԱID
PageNo   = Replace_Text(Request("pageno")) '��ҵ��ԱID

'//�жϲ����Ƿ���Ч
If Param = "" Then
 Response.write "<script language=JavaScript>alert('��������');location.href='"&PageNo&"';</script>"
 Response.End()
End if

If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('��û��ѡ���¼��');location.href='"&PageNo&"';</script>"
 Response.End()
End if
Ncid  = Split(Ncid,",")
'//�жϲ�����֧
Select Case Param
 Case "delschool":Call DelSchool_Submit()               'ɾ������
 Case "shenhe":Call Shenhe_Submit()                     'ͨ����� 
 Case "noshenhe":Call NoShenhe_Submit()                 'ȡ����� 
 Case "novip":Call NoVip_Submit()                       'ȡ�����
 Case "novideo":Call NoVideo_Submit()                   'ȡ����ҵ����Ƶ
End Select


'//���ܺ���
'--------------------------------------ɾ������----------------------------------------------
Sub DelSchool_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ������ͼƬ�ļ�
   SQL = "Select BannerFile From [pH_School_Base] Where Schid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
    BannerFile    = Rs(0)
	
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'ͼƬ�ļ�
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/SchoolFile/"&BannerFile)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/SchoolFile/"&BannerFile))
	End if
	
	Set Fso = Nothing
   End if
   Rs.Close
   'ɾ��ԺУ������Ϣ
   SQL = "Delete From [pH_School_Base] Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ����ҵ��
   SQL = "Delete From [pH_School_Student] Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)   
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ͨ�����----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_School_Base] Set VipFlag=2 Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ�����----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_School_Base] Set VipFlag=0 Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ��VIP�ʸ�----------------------------------------------
Sub NoVip_Submit()

 For i = 0 To Ubound(Ncid)
 
   SQL = "Update [pH_School_Base] Set VipFlag=2,VipDate=Null,VipEndDate=Null,VipLevel=Null Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ����ҵ����Ƶ----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ����ҵ����Ƶ�ļ�
   SQL = "Select Video_File From [pH_School_Base] Where Schid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
	Video_File = Rs(0)
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'��Ƶ�ļ�
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/SchoolVideo/"&Video_File)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/SchoolVideo/"&Video_File))
	End if
	Set Fso = Nothing
   End if
   Rs.Close
   'ȡ����Ƶ
   SQL = "Update [pH_School_Base] Set Nc_Video=0,Video_Flag=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'//�ر����ݿ�����
CloseDB
 %>

