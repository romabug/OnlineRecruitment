<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Server.ScriptTimeout = 90000000
Dim Param,Ncid,Rs,SQL,Re
Dim Perid,UserName,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"120") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("Perid")) '企业会员ID
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
 Case "delperson":Call DelPerson_Submit()             '删除企业资料
 Case "flag":Call Shenhe_Submit()                     '通过审核 
 Case "noflag":Call NoShenhe_Submit()                 '取消审核
 Case "nobest":Call NoBest_Submit()                   '取消审核
 Case "notop":Call NoTop_Submit()                   '取消审核
 Case "novideo":Call NoVideo_Submit()                 '取消视频简历
 Case "delvideo":Call DelVideo_Submit()               '删除视频简历 
 Case "bestvideo":Call BestVideo_Submit()             '推荐视频简历 
 Case "nobestvideo":Call NoBestVideo_Submit()         '取消视频简历推荐 
 Case "video":Call Video_Submit()                     '解压缩生成视频简历
End Select


'//功能函数
'--------------------------------------删除个人资料----------------------------------------------
Sub DelPerson_Submit()

 For i = 0 To Ubound(Ncid)
   '删除个人照片文件
   SQL = "Select PhotoUrl From [pH_Person_Info] Where Perid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
    PhotoUrl    = Rs(0)
	
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'图片文件
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/PersonFile/"&PhotoUrl)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/PersonFile/"&PhotoUrl))
	End if
	Set Fso = Nothing
   End if
   Rs.Close
   '删除个人帐号信息
   SQL = "Delete From [pH_Person_Base] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除个人基本信息
   SQL = "Delete From [pH_Person_Info] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除教育经历
   SQL = "Delete From [pH_Person_Education] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除收藏夹
   SQL = "Delete From [pH_Person_Favouriate] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL) 
   '删除收件夹
   SQL = "Delete From [pH_Person_InBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除发件夹
   SQL = "Delete From [pH_Person_OutBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除回收站
   SQL = "Delete From [pH_Person_RecycleBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除搜索器
   SQL = "Delete From [pH_Person_Searcher] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除工作经历
   SQL = "Delete From [pH_Person_Work] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除企业收件夹
   SQL = "Delete From [pH_Company_InBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除企业发件夹
   SQL = "Delete From [pH_Company_OutBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除企业人才库
   SQL = "Delete From [pH_Company_PersonDB] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
   '删除企业回收站
   SQL = "Delete From [pH_Company_RecycleBox] Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------通过审核----------------------------------------------
Sub Shenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Base] Set Flag=1 Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------取消审核----------------------------------------------
Sub NoShenhe_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Base] Set Flag=0 Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消自荐----------------------------------------------
Sub NoBest_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Base] Set Nc_Best_Flag=0,Nc_Best_Ads=null,Nc_Best_Level=0,Nc_Best_Date=null,Nc_Best_EndDate=null,Nc_Best_ApplyDate=null Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消固顶----------------------------------------------
Sub NoTop_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Info] Set TopAll=0,TopDate=null,TopEndDate=null Where Perid='"&Trim(Ncid(i))&"'"
   Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'--------------------------------------解压缩生成视频简历----------------------------------------------
Sub Video_Submit()

 For i = 0 To Ubound(Ncid)
  
   BeginDate   = Replace_text(request("BeginDate"))
   EndDate     = Replace_text(request("EndDate"))
   Url = Replace_Text(Request("Url"))
   If Url <> "" Then Url = Replace(Url,"../UpLoadFiles/VideoFile/","")
   Path        = Replace(Lcase(Url),".rar","")
   Photo       = Replace_text(request("Photo")) 
   If Photo <> "" Then Photo = Replace(Photo,"../UpLoadFiles/PersonVideoPhoto/","")
   Best        = Replace_text(request("best")) 
	
	
   If Url = "" Then
    Response.write "<script language=JavaScript>alert('请先上传视频压缩文件！');location.href='"&PageNo&"';</script>"
    Response.End()
   End if
   
   '检测是否是第一次压缩
  Set Rs = Conn.Execute("Select Video_File From [pH_Person_Info] Where Perid='"&Trim(Ncid(i))&"'")
  If Rs(0) = Url Then
    Response.write "<script language=JavaScript>alert('必须重新上传文件进行解压！');location.href='"&PageNo&"';</script>"
   Response.End()
  End if
  Rs.Close
  
  '新建目录
  Foldername = Server.MapPath("../Video/Resume/"&Path)
  Set Fso1 = CreateObject("Scripting.FileSystemObject")
  Fso1.CreateFolder(Foldername)
  Set Fso1 = Nothing
  '生成视频简历
  Sys_path = Server.mappath("Web_Shell")&"\"    '系统文件目录
  afterunzip = Server.mappath("../Video/Resume/"&Path)  '目标目录
  PEDM = Server.mappath("../UpLoadFiles/VideoFile/"&Url) '源文件

  Set Shell = Server.CreateObject("WScript.Shell") 
  rarcomm= Sys_path&"cmd.exe /c "&Sys_path&"rar.exe x -t -o+ " 
  cmd = rarcomm&PEDM&" "&afterunzip
  RetCode = Shell.Run(cmd,1, True) 
  
  '保存信息
  SQL = "UPdate [pH_Person_Info] Set Nc_Video=1,Video_Date='"&BeginDate&"',Video_EndDate='"&EndDate&"',Video_File='"&Url&"',Video_FilePath='"&Path&"',Video_PhotoUrl='"&Photo&"',Video_BestFlag="&Best&" Where Perid='"&Trim(Ncid(i))&"'"
 Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
 
End Sub

'--------------------------------------取消视频----------------------------------------------
Sub NoVideo_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Info] Set Nc_Video=0 Where Perid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------推荐视频简历----------------------------------------------
Sub BestVideo_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Info] Set Video_BestFlag=1 Where Perid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------取消推荐----------------------------------------------
Sub NoBestVideo_Submit()

 For i = 0 To Ubound(Ncid)
   SQL = "Update [pH_Person_Info] Set Video_BestFlag=0 Where Perid='"&Trim(Ncid(i))&"'"
   Set Rs = Conn.Execute(SQL)
 Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub
'--------------------------------------删除视频----------------------------------------------
Sub DelVideo_Submit()

For i = 0 To Ubound(Ncid)
 Set Rs = Conn.Execute("Select Video_File From [pH_Person_Info] Where Perid='"&Trim(Ncid(i))&"'")
 If Rs(0) <> "" Then
     '//删除文件
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/VideoFile/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/VideoFile/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Person_Info] Set Nc_Video=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null Where Perid='"&Trim(Ncid(i))&"'"
    Conn.Execute(SQL)
 End if
  
Next
 Response.write "<script language=JavaScript>alert('设置成功！');location.href='"&PageNo&"';</script>"
End Sub

'//关闭数据库连接
CloseDB
 %>

