<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Comid,UserName,PageNo

'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"170") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("ncid")) '��ҵ��ԱID
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
 Case "dellocale":Call Delete_Submit()                     'ɾ��
 Case "delbestcompany":Call Delbestcompany_Submit()        
 Case "dellocalejob":Call Dellocalejob_Submit()
 Case "delapply":Call Delapply_Submit()    
 Case "delbestcompanyjob":Call Delbestcompanyjob_Submit()  
 Case "dellocale_1":Call Dellocale_1_Submit()   
 Case "dellocale_2":Call Dellocale_2_Submit() 
 Case "dellocale_3":Call Dellocale_3_Submit()
End Select


'//���ܺ���
'--------------------------------------ɾ����ҵ����----------------------------------------------
Sub Delete_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ����ҵ������Ϣ
   SQL = "Delete From [pH_Locale_Base] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
   'ɾ��ְλ
   SQL = "Delete From [pH_Locale_Jobs] Where Locid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub


Sub Delbestcompany_Submit()

 For i = 0 To Ubound(Ncid)
   'ɾ����ҵ������Ϣ
   SQL = "Delete From [pH_BestCompany_Base] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
   'ɾ��ְλ
   SQL = "Delete From [pH_BestCompany_Jobs] Where Bestid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub

Sub Dellocalejob_Submit()
 For i = 0 To Ubound(Ncid)
   'ɾ��ְλ
   SQL = "Delete From [pH_Locale_Jobs] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub

Sub Delbestcompanyjob_Submit()
 For i = 0 To Ubound(Ncid)
   'ɾ��ְλ
   SQL = "Delete From [pH_BestCompany_Jobs] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub


Sub Dellocale_1_Submit()
 For i = 0 To Ubound(Ncid)
   'ɾ����ҵ������Ϣ
   SQL = "Delete From [pH_Locale_Order] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub

Sub Dellocale_2_Submit()
 For i = 0 To Ubound(Ncid)
   
   SQL = "Update [pH_Locale_Order] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('�����ɹ���');location.href='"&PageNo&"';</script>"
End Sub

Sub Dellocale_3_Submit()
 For i = 0 To Ubound(Ncid)
   
   SQL = "Update [pH_Locale_Order] Set Flag=2 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('�����ɹ���');location.href='"&PageNo&"';</script>"
End Sub


Sub Delapply_Submit()
 For i = 0 To Ubound(Ncid)

   SQL = "Delete From [pH_Locale_Apply] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');location.href='"&PageNo&"';</script>"
End Sub

'//�ر����ݿ�����
CloseDB
 %>

