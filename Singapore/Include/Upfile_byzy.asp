<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="upload_ccie.inc"-->

<%
set upload=new upload_file
if upload.form("act")="uploadfile" then
	filepath=trim(upload.form("filepath"))
	filelx=trim(upload.form("filelx"))
	
	i=0
	for each formName in upload.File
		set file=upload.File(formName)
 
 fileExt=lcase(file.FileExt)	'�õ����ļ���չ��������.
 if file.filesize<100 then
 	response.write "<span style=""font-family: ����; font-size: 9pt"">����ѡ����Ҫ�ϴ����ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
	response.end
 end if
 if (filelx<>"wmv") and (filelx<>"jpg") and (filelx<>"swf") And (filelx<>"rar") then 
 	response.write "<span style=""font-family: ����; font-size: 9pt"">���ļ����Ͳ����ϴ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
	response.end
 end if
 if filelx="wmv" then
	if fileext<>"wmv"  then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�.WMV�ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
 
 if filelx="rar" then
	if fileext<>"rar"  then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�.Rar�ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
 
 if filelx="jpg" then
	if fileext<>"gif" and fileext<>"jpg" and fileext<>"png"  then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�jpg��gif��ʽ��ͼƬ����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
     	end if
 end if

 if filelx="swf" then
	if fileext<>"swf"  then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�.Swf�ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if

 if filelx="wmv" then
	if file.filesize>(10000*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 10M ���ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
 
 if filelx="rar" then
	if file.filesize>(30000*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 30M ���ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
 
 if filelx="jpg" then
	if file.filesize>(1000*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 1000K ��ͼƬ�ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
  if filelx="swf" then
	if file.filesize>(5000*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 5000K ���ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
 
'���-----
 if CheckFileExt(filelx)=false then
   	response.write "�벻Ҫ�ϴ��Ƿ��ļ�!"
	response.end
 end if
 
 '///sFile=file.filepath&file.filename
 '///set MyFile=server.createobject("Scripting.FileSystemObject")
 '///set MyText=MyFile.Opentextfile(sFile,1,true)
 '///sTEXTAll=lcase(mytext.readAll)
 '///mytext.close
 '///set MyFile=nothing
 '///sstr="10|.getfolder|.createfolder|.deletefolder|.createdirectory|.deletedirectory|.saveas|.wscript.shell|script.encode|object|Adodb.Stream"
 '///sNostring=split(sstr,"|")
 '///for i=1 to sNostring(0)
 '/// if instr(sTextAll,sNostring(i))<>0 then
 '///  response.write "�ļ��к��зǷ��ַ���Ϊ����վ�İ�ȫ�������ϴ�"
 '///  response.end
   
 '/// end if
 '///next
'������-----
 randomize
 ranNum=int(90000*rnd)+10000
 filename=filepath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
%>
<%
 if file.FileSize>0 then         ''��� FileSize > 0 ˵�����ļ�����
  'file.SaveAs Server.mappath(filename)   ''�����ļ�
  file.SaveToFile Server.mappath(FileName)
  'response.write file.FileName&"�����ϴ��ɹ�!����<br>"
  'response.write "���ļ�����"&FileName&"<br>"
  'response.write "���ļ����Ѹ��Ƶ������λ�ã��ɹرմ��ڣ�"
  if filelx="swf" then
      response.write "<script>window.opener.document."&upload.form("FormName")&".size.value='"&int(file.FileSize/1024)&" K'</script>"
  end if
  response.write "<script>window.opener.document."&upload.form("FormName")&"."&upload.form("EditName")&".value='"&FileName&"'</script>"
%>
<%
 end if
 set file=nothing
	next
	set upload=nothing
end if
%>
<script language="javascript">
window.alert("�ļ��ϴ��ɹ�!�벻Ҫ�޸����ɵ����ӵ�ַ��");
window.close();
</script>
<%

set rs=nothing

call closedb
%>
