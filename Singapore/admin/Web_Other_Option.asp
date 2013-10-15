<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Param,Ncid,Rs,SQL,Re
Dim Schid,UserName,PageNo

'//检测管理员是否有权限操作该页面
If Instr(1,Session("Web_Power"),"200") <= 0 Then 
  Call CloseDB()
  Response.write "对不起!您没有访问该页面的权限..."
  Response.End()
End If

Param    = Replace_Text(Request("param")) 
Ncid     = Replace_Text(Request("ncid")) 
PageNo   = Replace_Text(Request("pageno")) 

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
 Case "delads":Call DelAds_Submit()               '删除资料
 Case "shenhe":Call Shenhe_Submit()                     '通过审核 
 Case "noshenhe":Call NoShenhe_Submit()                 '取消审核 
 Case "novip":Call NoVip_Submit()                       '取消审核
 Case "novideo":Call NoVideo_Submit()                   '取消企业的视频
End Select


'//功能函数
'--------------------------------------删除资料----------------------------------------------
Sub DelAds_Submit()

 For i = 0 To Ubound(Ncid)
   '删除形象图片文件
   SQL = "Select AdFile From [pH_Web_Ad] Where Ncid="&Trim(Ncid(i))
   Set Rs = Conn.Execute(SQL)
   If Not Rs.Eof Then
    AdFile    = Rs(0)
	
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	'图片文件
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/AdFile/"&AdFile)) Then
	 Fso.DeleteFile(Server.Mappath("../UpLoadFiles/AdFile/"&AdFile))
	End if
	
	Set Fso = Nothing
   End if
   Rs.Close
   '删除记录
   SQL = "Delete From [pH_Web_Ad] Where Ncid="&Trim(Ncid(i))
   Conn.Execute(SQL)  
 Next
 
 Response.write "<script language=JavaScript>alert('删除成功！');location.href='"&PageNo&"';</script>"
End Sub


'//关闭数据库连接
CloseDB
 %>

