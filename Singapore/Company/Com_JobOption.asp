<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Jobid
Dim Action,SQL,i,EndDate

Check_Url()                        '//跨站提交数据检测
Username  = Session("Company")(0)  '//获取会员登陆的标记
Comid     = Session("Company")(2)
Jobid     = Replace_Text(Request.Form("param"))

If Jobid = "" Then                 '//职位为空时，跳到错误页
 Response.redirect "../Public/Error.asp?Param=2002"
End if

Jobid          = Split(Jobid,",")
EndDate        = DateAdd("m",3,Date())

Action = Replace_Text(Request.QueryString("action"))
Select Case Action
 Case "refreshs"
  Call Refresh_Submit()
 Case "opens"
  Call Open_Submit()
 Case "closes"
  Call Close_Submit()
 Case "dels"
  Call Delete_Submit()
  Case "publishs"
  Call Publish_Submit() 
End Select

Sub Refresh_Submit() '//刷新职位
 For i = 0 To UBound(Jobid)
  SQL = "Update [pH_Job_Base] Set LastUpdate_Time=getdate() Where Jobid="&Jobid(i)&" And Comid='"&Comid&"'"
  Conn.Execute(SQL)
 Next
End Sub

Sub Open_Submit()    '//激活职位
 For i = 0 To UBound(Jobid)
 
  SQL = "Update [pH_Job_Base] Set JobFlag=1 Where Jobid="&Jobid(i)&" And Comid='"&Comid&"' And JobFlag<>0"
  Conn.Execute(SQL)
  
 Next
End Sub

Sub Close_Submit()   '//屏蔽职位
 For i = 0 To UBound(Jobid)
  SQL = "Update [pH_Job_Base] Set JobFlag=2 Where Jobid="&Jobid(i)&" And Comid='"&Comid&"' And JobFlag<>0"
  Conn.Execute(SQL)
 Next
End Sub

Sub Delete_Submit()  '//删除职位
 For i = 0 To UBound(Jobid)
  Conn.Execute("Delete From [pH_Job_Base] Where Jobid="&Jobid(i)&" And Comid='"&Comid&"'")
 Next
End Sub

Sub Publish_Submit()  '//重新发布
 For i = 0 To UBound(Jobid)
  SQL = "Update [pH_Job_Base] Set LastUpdate_Time=getdate(),End_Date='"&EndDate&"',JobFlag=1 Where Jobid="&Jobid(i)&" And Comid='"&Comid&"'"
  Conn.Execute(SQL)
 Next
End Sub
Response.redirect "Com_JobManage.asp"

'//关闭数据库连接
CloseDB
 %>
