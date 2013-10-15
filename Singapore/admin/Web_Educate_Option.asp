<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Schid,UserName,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"14") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Schid")) '企业会员ID
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
 Case "delschool":Call DelSchool_Submit()               '删除资料
 Case "deldemand":Call DelDemand_Submit()               '删除培训需求
 Case "delbook":Call DelBook_Submit()             	    '删除书籍
 Case "dellesson":Call DelLesson_Submit()          	    '删除课程
 Case "delteacher":Call DelTeacher_Submit()             '删除讲师
 
 Case "shenhe":Call Shenhe_Submit()                     '通过审核 
 Case "noshenhe":Call NoShenhe_Submit()                 '取消审核 
 
 Case "shenhedemand":Call ShenheDemand_Submit()                 '通过培训需求审核 
 Case "noshenhedemand":Call NoShenheDemand_Submit()             '取消培训需求审核 
 Case "shenhebook":Call ShenheBook_Submit()                     '通过书籍审核 
 Case "noshenhebook":Call NoShenheBook_Submit()                 '取消书籍审核 
 Case "shenhelesson":Call ShenheLesson_Submit()                 '通过课程审核 
 Case "noshenhelesson":Call NoShenheLesson_Submit()             '取消课程审核 
 Case "shenheteacher":Call ShenheTeacher_Submit()                 '通过讲师审核 
 Case "noshenheteacher":Call NoShenheTeacher_Submit()             '取消讲师审核
 
 Case "bestbook":Call BestBook_Submit()                     '推荐书籍 
 Case "nobestbook":Call NoBestBook_Submit()                 '取消书籍的推荐 
 Case "bestteacher":Call BestTeacher_Submit()               '推荐讲师 
 Case "nobestteacher":Call NoBestTeacher_Submit()           '取消讲师的推荐
 
 Case "novip":Call NoVip_Submit()                       '取消Vip

End Select


'//功能函数
'--------------------------------------删除资料----------------------------------------------
Sub DelSchool_Submit()

 For i = 0 To Ubound(Ncid)
   '删除形象图片文件
   SQL = "Select BannerFile From [pH_Educate_Base] Where Schid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
    BannerFile    = Rs(0)
	
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'图片文件
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/SchoolFile/"&BannerFile)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/SchoolFile/"&BannerFile))
	End if
	
	Set Fso = Nothing
   End if
   Rs.Close
   '删除院校基本信息
   SQL = "Delete From [pH_Educate_Base] Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除课程
   SQL = "Delete From [pH_Educate_Lesson] Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)   
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------删除培训需求----------------------------------------------
Sub DelDemand_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Educate_Demand] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------删除书籍----------------------------------------------
Sub DelBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Educate_Book] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------删除课程---------------------------------------------
Sub Dellesson_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Educate_Lesson] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------删除讲师---------------------------------------------
Sub DelTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Delete [pH_Educate_Teacher] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub


'--------------------------------------通过审核----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Base] Set Flag=1 Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消审核----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Base] Set Flag=0 Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消VIP资格----------------------------------------------
Sub NoVip_Submit()
 For i = 0 To Ubound(Ncid)
 
   SQL = "Update [pH_Educate_Base] Set VipFlag=0,VipDate=Null,VipEndDate=Null,VipLevel=0,VipApplyDate=null Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------通过培训需求审核----------------------------------------------
Sub ShenheDemand_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Demand] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消培训需求审核----------------------------------------------
Sub NoShenheDemand_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Demand] Set Flag=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------通过书籍审核----------------------------------------------
Sub ShenheBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Book] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消书籍审核----------------------------------------------
Sub NoShenheBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Book] Set Flag=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------通过课程审核----------------------------------------------
Sub ShenheLesson_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Lesson] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消课程审核----------------------------------------------
Sub NoShenheLesson_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Lesson] Set Flag=2 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------通过讲师审核----------------------------------------------
Sub ShenheTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Teacher] Set Flag=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消讲师审核----------------------------------------------
Sub NoShenheTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Teacher] Set Flag=2 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------推荐书籍----------------------------------------------
Sub BestBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Book] Set Best=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消书籍的推荐----------------------------------------------
Sub NoBestBook_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Book] Set Best=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------推荐讲师----------------------------------------------
Sub BestTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Teacher] Set Best=1 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消讲师的推荐----------------------------------------------
Sub NoBestTeacher_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Educate_Teacher] Set Best=0 Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消企业的视频----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   '删除企业的视频文件
   SQL = "Select Video_File From [pH_Educate_Base] Where Schid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
	Video_File = Rs(0)
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'视频文件
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/SchoolVideo/"&Video_File)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/SchoolVideo/"&Video_File))
	End if
	Set Fso = Nothing
   End if
   Rs.Close
   '取消视频
   SQL = "Update [pH_Educate_Base] Set Nc_Video=0,Video_Flag=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'//关闭数据库连接
CloseDB
 %>

