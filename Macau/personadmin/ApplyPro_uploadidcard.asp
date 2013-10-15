<%@ Language=VBScript %>
<%response.buffer=false%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!--#include FILE="../inc/upload_5xsoft.inc"--> 
<%
'添加修改相片
if request.QueryString("action")="add" then
function getex(filename)
getex = right(filename,(len(filename)-InStr(filename,".")))
End Function
dim upload,file,formName,formPath,fname,getfilename
set upload=new upload_5xsoft
formPath=upload.form("filepath")
if right(formPath,1)<>"/" then formPath=formPath&"/" 
fname = now()
fname = replace(fname,"-","")
fname = replace(fname," ","") 
fname = replace(fname,":","")
fname = replace(fname,"PM","")
fname = replace(fname,"AM","")
fname = replace(fname,"上午","")
fname = replace(fname,"下午","")
fname = fname&Int((right(fname,4) - 0 + 1) * Rnd + 0)
for each formName in upload.file
set file=upload.file(formName)
if file.FileSize>102400 then
response.Write("<script language=javascript>alert('图片大小超过100K');")
response.Write("javascript:history.go(-1);</script>")
response.end()
end if
if file.FileSize<=0 then
response.Write("<script language=javascript>alert('无效文件！');")
response.Write("javascript:history.go(-1);</script>")
response.end()
end if
if file.FileSize>0 and file.FileSize<=102400 then
file.SaveAs Server.mappath(formPath&fname&"."&getex(file.filename))
session("591applyproidcard")=fname&"."&getex(file.filename)
end if
next
response.write"<font color=red size=2>上传文件成功!"&file.filename&"</font>"
response.end()
set file=nothing
set upload=nothing
end if
'添加修改相片结束
%>
<link href="../style/591.css" rel="stylesheet" type="text/css">
<script language=javascript src="inc/uploadpic.js"></script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="ApplyPro_uploadidcard.asp?action=add" enctype="multipart/form-data" onSubmit="checkFileUpload(this,'GIF,JPG,JPEG');return document.MM_returnValue">
<input name="file1" type="file" class="input" id="file1" size="30">
  <input name="filepath" type="hidden" id="filepath" value="upload">
  <input type="button" value="预览" name="Send" onClick="view()">
<input type="submit" value="上传" name="Send2">
  <strong><font color="#FF0000">*</font></strong> 
</form>
</body>
<form name=preview action=previewpic.asp method=post target=preview_page>
<input type=hidden name=file1 value=>
</form>