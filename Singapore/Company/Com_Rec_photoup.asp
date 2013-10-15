<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_photoup.inc" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<html>
<head>
<title>文件上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%

Dim Upload,File,FormName,FormPath,iCount,Filename,FileExt,Fs,SQL,Username,Photochk,Photo,Tupian,znum,Perid
'//获取会员登陆的标记
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

Set Rs = Server.Createobject("adodb.recordset")
SQL = "Select Username,Video_PhotoUrl From [pH_Company_Base] Where Username='"&username&"'"
Rs.Open SQL,Conn,1,3
'if rs("Video_PhotoUrl") <> "" then
	'response.write "<font size=2>您已经上传了照片</font>"
	'response.end
'end if

set upload=new upload_5xSoft ''建立上传对象
 formPath="../Uploadfiles/CompanyVideoPhoto"
 'Back = upload.form("back")
 ''在目录后加(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 

iCount=0
for each formName in upload.file ''列出所有上传了的文件
 set file=upload.file(formName)  ''生成一个文件对象
 if file.filesize<10 then
 	response.write "<script >alert('请先选择你要上传的图片!重新上传...');history.back(-1);</script>"
	response.end
 end if
 	
 if file.filesize>100000 then
 	response.write "<script >alert('图片大小超过了限制!重新上传...');history.back(-1);</script>"
	response.end
 end if

 fileExt=lcase(right(file.filename,4))

 if fileEXT<>".gif" and fileEXT<>".jpg" and fileEXT<>".jpeg" then
 	response.write "<script >alert('文件格式不对!重新上传...');history.back(-1);</script>"
	response.end
 end if 
 
 'sFile=file.filepath&file.filename
 'set MyFile=server.createobject("Scripting.FileSystemObject")
 'set MyText=MyFile.Opentextfile(sFile,1,true)
 'sTEXTAll=lcase(mytext.readAll)
 'mytext.close
 'set MyFile=nothing
 'sstr="10|.getfolder|.createfolder|.deletefolder|.createdirectory|.deletedirectory|.saveas|.wscript.shell|script.encode|object|Adodb.Stream"
 'sNostring=split(sstr,"|")
 'for i=1 to sNostring(0)
  'if instr(sTextAll,sNostring(i))<>0 then
   'response.write "文件中含有非法字符！为了网站的安全，不能上传"
   'response.end
   
  'end if
' next

 
 Randomize timer
 zNum = cstr(cint(8999*Rnd+1000))

 filename=formPath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&znum&fileExt
 
 if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
  file.SaveAs Server.mappath(filename)   ''保存文件
'  response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" 成功!<br>"
  iCount=iCount+1
 end if
 tupian=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&znum&fileExt
 set file=nothing
next
set upload=nothing  ''删除此对象

rs("Video_PhotoUrl") = tupian
rs.update
rs.close
set rs=nothing

'//更改最后修改时间
SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
Conn.Execute(SQL)
 
CloseDB

if Back = "1" Then
 Response.Redirect("Com_Video.asp")
Else
 response.write "<script>alert('恭喜您！您的视频文件录制和图片都成功的提交到网站!');window.close();</script>"
End if
%>

</body>
</html>
