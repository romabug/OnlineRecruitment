<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim FlvName

FlvName = Replace_Text(Request("flvname"))

'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'�����Ա����Ƶ����
FlvName = FlvName&".flv"
Set fs = Server.CreateObject("Scripting.FileSystemObject")
'��������Ҹ����ļ����⣬�����Ƿ�����ָ��Ŀ¼û��Ȩ��,����Users��Ȩ��
Set f2 = fs.GetFile("D:\1149\UpLoadFiles\Com_VideoFile\streams\_definst_\"&FlvName) 
f2.Copy (Server.MapPath("../UpLoadFiles/Com_VideoFile/"&FlvName)) 
'on Error Resume Next
'fs.CopyFile SFile,TFile 
Set fs = Nothing

SQL = "Update [pH_Company_Base] Set Nc_Video=0,Video_Date='"&Date()&"',Video_File='"&FlvName&"' Where Comid='"&Comid&"'"
Conn.Execute(SQL)

CloseDB

Response.write "<script>alert('������Ƶ�����Ѿ�¼�Ƴɹ���������һ��...');location.href='Com_Rec_Photo.asp';</script>"

 %>
