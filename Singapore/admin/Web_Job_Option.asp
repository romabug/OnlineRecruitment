<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Jobid,UserName,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"150") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Jobid")) '企业会员ID
PageNo   = Replace_Text(Request("pageno")) '企业会员ID

'//判断参数是否有效
If Param = "" Then
 Response.write "<script language=JavaScript>alert('操作错误！');history.back(-1);</script>"
 Response.End()
End if

If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('您没有选择记录！');history.back(-1);</script>"
 Response.End()
End if

Ncid  = Split(Ncid,",")
'//判断操作分支
Select Case Param
 Case "deljob":Call DelJob_Submit()                     '删除职位
 Case "shenhe":Call Shenhe_Submit()                     '通过审核 
 Case "noshenhe":Call NoShenhe_Submit()                 '取消审核 
 Case "best":Call Best_Submit()                         '设置为急聘
 Case "nobest":Call NoBest_Submit()                     '取消急聘 
 Case "hot":Call Hot_Submit()                           '设为热门
 Case "nohot":Call NoHot_Submit()                       '取消热门
 Case "notop":Call NoTop_Submit()                       '取消固顶
End Select


'//功能函数
'--------------------------------------删除职位----------------------------------------------
Sub DelJob_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   '删除职位信息
   SQL = "Delete From [pH_Job_Base] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   '删除企业收件夹
   SQL = "Delete From [pH_Company_InBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   '删除企业面试管理
   SQL = "Delete From [pH_Company_OutBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   '删除企业回收站
   SQL = "Delete From [pH_Company_RecycleBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   '删除个人收件夹
   SQL = "Delete From [pH_Person_InBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   '删除个人发件夹
   SQL = "Delete From [pH_Person_OutBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   '删除个人收藏夹
   SQL = "Delete From [pH_Person_Favouriate] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   '删除个人回收站
   SQL = "Delete From [pH_Person_RecycleBox] Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
   
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------通过审核----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set JobFlag=1 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消审核----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set JobFlag=0 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------设为急聘----------------------------------------------
Sub Best_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set BestFlag=1 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消急聘----------------------------------------------
Sub NoBest_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set BestFlag=0 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------设为热门----------------------------------------------
Sub Hot_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set HotFlag=1 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消热门----------------------------------------------
Sub NoHot_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set HotFlag=0 Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消固顶----------------------------------------------
Sub NoTop_Submit()

 For i = 0 To Ubound(Ncid)
   Jobid = Trim(Ncid(i))
   SQL = "Update [pH_Job_Base] Set TopAll=0,TopDate=Null,TopEndDate=Null Where Jobid="&Cstr(Jobid)
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'//关闭数据库连接
CloseDB
 %>

