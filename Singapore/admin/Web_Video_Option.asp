<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Corid,UserName,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"160") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Ncid")) '��ҵ��ԱID
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
 Case "del":Call Del_Submit()               'ɾ������
 Case "shenhe":Call Shenhe_Submit()                     'ͨ����� 
 Case "noshenhe":Call NoShenhe_Submit()                 'ȡ����� 
 Case "novip":Call NoVip_Submit()                       'ȡ�����
 Case "novideo":Call NoVideo_Submit()                   'ȡ����ҵ����Ƶ
End Select


'//���ܺ���
'--------------------------------------ɾ������----------------------------------------------
Sub Del_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ��������Ϣ
   SQL = "Delete From [pH_Video_Type] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
   'ɾ������
   SQL = "Delete From [RoomTable] Where Type=1 And Typeid="&Trim(Ncid(i))
   Conn.Execute(SQL) 
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
 
End Sub

'--------------------------------------ͨ�����----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Corps_Base] Set Flag=1 Where Corid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ�����----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Corps_Base] Set Flag=0 Where Corid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ��VIP�ʸ�----------------------------------------------
Sub NoVip_Submit()

 For i = 0 To Ubound(Ncid)
 
   SQL = "Update [pH_Corps_Base] Set VipFlag=2,VipDate=Null,VipEndDate=Null,VipLevel=Null Where Corid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ����ҵ����Ƶ----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ����ҵ����Ƶ�ļ�
   SQL = "Select Video_File From [pH_Corps_Base] Where Corid='"&Trim(Ncid(i))&"'"
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
   SQL = "Update [pH_Corps_Base] Set Nc_Video=0,Video_Flag=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Corid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'//�ر����ݿ�����
CloseDB
 %>

