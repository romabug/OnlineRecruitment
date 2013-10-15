<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Comid,UserName

'//获取用户的登陆标记
If IsArray(Session("Company")) Then
 Comid = Session("Company")(2)
 UserName = Session("Company")(0)
Else
 Session.Abandon() 
 Response.write "<script>alert('-登录后才能进行该操作！-');window.close();</script>"
 Response.End()
End if

Param    = Replace_Text(Request("param"))
Ncid     = Replace_Text(Request("perid"))
'//判断参数是否有效
If Param = "" Then
 Response.write "<script language=JavaScript>alert('操作错误！');window.close();</script>"
 Response.End()
End if

If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('您没有选择记录！');window.close();</script>"
 Response.End()
Else
 Ncid  = Split(Ncid,",")
End if

'//判断操作分支
Select Case Param
 Case "persondb":Call PersonDB_Submit() '加入人才库
 
 Case "delinbox":Call DelInBox_Submit()             '彻底删除企业的收件夹信件
 Case "delrecycle":Call DelRecycle_Submit()         '删除信件到回收站
 
 Case "delpersondb":Call DelPersonDB_Submit()             '彻底删除人才库记录
 Case "delpersondbclass":Call DelPersonDBClass_Submit()   '删除人才库类别
 Case "delfavrecycle":Call DelFavRecycle_Submit()         '删除人才库记录到回收站 
 Case "removepersondb":Call RemovePersondb_Submit()       '移动人才到指定的模块  

 Case "del":Call Del_Submit()             '彻底删除
 Case "undel":Call UnDel_Submit()         '还原记录
 
 Case "invite":Call Invite_Submit()       '已经参加过面试 
 Case "enableinvite":Call EnableInvite_Submit()       '已经参加过面试  
 Case "disableinvite":Call DisableInvite_Submit()       '已经参加过面试 
   
 Case "delinvite":Call DelInvite_Submit()       '删除面试记录  
 Case "delvideoinbox":Call DelVideoInBox_Submit()       '删除视频面试申请记录  
 Case "delvideooutbox": Call DelVideoOutBox_Submit()       '删除邀请视频面试记录  
 
 Case "delinfo": Call Delworkinfo_Submit() '删除企业的劳务信息
 Case "actions": Call Actions_Submit() '激活企业的劳务信息 
 Case "noactions": Call NoActions_Submit() '屏蔽企业的劳务信息 
 Case "refresh": Call Refresh_Submit() '刷新企业的劳务信息  

 Case "delpart": Call DelPart_Submit() '删除企业的兼职信息
 Case "refreshpart": Call RefreshPart_Submit() '刷新企业的兼职信息  
End Select

'//功能函数
'--------------------------------------加入人才库----------------------------------------------
Sub PersonDB_Submit()
 For i = 0 To Ubound(Ncid)
  '查看是否已经保存该收藏记录
  SQL = "Select Ncid From [Ph_Company_PersonDB] Where Perid='"&Ncid(i)&"' And Comid='"&Comid&"'"
  Set Rs = Conn.Execute(SQL)
  If Rs.Eof Then
   '保存数据
   SQL = "Insert Into [Ph_Company_PersonDB] (Perid,Comid,AddDate) Values ('"&Ncid(i)&"','"&Comid&"',GetDate())"
   Conn.Execute(SQL)
  End if
  Rs.Close
 Next
 Response.write "<script language=JavaScript>alert('已经成功地加入人才库！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------彻底删除收件夹信件----------------------------------------------
Sub DelInBox_Submit()
 For i = 0 To Ubound(Ncid)
   '彻底删除收件夹表中的记录
   SQL = "Delete From [Ph_Company_InBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------删除信件到回收站----------------------------------------------
Sub DelRecycle_Submit()
 For i = 0 To Ubound(Ncid)
  '查看用户的信件
  SQL = "Select * From [Ph_Company_InBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
  Set Rs = Conn.Execute(SQL)
  If Not Rs.Eof Then
   '获取信件数据
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
   '删除收件夹表中的该条记录
   SQL = "Delete From [Ph_Company_InBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
  End if
  Rs.Close
 Next
 Response.write "<script language=JavaScript>alert('信件已经成功地被删除到回收站！');window.opener.location.reload();window.close();</script>"

End Sub

'--------------------------------------彻底删除人才库记录----------------------------------------------
Sub DelPersonDB_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除收件夹表中的记录
   SQL = "Delete From [Ph_Company_PersonDB] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------移动人才库记录----------------------------------------------
Sub RemovePersondb_Submit()
 persondbclass = Request("persondbclass")
 'Response.Write persondbclass
 'Response.End()
 For i = 0 To Ubound(Ncid)
   SQL = "Update [Ph_Company_PersonDB] Set Classid="&persondbclass&" Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('操作成功！');window.opener.location.reload();window.close();</script>"
End Sub


'--------------------------------------删除人才库类别----------------------------------------------
Sub DelPersonDBClass_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除收件夹表中的记录
   SQL = "Delete From [Ph_Company_PersonDB_Class] Where Comid='"&Comid&"' And Classid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------删除个人的收藏记录到回收站----------------------------------------------
Sub DelFavRecycle_Submit() 
 For i = 0 To Ubound(Ncid)
  '查看用户的收藏信息
  SQL = "Select * From [Ph_Company_PersonDB] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
  Set Rs = Conn.Execute(SQL)
  If Not Rs.Eof Then
   '获取信件数据
   Perid        = Rs("Perid")
   Comid        = Rs("Comid")
   AddDate      = Rs("AddDate")
   '转移到回收站
   SQL = "Insert Into [pH_Company_RecycleBox] (Perid,Comid,AddDate,Item_Source,DelDate) Values ('"&Perid&"','"&Comid&"','"&AddDate&"',2,GetDate())"
   Conn.Execute(SQL)
   '删除人才库中的该条记录
   SQL = "Delete From [pH_Company_PersonDB] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
  End if
  Rs.Close
 Next
 Response.write "<script language=JavaScript>alert('收藏记录已经成功地被删除到回收站！');window.opener.location.reload();window.close();</script>"

End Sub

'--------------------------------------删除个人的发件夹记录----------------------------------------------
Sub DelOutBox_Submit()
 For i = 0 To Ubound(Ncid)
   '彻底删除发件夹表中的记录
   SQL = "Delete From [Ph_Person_OutBox] Where Perid='"&Perid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------彻底删除回收站记录----------------------------------------------
Sub Del_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除
   SQL = "Delete From [Ph_Company_RecycleBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------还原回收站记录----------------------------------------------
Sub UnDel_Submit()
 For i = 0 To Ubound(Ncid)
  '查找回收站记录
  SQL = "Select * From [Ph_Company_RecycleBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
  Set Rs = Conn.Execute(SQL)
  If Not Rs.Eof Then
   '获取数据
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
   '判断还原的目标表
   If Item_Source = 1 Then
    '还原到收件夹
    SQL = "Insert Into [Ph_Company_InBox] (Perid,Jobid,Comid,AddDate,Title,Memo,Flag) Values ('"&Perid&"',"&Jobid&",'"&Comid&"','"&AddDate&"','"&Title&"','"&Memo&"',"&Flag&")"
   Else
    '还原到人才库
	SQL = "Insert Into [Ph_Company_PersonDB] (Perid,Comid,AddDate) Values ('"&Perid&"','"&Comid&"','"&AddDate&"')"
   End if
   Conn.Execute(SQL)
   '删除收件夹表中的该条记录
   SQL = "Delete From [Ph_Company_RecycleBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
  End if
  Rs.Close
 Next
 Response.write "<script language=JavaScript>alert('还原成功！');window.opener.location.reload();window.close();</script>"

End Sub

'--------------------------------------设置成已经参加过面试----------------------------------------------
Sub Invite_Submit() 
 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_OutBox] Set Flag=1 Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------设置成通过面试----------------------------------------------
Sub EnableInvite_Submit()
 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_OutBox] Set Chat_Flag=1 Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------设置成未通过面试----------------------------------------------
Sub DisableInvite_Submit()
 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_OutBox] Set Chat_Flag=2 Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------删除面试管理记录----------------------------------------------
Sub DelInvite_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除
   SQL = "Delete From [pH_Company_OutBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------删除申请面试表记录----------------------------------------------
Sub DelVideoInBox_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除
   SQL = "Delete From [pH_Company_VideoInBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------删除邀请视频面试表记录----------------------------------------------
Sub DelVideoOutBox_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除
   SQL = "Delete From [pH_Company_VideoOutBox] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------------删除劳务信息----------------------------------------------
Sub Delworkinfo_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除收件夹表中的记录
   SQL = "Delete From [Ph_WorkInfo] Where Userid='"&Comid&"' And id="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------------激活劳务信息----------------------------------------------
Sub Actions_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除收件夹表中的记录
   SQL = "Update [Ph_WorkInfo] Set Zt=1 Where Userid='"&Comid&"' And id="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置完成！');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------------屏蔽劳务信息----------------------------------------------
Sub NoActions_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除收件夹表中的记录
   SQL = "Update [Ph_WorkInfo] Set Zt=0 Where Userid='"&Comid&"' And id="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置完成！');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------------刷新劳务信息----------------------------------------------
Sub Refresh_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除收件夹表中的记录
   SQL = "Update [Ph_WorkInfo] Set AddDate=Getdate() Where Userid='"&Comid&"' And id="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('刷新完成！');window.opener.location.reload();window.close();</script>"
End Sub

'--------------------------------------------删除兼职信息----------------------------------------------
Sub DelPart_Submit() 
 For i = 0 To Ubound(Ncid)
   '彻底删除兼职信息
   SQL = "Delete From [Ph_Company_Part] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');window.opener.location.reload();window.close();</script>"
End Sub
'--------------------------------------------刷新兼职信息----------------------------------------------
Sub RefreshPart_Submit()
 
 For i = 0 To Ubound(Ncid)
   '刷新兼职信息
   SQL = "Update [Ph_Company_Part] Set AddDate=Getdate() Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('刷新完成！');window.opener.location.reload();window.close();</script>"
End Sub


'//关闭数据库连接
Set Rs = Nothing
Set Re = Nothing
CloseDB
 %>
