<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Comid,UserName,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"21") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("comid")) '企业会员ID
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
 Case "del":Call Del_Submit()                           '删除兼职职位
 Case "shenhe":Call Shenhe_Submit()                     '通过审核 
 Case "noshenhe":Call NoShenhe_Submit()                 '取消审核 

 Case "delpersonpart":Call DelPerson_Submit()                           '删除兼职意向
 Case "shenhepersonpart":Call ShenhePerson_Submit()                     '通过审核 
 Case "noshenhepersonpart":Call NoShenhePerson_Submit()                 '取消审核 
End Select


'//功能函数
'--------------------------------------删除----------------------------------------------
Sub Del_Submit()

 For i = 0 To Ubound(Ncid)
   '删除
   SQL = "Delete From [pH_Company_Part] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------通过审核----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_Part] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消审核----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_Part] Set Flag=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------删除----------------------------------------------
Sub DelPerson_Submit()

 For i = 0 To Ubound(Ncid)
   '删除
   SQL = "Delete From [pH_Person_Part] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------通过审核----------------------------------------------
Sub ShenhePerson_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Part] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消审核----------------------------------------------
Sub NoShenhePerson_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Part] Set Flag=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'//关闭数据库连接
CloseDB
 %>

