<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Schid,UserName,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"14") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Schid")) '��ҵ��ԱID
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
 Case "delschool":Call DelSchool_Submit()               'ɾ������
 Case "deldemand":Call DelDemand_Submit()               'ɾ����ѵ����
 Case "delbook":Call DelBook_Submit()             	    'ɾ���鼮
 Case "dellesson":Call DelLesson_Submit()          	    'ɾ���γ�
 Case "delteacher":Call DelTeacher_Submit()             'ɾ����ʦ
 
 Case "shenhe":Call Shenhe_Submit()                     'ͨ����� 
 Case "noshenhe":Call NoShenhe_Submit()                 'ȡ����� 
 
 Case "shenhedemand":Call ShenheDemand_Submit()                 'ͨ����ѵ������� 
 Case "noshenhedemand":Call NoShenheDemand_Submit()             'ȡ����ѵ������� 
 Case "shenhebook":Call ShenheBook_Submit()                     'ͨ���鼮��� 
 Case "noshenhebook":Call NoShenheBook_Submit()                 'ȡ���鼮��� 
 Case "shenhelesson":Call ShenheLesson_Submit()                 'ͨ���γ���� 
 Case "noshenhelesson":Call NoShenheLesson_Submit()             'ȡ���γ���� 
 Case "shenheteacher":Call ShenheTeacher_Submit()                 'ͨ����ʦ��� 
 Case "noshenheteacher":Call NoShenheTeacher_Submit()             'ȡ����ʦ���
 
 Case "bestbook":Call BestBook_Submit()                     '�Ƽ��鼮 
 Case "nobestbook":Call NoBestBook_Submit()                 'ȡ���鼮���Ƽ� 
 Case "bestteacher":Call BestTeacher_Submit()               '�Ƽ���ʦ 
 Case "nobestteacher":Call NoBestTeacher_Submit()           'ȡ����ʦ���Ƽ�
 
 Case "novip":Call NoVip_Submit()                       'ȡ��Vip

End Select


'//���ܺ���
'--------------------------------------ɾ������----------------------------------------------
Sub DelSchool_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ������ͼƬ�ļ�
   SQL = "Select BannerFile From [pH_Educate_Base] Where Schid='"&Trim(Ncid(i))&"'"
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
   SQL = "Delete From [pH_Educate_Base] Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ���γ�
   SQL = "Delete From [pH_Educate_Lesson] Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)   
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ɾ����ѵ����----------------------------------------------
Sub DelDemand_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Educate_Demand] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ɾ���鼮----------------------------------------------
Sub DelBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Educate_Book] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ɾ���γ�---------------------------------------------
Sub Dellesson_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Educate_Lesson] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ɾ����ʦ---------------------------------------------
Sub DelTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Educate_Teacher] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub


'--------------------------------------ͨ�����----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Base] Set Flag=1 Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ�����----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Base] Set Flag=0 Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ��VIP�ʸ�----------------------------------------------
Sub NoVip_Submit()
 For i = 0 To Ubound(Ncid)
 
   SQL = "Update [pH_Educate_Base] Set VipFlag=0,VipDate=Null,VipEndDate=Null,VipLevel=0,VipApplyDate=null Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ͨ����ѵ�������----------------------------------------------
Sub ShenheDemand_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Demand] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ����ѵ�������----------------------------------------------
Sub NoShenheDemand_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Demand] Set Flag=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ͨ���鼮���----------------------------------------------
Sub ShenheBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Book] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ���鼮���----------------------------------------------
Sub NoShenheBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Book] Set Flag=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ͨ���γ����----------------------------------------------
Sub ShenheLesson_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Lesson] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ���γ����----------------------------------------------
Sub NoShenheLesson_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Lesson] Set Flag=2 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ͨ����ʦ���----------------------------------------------
Sub ShenheTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Teacher] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ����ʦ���----------------------------------------------
Sub NoShenheTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Teacher] Set Flag=2 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------�Ƽ��鼮----------------------------------------------
Sub BestBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Book] Set Best=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ���鼮���Ƽ�----------------------------------------------
Sub NoBestBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Book] Set Best=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------�Ƽ���ʦ----------------------------------------------
Sub BestTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Teacher] Set Best=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ����ʦ���Ƽ�----------------------------------------------
Sub NoBestTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Teacher] Set Best=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ����ҵ����Ƶ----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ����ҵ����Ƶ�ļ�
   SQL = "Select Video_File From [pH_Educate_Base] Where Schid='"&Trim(Ncid(i))&"'"
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
   SQL = "Update [pH_Educate_Base] Set Nc_Video=0,Video_Flag=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'//�ر����ݿ�����
CloseDB
 %>

