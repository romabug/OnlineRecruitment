<%OPTION EXPLICIT%>
<!--#include file="Hr_upload.inc"-->
<html>
<head>
<title>�ļ��ϴ�</title>
</head>
<body>
<br>�ļ��ϴ�!<hr size=1 noshadow width=300 align=left><br><br>
<%
dim upload,file,formName,formPath,iCount,Filenames
set upload=new upload_5xSoft ''�����ϴ�����

response.write upload.Version&"<br><br>"  ''��ʾ�ϴ���İ汾

if upload.form("filepath")="" then   ''�õ��ϴ�Ŀ¼
 HtmEnd "������Ҫ�ϴ�����Ŀ¼!"
 set upload=nothing
 response.end
else
 formPath=upload.form("filepath")
 ''��Ŀ¼���(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 
end if

iCount=0
for each formName in upload.file ''�г������ϴ��˵��ļ�
 set file=upload.file(formName)  ''����һ���ļ�����
 if file.FileSize>0 then         ''��� FileSize > 0 ˵�����ļ�����
  session("filename")=file.filename
  Filenames=year(date) & Month(date) & day(date) & Hour(time) & Minute(time) & second(time) & right(file.filename,4)
  session("filename1")=Filenames
  file.SaveAs Server.mappath(formPath&Filenames)   ''�����ļ�
  response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" �ɹ�!<br>"
    iCount=iCount+1
 end if
 set file=nothing
next
set upload=nothing  ''ɾ���˶���
response.Redirect("HR_add.asp")
Htmend iCount&" ���ļ��ϴ�����!"

sub HtmEnd(Msg)
 set upload=nothing
 response.write "<br>"&Msg&" [<a href=""javascript:history.back();"">����</a>]</body></html>"
 response.end
end sub
%>
</body>
</html>