<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Schid,UserName,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"200") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("ncid")) 
PageNo   = Replace_Text(Request("pageno")) 

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
 Case "delads":Call DelAds_Submit()               'ɾ������
 Case "shenhe":Call Shenhe_Submit()                     'ͨ����� 
 Case "noshenhe":Call NoShenhe_Submit()                 'ȡ����� 
 Case "novip":Call NoVip_Submit()                       'ȡ�����
 Case "novideo":Call NoVideo_Submit()                   'ȡ����ҵ����Ƶ
End Select


'//���ܺ���
'--------------------------------------ɾ������----------------------------------------------
Sub DelAds_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ������ͼƬ�ļ�
   SQL = "Select AdFile From [pH_Web_Ad] Where Ncid="&Trim(Ncid(i))
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
    AdFile    = Rs(0)
	
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'ͼƬ�ļ�
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/AdFile/"&AdFile)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/AdFile/"&AdFile))
	End if
	
	Set Fso = Nothing
   End if
   Rs.Close
   'ɾ����¼
   SQL = "Delete From [pH_Web_Ad] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)  
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub


'//�ر����ݿ�����
CloseDB
 %>

