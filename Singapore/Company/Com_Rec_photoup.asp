<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_photoup.inc" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<html>
<head>
<title>�ļ��ϴ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%

Dim Upload,File,FormName,FormPath,iCount,Filename,FileExt,Fs,SQL,Username,Photochk,Photo,Tupian,znum,Perid
'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

Set Rs = Server.Createobject("adodb.recordset")
SQL = "Select Username,Video_PhotoUrl From [pH_Company_Base] Where Username='"&username&"'"
Rs.Open SQL,Conn,1,3
'if rs("Video_PhotoUrl") <> "" then
	'response.write "<font size=2>���Ѿ��ϴ�����Ƭ</font>"
	'response.end
'end if

set upload=new upload_5xSoft ''�����ϴ�����
 formPath="../Uploadfiles/CompanyVideoPhoto"
 'Back = upload.form("back")
 ''��Ŀ¼���(/)
 if right(formPath,1)<>"/" then formPath=formPath&"/" 

iCount=0
for each formName in upload.file ''�г������ϴ��˵��ļ�
 set file=upload.file(formName)  ''����һ���ļ�����
 if file.filesize<10 then
 	response.write "<script >alert('����ѡ����Ҫ�ϴ���ͼƬ!�����ϴ�...');history.back(-1);</script>"
	response.end
 end if
 	
 if file.filesize>100000 then
 	response.write "<script >alert('ͼƬ��С����������!�����ϴ�...');history.back(-1);</script>"
	response.end
 end if

 fileExt=lcase(right(file.filename,4))

 if fileEXT<>".gif" and fileEXT<>".jpg" and fileEXT<>".jpeg" then
 	response.write "<script >alert('�ļ���ʽ����!�����ϴ�...');history.back(-1);</script>"
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
   'response.write "�ļ��к��зǷ��ַ���Ϊ����վ�İ�ȫ�������ϴ�"
   'response.end
   
  'end if
' next

 
 Randomize timer
 zNum = cstr(cint(8999*Rnd+1000))

 filename=formPath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&znum&fileExt
 
 if file.FileSize>0 then         ''��� FileSize > 0 ˵�����ļ�����
  file.SaveAs Server.mappath(filename)   ''�����ļ�
'  response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" �ɹ�!<br>"
  iCount=iCount+1
 end if
 tupian=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&znum&fileExt
 set file=nothing
next
set upload=nothing  ''ɾ���˶���

rs("Video_PhotoUrl") = tupian
rs.update
rs.close
set rs=nothing

'//��������޸�ʱ��
SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
Conn.Execute(SQL)
 
CloseDB

if Back = "1" Then
 Response.Redirect("Com_Video.asp")
Else
 response.write "<script>alert('��ϲ����������Ƶ�ļ�¼�ƺ�ͼƬ���ɹ����ύ����վ!');window.close();</script>"
End if
%>

</body>
</html>
