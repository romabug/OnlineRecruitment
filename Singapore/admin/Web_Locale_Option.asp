<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Comid,UserName,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"170") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("ncid")) '企业会员ID
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
 Case "dellocale":Call Delete_Submit()                     '删除
 Case "delbestcompany":Call Delbestcompany_Submit()        
 Case "dellocalejob":Call Dellocalejob_Submit()
 Case "delapply":Call Delapply_Submit()    
 Case "delbestcompanyjob":Call Delbestcompanyjob_Submit()  
 Case "dellocale_1":Call Dellocale_1_Submit()   
 Case "dellocale_2":Call Dellocale_2_Submit() 
 Case "dellocale_3":Call Dellocale_3_Submit()
End Select


'//功能函数
'--------------------------------------删除企业资料----------------------------------------------
Sub Delete_Submit()

 For i = 0 To Ubound(Ncid)
   '删除企业基本信息
   SQL = "Delete From [pH_Locale_Base] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
   '删除职位
   SQL = "Delete From [pH_Locale_Jobs] Where Locid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub


Sub Delbestcompany_Submit()

 For i = 0 To Ubound(Ncid)
   '删除企业基本信息
   SQL = "Delete From [pH_BestCompany_Base] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
   '删除职位
   SQL = "Delete From [pH_BestCompany_Jobs] Where Bestid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

Sub Dellocalejob_Submit()
 For i = 0 To Ubound(Ncid)
   '删除职位
   SQL = "Delete From [pH_Locale_Jobs] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

Sub Delbestcompanyjob_Submit()
 For i = 0 To Ubound(Ncid)
   '删除职位
   SQL = "Delete From [pH_BestCompany_Jobs] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub


Sub Dellocale_1_Submit()
 For i = 0 To Ubound(Ncid)
   '删除企业基本信息
   SQL = "Delete From [pH_Locale_Order] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

Sub Dellocale_2_Submit()
 For i = 0 To Ubound(Ncid)
   
   SQL = "Update [pH_Locale_Order] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('操作成功！');location.href='"&PageNo&"';</script>"
End Sub

Sub Dellocale_3_Submit()
 For i = 0 To Ubound(Ncid)
   
   SQL = "Update [pH_Locale_Order] Set Flag=2 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('操作成功！');location.href='"&PageNo&"';</script>"
End Sub


Sub Delapply_Submit()
 For i = 0 To Ubound(Ncid)

   SQL = "Delete From [pH_Locale_Apply] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

'//关闭数据库连接
CloseDB
 %>

