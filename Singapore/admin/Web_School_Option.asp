<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Schid,UserName,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"130") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Schid")) '企业会员ID
PageNo   = Replace_Text(Request("pageno")) '企业会员ID

'//判断参数是否有效
If Param = "" Then
 Response.write "<script language=JavaScript>alert('操作错误！');location.href='"&PageNo&"';</script>"
 Response.End()
End if

If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('您没有选择记录！');location.href='"&PageNo&"';</script>"
 Response.End()
End if
Ncid  = Split(Ncid,",")
'//判断操作分支
Select Case Param
 Case "delschool":Call DelSchool_Submit()               '删除资料
 Case "shenhe":Call Shenhe_Submit()                     '通过审核 
 Case "noshenhe":Call NoShenhe_Submit()                 '取消审核 
 Case "novip":Call NoVip_Submit()                       '取消审核
 Case "novideo":Call NoVideo_Submit()                   '取消企业的视频
End Select


'//功能函数
'--------------------------------------删除资料----------------------------------------------
Sub DelSchool_Submit()

 For i = 0 To Ubound(Ncid)
   '删除形象图片文件
   SQL = "Select BannerFile From [pH_School_Base] Where Schid='"&Trim(Ncid(i))&"'"
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
   SQL = "Delete From [pH_School_Base] Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除毕业生
   SQL = "Delete From [pH_School_Student] Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)   
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------通过审核----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_School_Base] Set VipFlag=2 Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消审核----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_School_Base] Set VipFlag=0 Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消VIP资格----------------------------------------------
Sub NoVip_Submit()

 For i = 0 To Ubound(Ncid)
 
   SQL = "Update [pH_School_Base] Set VipFlag=2,VipDate=Null,VipEndDate=Null,VipLevel=Null Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消企业的视频----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   '删除企业的视频文件
   SQL = "Select Video_File From [pH_School_Base] Where Schid='"&Trim(Ncid(i))&"'"
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
   SQL = "Update [pH_School_Base] Set Nc_Video=0,Video_Flag=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Schid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'//关闭数据库连接
CloseDB
 %>

