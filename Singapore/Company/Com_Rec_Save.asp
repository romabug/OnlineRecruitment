<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim FlvName

FlvName = Replace_Text(Request("flvname"))

'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'保存会员的视频简历
FlvName = FlvName&".flv"
Set fs = Server.CreateObject("Scripting.FileSystemObject")
'如果出现找个到文件问题，可能是服务器指定目录没有权限,设置Users组权限
Set f2 = fs.GetFile("D:\1149\UpLoadFiles\Com_VideoFile\streams\_definst_\"&FlvName) 
f2.Copy (Server.MapPath("../UpLoadFiles/Com_VideoFile/"&FlvName)) 
'on Error Resume Next
'fs.CopyFile SFile,TFile 
Set fs = Nothing

SQL = "Update [pH_Company_Base] Set Nc_Video=0,Video_Date='"&Date()&"',Video_File='"&FlvName&"' Where Comid='"&Comid&"'"
Conn.Execute(SQL)

CloseDB

Response.write "<script>alert('您的视频简历已经录制成功，进入下一步...');location.href='Com_Rec_Photo.asp';</script>"

 %>
