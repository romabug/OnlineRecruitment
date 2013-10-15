<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Comid,UserName,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"11") <= 0 Then 
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
 Case "delcompany":Call DelCompany_Submit()             '删除企业资料
 Case "shenhe":Call Shenhe_Submit()                     '通过审核 
 Case "noshenhe":Call NoShenhe_Submit()                 '取消审核 
 Case "novip":Call NoVip_Submit()                       '取消审核
 Case "novideo":Call NoVideo_Submit()                   '取消视频
 Case "delvideo":Call DelVideo_Submit()                 '删除视频
 Case "bestvideo":Call BestVideo_Submit()               '推荐视频
 Case "nobestvideo":Call NoBestVideo_Submit()           '取消推荐
End Select


'//功能函数
'--------------------------------------删除企业资料----------------------------------------------
Sub DelCompany_Submit()

 For i = 0 To Ubound(Ncid)
   '删除企业的形象图片和视频文件
   SQL = "Select LogoUrl,Video_File From [pH_Company_Base] Where Comid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
    LogoUrl    = Rs(0)
	Video_File = Rs(1)
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'图片文件
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/CompanyFile/"&LogoUrl)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/CompanyFile/"&LogoUrl))
	End if
	'视频文件
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/CompanyVideo/"&Video_File)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/CompanyVideo/"&Video_File))
	End if
	Set Fso = Nothing
   End if
   Rs.Close
   '删除企业基本信息
   SQL = "Delete From [pH_Company_Base] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除部门
   SQL = "Delete From [pH_Company_Dept] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除收件夹
   SQL = "Delete From [pH_Company_InBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除面试管理
   SQL = "Delete From [pH_Company_OutBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除人才库
   SQL = "Delete From [pH_Company_PersonDB] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除回收站
   SQL = "Delete From [pH_Company_RecycleBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除搜索器
   SQL = "Delete From [pH_Company_Searcher] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除发布的职位
   SQL = "Delete From [pH_Job_Base] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除个人收藏夹涉及的记录
   SQL = "Delete From [pH_Person_Favouriate] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除个人收件夹涉及的记录
   SQL = "Delete From [pH_Person_InBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除个人发件夹涉及的记录
   SQL = "Delete From [pH_Person_OutBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除个人回收站涉及的记录
   SQL = "Delete From [pH_Person_RecycleBox] Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------通过审核----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_Base] Set Flag=1,Nc_Vip_Jobs=10 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消审核----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Company_Base] Set Flag=0 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消VIP资格----------------------------------------------
Sub NoVip_Submit()

 For i = 0 To Ubound(Ncid)
 
   SQL = "Update [pH_Company_Base] Set Nc_Vip_Flag=0,Nc_Vip_Date=Null,Nc_Vip_EndDate=Null,Nc_Vip_Level=Null Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消企业的视频----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   '取消视频
   SQL = "Update [pH_Company_Base] Set Nc_Video=0 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------删除企业的视频----------------------------------------------
Sub DelVideo_Submit()
 For i = 0 To Ubound(Ncid)
 
  Set Rs = Conn.Execute("Select Video_File From [pH_Company_Base] Where Comid='"&Trim(Ncid(i))&"'")
  If Rs(0) = Null or Rs(0) = "" Then
    CloseRs
    CloseDB
    Response.redirect PageNo
	Response.End()
  Else
     '//删除文件
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/Com_VideoFile/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/Com_VideoFile/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Company_Base] Set Nc_Video=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Comid='"&Trim(Ncid(i))&"'"
    Conn.Execute(SQL)
  End if
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------推荐企业的视频----------------------------------------------
Sub BestVideo_Submit()

 For i = 0 To Ubound(Ncid)
   '取消视频
   SQL = "Update [pH_Company_Base] Set Video_BestFlag=1 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消企业视频的推荐----------------------------------------------
Sub NoBestVideo_Submit()

 For i = 0 To Ubound(Ncid)
   '取消视频
   SQL = "Update [pH_Company_Base] Set Video_BestFlag=0 Where Comid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'//关闭数据库连接
CloseDB
 %>

