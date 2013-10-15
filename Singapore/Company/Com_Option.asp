<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Comid,UserName

'//��ȡ�û��ĵ�½���
If IsArray(Session("Company")) Then
 Comid = Session("Company")(2)
 UserName = Session("Company")(0)
Else
 Session.Abandon() 
 Response.write "<script>alert('-��¼����ܽ��иò�����-');window.close();</script>"
 Response.End()
End if

Param    = Replace_Text(Request("param"))
Ncid     = Replace_Text(Request("perid"))
'//�жϲ����Ƿ���Ч
If Param = "" Then
 Response.write "<script language=JavaScript>alert('��������');window.close();</script>"
 Response.End()
End if

If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('��û��ѡ���¼��');window.close();</script>"
 Response.End()
Else
 Ncid  = Split(Ncid,",")
End if

'//�жϲ�����֧
Select Case Param
 Case "persondb":Call PersonDB_Submit() '�����˲ſ�
 
 Case "delinbox":Call DelInBox_Submit()             '����ɾ����ҵ���ռ����ż�
 Case "delrecycle":Call DelRecycle_Submit()         'ɾ���ż�������վ
 
 Case "delpersondb":Call DelPersonDB_Submit()             '����ɾ���˲ſ��¼
 Case "delpersondbclass":Call DelPersonDBClass_Submit()   'ɾ���˲ſ����
 Case "delfavrecycle":Call DelFavRecycle_Submit()         'ɾ���˲ſ��¼������վ 
 Case "removepersondb":Call RemovePersondb_Submit()       '�ƶ��˲ŵ�ָ����ģ��  

 Case "del":Call Del_Submit()             '����ɾ��
 Case "undel":Call UnDel_Submit()         '��ԭ��¼
 
 Case "invite":Call Invite_Submit()       '�Ѿ��μӹ����� 
 Case "enableinvite":Call EnableInvite_Submit()       '�Ѿ��μӹ�����  
 Case "disableinvite":Call DisableInvite_Submit()       '�Ѿ��μӹ����� 
   
 Case "delinvite":Call DelInvite_Submit()       'ɾ�����Լ�¼  
 Case "delvideoinbox":Call DelVideoInBox_Submit()       'ɾ����Ƶ���������¼  
 Case "delvideooutbox": Call DelVideoOutBox_Submit()       'ɾ��������Ƶ���Լ�¼  
 
 Case "delinfo": Call Delworkinfo_Submit() 'ɾ����ҵ��������Ϣ
 Case "actions": Call Actions_Submit() '������ҵ��������Ϣ 
 Case "noactions": Call NoActions_Submit() '������ҵ��������Ϣ 
 Case "refresh": Call Refresh_Submit() 'ˢ����ҵ��������Ϣ  

 Case "delpart": Call DelPart_Submit() 'ɾ����ҵ�ļ�ְ��Ϣ
 Case "refreshpart": Call RefreshPart_Submit() 'ˢ����ҵ�ļ�ְ��Ϣ  
End Select

'//���ܺ���
'--------------------------------------�����˲ſ�----------------------------------------------
Sub PersonDB_Submit()
 For i = 0 To Ubound(Ncid)
  '�鿴�Ƿ��Ѿ�������ղؼ�¼
  SQL = "Select Ncid From [Ph_Company_PersonDB] Where Perid='"&Ncid(i)&"' And Comid='"&Comid&"'"
  Set Rs = Conn.Execute(SQL)
  If Rs.Eof Then
   '��������
   SQL = "Insert Into [Ph_Company_PersonDB] (Perid,Comid,AddDate) Values ('"&Ncid(i)&"','"&Comid&"',GetDate())"
   Conn.Execute(SQL)
  End if
  Rs.Close
 Next
 Response.write "<script language=JavaScript>alert('�Ѿ��ɹ��ؼ����˲ſ⣡');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------����ɾ���ռ����ż�----------------------------------------------
Sub DelInBox_Submit()
 For i = 0 To Ubound(Ncid)
   '����ɾ���ռ��б��еļ�¼
   SQL = "Delete From [Ph_Company_InBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------ɾ���ż�������վ----------------------------------------------
Sub DelRecycle_Submit()
 For i = 0 To Ubound(Ncid)
  '�鿴�û����ż�
  SQL = "Select * From [Ph_Company_InBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
  Set Rs = Conn.Execute(SQL)
  If Not Rs.Eof Then
   '��ȡ�ż�����
   Perid        = Rs("Perid")
   Jobid        = Rs("Jobid")
   Comid        = Rs("Comid")
   AddDate      = Rs("AddDate")
   Title        = Rs("Title")
   Memo         = Rs("Memo")
   Flag         = Rs("Flag")
   If Flag = True Then
    Flag = 1
   Else
    Flag = 0
   End if
   SQL = "Insert Into [pH_Company_RecycleBox] (Perid,Jobid,Comid,AddDate,Title,Memo,Flag,Item_Source,DelDate) Values ('"&Perid&"',"&Jobid&",'"&Comid&"','"&AddDate&"','"&Title&"','"&Memo&"',"&Flag&",1,GetDate())"
   Conn.Execute(SQL)
   'ɾ���ռ��б��еĸ�����¼
   SQL = "Delete From [Ph_Company_InBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
  End if
  Rs.Close
 Next
 Response.write "<script language=JavaScript>alert('�ż��Ѿ��ɹ��ر�ɾ��������վ��');window.opener.location.reload();window.close();</script>"

End Sub

'--------------------------------------����ɾ���˲ſ��¼----------------------------------------------
Sub DelPersonDB_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ���ռ��б��еļ�¼
   SQL = "Delete From [Ph_Company_PersonDB] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------�ƶ��˲ſ��¼----------------------------------------------
Sub RemovePersondb_Submit()
 persondbclass = Request("persondbclass")
 'Response.Write persondbclass
 'Response.End()
 For i = 0 To Ubound(Ncid)
   SQL = "Update [Ph_Company_PersonDB] Set Classid="&persondbclass&" Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('�����ɹ���');window.opener.location.reload();window.close();</script>"
End Sub


'--------------------------------------ɾ���˲ſ����----------------------------------------------
Sub DelPersonDBClass_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ���ռ��б��еļ�¼
   SQL = "Delete From [Ph_Company_PersonDB_Class] Where Comid='"&Comid&"' And Classid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------ɾ�����˵��ղؼ�¼������վ----------------------------------------------
Sub DelFavRecycle_Submit() 
 For i = 0 To Ubound(Ncid)
  '�鿴�û����ղ���Ϣ
  SQL = "Select * From [Ph_Company_PersonDB] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
  Set Rs = Conn.Execute(SQL)
  If Not Rs.Eof Then
   '��ȡ�ż�����
   Perid        = Rs("Perid")
   Comid        = Rs("Comid")
   AddDate      = Rs("AddDate")
   'ת�Ƶ�����վ
   SQL = "Insert Into [pH_Company_RecycleBox] (Perid,Comid,AddDate,Item_Source,DelDate) Values ('"&Perid&"','"&Comid&"','"&AddDate&"',2,GetDate())"
   Conn.Execute(SQL)
   'ɾ���˲ſ��еĸ�����¼
   SQL = "Delete From [pH_Company_PersonDB] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
  End if
  Rs.Close
 Next
 Response.write "<script language=JavaScript>alert('�ղؼ�¼�Ѿ��ɹ��ر�ɾ��������վ��');window.opener.location.reload();window.close();</script>"

End Sub

'--------------------------------------ɾ�����˵ķ����м�¼----------------------------------------------
Sub DelOutBox_Submit()
 For i = 0 To Ubound(Ncid)
   '����ɾ�������б��еļ�¼
   SQL = "Delete From [Ph_Person_OutBox] Where Perid='"&Perid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------����ɾ������վ��¼----------------------------------------------
Sub Del_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ��
   SQL = "Delete From [Ph_Company_RecycleBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------��ԭ����վ��¼----------------------------------------------
Sub UnDel_Submit()
 For i = 0 To Ubound(Ncid)
  '���һ���վ��¼
  SQL = "Select * From [Ph_Company_RecycleBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
  Set Rs = Conn.Execute(SQL)
  If Not Rs.Eof Then
   '��ȡ����
   Perid        = Rs("Perid")
   Jobid        = Rs("Jobid")
   Comid        = Rs("Comid")
   AddDate      = Rs("AddDate")
   Title        = Rs("Title")
   Memo         = Rs("Memo")
   Flag         = Rs("Flag")
   Item_Source  = Rs("Item_Source")
   If Flag = True Then
    Flag = 1
   Elseif Flag = False Then
    Flag = 0
   End if
   '�жϻ�ԭ��Ŀ���
   If Item_Source = 1 Then
    '��ԭ���ռ���
    SQL = "Insert Into [Ph_Company_InBox] (Perid,Jobid,Comid,AddDate,Title,Memo,Flag) Values ('"&Perid&"',"&Jobid&",'"&Comid&"','"&AddDate&"','"&Title&"','"&Memo&"',"&Flag&")"
   Else
    '��ԭ���˲ſ�
	SQL = "Insert Into [Ph_Company_PersonDB] (Perid,Comid,AddDate) Values ('"&Perid&"','"&Comid&"','"&AddDate&"')"
   End if
   Conn.Execute(SQL)
   'ɾ���ռ��б��еĸ�����¼
   SQL = "Delete From [Ph_Company_RecycleBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
  End if
  Rs.Close
 Next
 Response.write "<script language=JavaScript>alert('��ԭ�ɹ���');window.opener.location.reload();window.close();</script>"

End Sub

'--------------------------------------���ó��Ѿ��μӹ�����----------------------------------------------
Sub Invite_Submit() 
 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_OutBox] Set Flag=1 Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------���ó�ͨ������----------------------------------------------
Sub EnableInvite_Submit()
 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_OutBox] Set Chat_Flag=1 Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------���ó�δͨ������----------------------------------------------
Sub DisableInvite_Submit()
 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_OutBox] Set Chat_Flag=2 Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('���óɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------ɾ�����Թ����¼----------------------------------------------
Sub DelInvite_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ��
   SQL = "Delete From [pH_Company_OutBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------ɾ���������Ա��¼----------------------------------------------
Sub DelVideoInBox_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ��
   SQL = "Delete From [pH_Company_VideoInBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------ɾ��������Ƶ���Ա��¼----------------------------------------------
Sub DelVideoOutBox_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ��
   SQL = "Delete From [pH_Company_VideoOutBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------------ɾ��������Ϣ----------------------------------------------
Sub Delworkinfo_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ���ռ��б��еļ�¼
   SQL = "Delete From [Ph_WorkInfo] Where Userid='"&Comid&"' And id="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------------����������Ϣ----------------------------------------------
Sub Actions_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ���ռ��б��еļ�¼
   SQL = "Update [Ph_WorkInfo] Set Zt=1 Where Userid='"&Comid&"' And id="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('������ɣ�');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------------����������Ϣ----------------------------------------------
Sub NoActions_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ���ռ��б��еļ�¼
   SQL = "Update [Ph_WorkInfo] Set Zt=0 Where Userid='"&Comid&"' And id="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('������ɣ�');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------------ˢ��������Ϣ----------------------------------------------
Sub Refresh_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ���ռ��б��еļ�¼
   SQL = "Update [Ph_WorkInfo] Set AddDate=Getdate() Where Userid='"&Comid&"' And id="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ˢ����ɣ�');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------------ɾ����ְ��Ϣ----------------------------------------------
Sub DelPart_Submit() 
 For i = 0 To Ubound(Ncid)
   '����ɾ����ְ��Ϣ
   SQL = "Delete From [Ph_Company_Part] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ɾ���ɹ���');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------------ˢ�¼�ְ��Ϣ----------------------------------------------
Sub RefreshPart_Submit()
 
 For i = 0 To Ubound(Ncid)
   'ˢ�¼�ְ��Ϣ
   SQL = "Update [Ph_Company_Part] Set AddDate=Getdate() Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('ˢ����ɣ�');window.opener.location.reload();window.close();</script>"
End Sub


'//�ر����ݿ�����
Set Rs = Nothing
Set Re = Nothing
CloseDB
 %>
