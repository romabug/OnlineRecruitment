<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Jobid,UserName,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"150") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Jobid")) '��ҵ��ԱID
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
 Case "deljob":Call DelJob_Submit()                     'ɾ��ְλ
 Case "shenhe":Call Shenhe_Submit()                     'ͨ����� 
 Case "noshenhe":Call NoShenhe_Submit()                 'ȡ����� 
 Case "best":Call Best_Submit()                         '����Ϊ��Ƹ
 Case "nobest":Call NoBest_Submit()                     'ȡ����Ƹ 
 Case "hot":Call Hot_Submit()                           '��Ϊ����
 Case "nohot":Call NoHot_Submit()                       'ȡ������
 Case "notop":Call NoTop_Submit()                       'ȡ���̶�
End Select


'//���ܺ���
'--------------------------------------ɾ��ְλ----------------------------------------------
Sub DelJob_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   'ɾ��ְλ��Ϣ
   SQL = "Delete From [pH_Job_Base] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   'ɾ����ҵ�ռ���
   SQL = "Delete From [pH_Company_InBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   'ɾ����ҵ���Թ���
   SQL = "Delete From [pH_Company_OutBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   'ɾ����ҵ����վ
   SQL = "Delete From [pH_Company_RecycleBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   'ɾ�������ռ���
   SQL = "Delete From [pH_Person_InBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   'ɾ�����˷�����
   SQL = "Delete From [pH_Person_OutBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   'ɾ�������ղؼ�
   SQL = "Delete From [pH_Person_Favouriate] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   'ɾ�����˻���վ
   SQL = "Delete From [pH_Person_RecycleBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ͨ�����----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set JobFlag=1 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ�����----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set JobFlag=0 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------��Ϊ��Ƹ----------------------------------------------
Sub Best_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set BestFlag=1 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ����Ƹ----------------------------------------------
Sub NoBest_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set BestFlag=0 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------��Ϊ����----------------------------------------------
Sub Hot_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set HotFlag=1 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------ȡ������----------------------------------------------
Sub NoHot_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set HotFlag=0 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------ȡ���̶�----------------------------------------------
Sub NoTop_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set TopAll=0,TopDate=Null,TopEndDate=Null Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

'//�ر����ݿ�����
CloseDB
 %>

