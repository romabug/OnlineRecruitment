<%OPTION EXPLICIT%>
<!--#include file="Hr_upload.inc"-->
<html>
<head>
<title>文件上传</title>
</head>
<body>
<br>文件上传!<hr size=1 noshadow width=300 align=left><br><br>
<%
dim upload,file,formName,formPath,iCount,Filenames
set upload=new upload_5xSoft ''建立上传对象

response.write upload.Version&"<br><br>"  ''显示上传类的版本

if upload.form("filepath")="" then   ''得到上传目录
 HtmEnd "请输入要上传至的目录!"
 set upload=nothing
 response.end
else
 formPath=upload.form("filepath")
 ''在目录后加(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 
end if

iCount=0
for each formName in upload.file ''列出所有上传了的文件
 set file=upload.file(formName)  ''生成一个文件对象
 if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
  session("filename")=file.filename
  Filenames=year(date) & Month(date) & day(date) & Hour(time) & Minute(time) & second(time) & right(file.filename,4)
  session("filename1")=Filenames
  file.SaveAs Server.mappath(formPath&Filenames)   ''保存文件
  response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" 成功!<br>"
    iCount=iCount+1
 end if
 set file=nothing
next
set upload=nothing  ''删除此对象
response.Redirect("HR_add.asp")
Htmend iCount&" 个文件上传结束!"

sub HtmEnd(Msg)
 set upload=nothing
 response.write "<br>"&Msg&" [<a href=""javascript:history.back();"">返回</a>]</body></html>"
 response.end
end sub
%>
</body>
</html>