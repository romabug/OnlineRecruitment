<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Corid,UserName,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"22") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Corid")) '��ҵ��ԱID
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
 Case "delschool":Call DelSchool_Submit()                'ɾ������
 Case "deljob":Call Deljob_Submit()                      'ɾ��ְλ
 Case "delheadhunt":Call Delheadhunt_Submit()            'ɾ����ͷְλ
 
 Case "shenhe":Call Shenhe_Submit()                     'ͨ����� 
 Case "noshenhe":Call NoShenhe_Submit()                 'ȡ����� 
 Case "flagheadhunt":Call Flagheadhunt_Submit()         'ͨ����� 
 Case "noflagheadhunt":Call Noflagheadhunt_Submit()     'ȡ����� 
 
 Case "novip":Call NoVip_Submit()                       'ȡ�����
 Case "novideo":Call NoVideo_Submit()                   'ȡ����ҵ����Ƶ
End Select


'//���ܺ���
'--------------------------------------ɾ������----------------------------------------------
Sub DelSchool_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ��������Ϣ
   SQL = "Delete From [pH_Intro_Base] Where Corid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ��ְλ
   SQL = "Delete From [pH_Job_Base] Where UserType='Inr' And Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL) 
   'ɾ������
   SQL = "Select Perid From [pH_Person_Base] Where UserType='Inr' And Comid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
   While Not Rs.Eof
    SQL = "Delete From [pH_Person_Base] Where Perid='"&Rs(0)&"'"
	Conn.Execute(SQL)
    SQL = "Delete From [pH_Person_Info] Where Perid='"&Rs(0)&"'"
	Conn.Execute(SQL)
    Rs.Movenext
   Wend
   Rs.Close
      
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ɾ��ְλ----------------------------------------------
Sub Deljob_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Intro_Job] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ɾ����ͷְλ----------------------------------------------
Sub Delheadhunt_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Headhunt_Base] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub


'--------------------------------------ͨ�����----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Intro_Base] Set Flag=1 Where Corid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ�����----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Intro_Base] Set Flag=0 Where Corid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ͨ����ͷְλ���----------------------------------------------
Sub Flagheadhunt_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Headhunt_Base] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ����ͷְλ���----------------------------------------------
Sub NoFlagheadhunt_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Headhunt_Base] Set Flag=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub


'--------------------------------------ȡ��VIP�ʸ�----------------------------------------------
Sub NoVip_Submit()

 For i = 0 To Ubound(Ncid)
 
   SQL = "Update [pH_Intro_Base] Set Nc_Vip_Flag=0,Nc_Vip_Date=Null,Nc_Vip_EndDate=Null,Nc_Vip_Level=Null,Nc_Vip_ApplyDate=null Where Corid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ����ҵ����Ƶ----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ����ҵ����Ƶ�ļ�
   SQL = "Select Video_File From [pH_Intro_Base] Where Corid='"&Trim(Ncid(i))&"'"
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
   SQL = "Update [pH_Intro_Base] Set Nc_Video=0,Video_Flag=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Corid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'//�ر����ݿ�����
CloseDB
 %>

