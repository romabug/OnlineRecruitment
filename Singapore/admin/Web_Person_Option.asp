<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Server.ScriptTimeout = 90000000
Dim Param,Ncid,Rs,SQL,Re
Dim Perid,UserName,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"120") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Perid")) '��ҵ��ԱID
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
 Case "delperson":Call DelPerson_Submit()             'ɾ����ҵ����
 Case "flag":Call Shenhe_Submit()                     'ͨ����� 
 Case "noflag":Call NoShenhe_Submit()                 'ȡ�����
 Case "nobest":Call NoBest_Submit()                   'ȡ�����
 Case "notop":Call NoTop_Submit()                   'ȡ�����
 Case "novideo":Call NoVideo_Submit()                 'ȡ����Ƶ����
 Case "delvideo":Call DelVideo_Submit()               'ɾ����Ƶ���� 
 Case "bestvideo":Call BestVideo_Submit()             '�Ƽ���Ƶ���� 
 Case "nobestvideo":Call NoBestVideo_Submit()         'ȡ����Ƶ�����Ƽ� 
 Case "video":Call Video_Submit()                     '��ѹ��������Ƶ����
End Select


'//���ܺ���
'--------------------------------------ɾ����������----------------------------------------------
Sub DelPerson_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ��������Ƭ�ļ�
   SQL = "Select PhotoUrl From [pH_Person_Info] Where Perid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
    PhotoUrl    = Rs(0)
	
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'ͼƬ�ļ�
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/PersonFile/"&PhotoUrl)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/PersonFile/"&PhotoUrl))
	End if
	Set Fso = Nothing
   End if
   Rs.Close
   'ɾ�������ʺ���Ϣ
   SQL = "Delete From [pH_Person_Base] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ�����˻�����Ϣ
   SQL = "Delete From [pH_Person_Info] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ����������
   SQL = "Delete From [pH_Person_Education] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ���ղؼ�
   SQL = "Delete From [pH_Person_Favouriate] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL) 
   'ɾ���ռ���
   SQL = "Delete From [pH_Person_InBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ��������
   SQL = "Delete From [pH_Person_OutBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ������վ
   SQL = "Delete From [pH_Person_RecycleBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ��������
   SQL = "Delete From [pH_Person_Searcher] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ����������
   SQL = "Delete From [pH_Person_Work] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ����ҵ�ռ���
   SQL = "Delete From [pH_Company_InBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ����ҵ������
   SQL = "Delete From [pH_Company_OutBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ����ҵ�˲ſ�
   SQL = "Delete From [pH_Company_PersonDB] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   'ɾ����ҵ����վ
   SQL = "Delete From [pH_Company_RecycleBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ͨ�����----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Base] Set Flag=1 Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ�����----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Base] Set Flag=0 Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ���Լ�----------------------------------------------
Sub NoBest_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Base] Set Nc_Best_Flag=0,Nc_Best_Ads=null,Nc_Best_Level=0,Nc_Best_Date=null,Nc_Best_EndDate=null,Nc_Best_ApplyDate=null Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ���̶�----------------------------------------------
Sub NoTop_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Info] Set TopAll=0,TopDate=null,TopEndDate=null Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------��ѹ��������Ƶ����----------------------------------------------
Sub Video_Submit()

 For i = 0 To Ubound(Ncid)
  
   BeginDate   = Replace_text(request("BeginDate"))
   EndDate     = Replace_text(request("EndDate"))
   Url = Replace_Text(Request("Url"))
   If Url <> "" Then Url = Replace(Url,"../UpLoadFiles/VideoFile/","")
   Path        = Replace(Lcase(Url),".rar","")
   Photo       = Replace_text(request("Photo")) 
   If Photo <> "" Then Photo = Replace(Photo,"../UpLoadFiles/PersonVideoPhoto/","")
   Best        = Replace_text(request("best")) 
	
	
   If Url = "" Then
    Response.write "<script language=JavaScript>alert('�����ϴ���Ƶѹ���ļ���');location.href='"&PageNo&"';</script>"
    Response.End()
   End if
   
   '����Ƿ��ǵ�һ��ѹ��
  Set Rs = Conn.Execute("Select Video_File From [pH_Person_Info] Where Perid='"&Trim(Ncid(i))&"'")
  If Rs(0) = Url Then
    Response.write "<script language=JavaScript>alert('���������ϴ��ļ����н�ѹ��');location.href='"&PageNo&"';</script>"
   Response.End()
  End if
  Rs.Close
  
  '�½�Ŀ¼
  Foldername = Server.MapPath("../Video/Resume/"&Path)
  Set Fso1 = CreateObject("Scripting.FileSystemObject")
  Fso1.CreateFolder(Foldername)
  Set Fso1 = Nothing
  '������Ƶ����
  Sys_path = Server.mappath("Web_Shell")&"\"    'ϵͳ�ļ�Ŀ¼
  afterunzip = Server.mappath("../Video/Resume/"&Path)  'Ŀ��Ŀ¼
  PEDM = Server.mappath("../UpLoadFiles/VideoFile/"&Url) 'Դ�ļ�

  Set Shell = Server.CreateObject("WScript.Shell") 
  rarcomm= Sys_path&"cmd.exe /c "&Sys_path&"rar.exe x -t -o+ " 
  cmd = rarcomm&PEDM&" "&afterunzip
  RetCode = Shell.Run(cmd,1, True) 
  
  '������Ϣ
  SQL = "UPdate [pH_Person_Info] Set Nc_Video=1,Video_Date='"&BeginDate&"',Video_EndDate='"&EndDate&"',Video_File='"&Url&"',Video_FilePath='"&Path&"',Video_PhotoUrl='"&Photo&"',Video_BestFlag="&Best&" Where Perid='"&Trim(Ncid(i))&"'"
 Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
 
End Sub

'--------------------------------------ȡ����Ƶ----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Info] Set Nc_Video=0 Where Perid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------�Ƽ���Ƶ����----------------------------------------------
Sub BestVideo_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Info] Set Video_BestFlag=1 Where Perid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ���Ƽ�----------------------------------------------
Sub NoBestVideo_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Info] Set Video_BestFlag=0 Where Perid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ɾ����Ƶ----------------------------------------------
Sub DelVideo_Submit()

For i = 0 To Ubound(Ncid)
 Set Rs = Conn.Execute("Select Video_File From [pH_Person_Info] Where Perid='"&Trim(Ncid(i))&"'")
 If Rs(0) <> "" Then
     '//ɾ���ļ�
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/VideoFile/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/VideoFile/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Person_Info] Set Nc_Video=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Perid='"&Trim(Ncid(i))&"'"
    Conn.Execute(SQL)
 End if
  
Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'//�ر����ݿ�����
CloseDB
 %>

