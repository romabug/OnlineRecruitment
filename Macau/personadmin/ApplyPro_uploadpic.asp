<%@ Language=VBScript %>
<%response.buffer=false%>
<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<!--#include FILE="../inc/upload_5xsoft.inc"--> 
<%
'����޸���Ƭ
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
fname = replace(fname,"����","")
fname = replace(fname,"����","")
fname = fname&Int((right(fname,4) - 0 + 1) * Rnd + 0)
for each formName in upload.file
set file=upload.file(formName)
if file.FileSize>102400 then
response.Write("<script language=javascript>alert('ͼƬ��С����100K');")
response.Write("javascript:history.go(-1);</script>")
response.end()
end if
if file.FileSize<=0 then
response.Write("<script language=javascript>alert('��Ч�ļ���');")
response.Write("javascript:history.go(-1);</script>")
response.end()
end if
if file.FileSize>0 and file.FileSize<=102400 then
file.SaveAs Server.mappath(formPath&fname&"."&getex(file.filename))
session("591applypropic")=fname&"."&getex(file.filename)
end if
next
set rs=server.createobject("ADODB.recordset") 
rs.open "select username,uid,pic,pichide from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,3,3
set fso=server.CreateObject("Scripting.FileSystemObject")
fso.deletefile(server.mappath("upload/"&rs("pic")&""))
rs("pic")=session("591applypropic")
rs("pichide")="no"
rs.update
rs.close
set rs=nothing
session("591applypropic")=""
response.write"<font color=red size=2>�ϴ��ļ��ɹ�!"&file.filename&"</font>"
response.end()
set file=nothing
set upload=nothing
end if
'����޸���Ƭ����
%>
<link href="../style/591.css" rel="stylesheet" type="text/css">
<script language=javascript src="inc/uploadpic.js"></script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="ApplyPro_uploadpic.asp?action=add" enctype="multipart/form-data" onSubmit="checkFileUpload(this,'GIF,JPG,JPEG');return document.MM_returnValue">
<input name="file1" type="file" class="input" id="file1" size="30">
  <input name="filepath" type="hidden" id="filepath" value="upload">
  <input type="button" value="Ԥ��" name="Send" onClick="view()">
<input type="submit" value="�ϴ�" name="Send2">
  <strong><font color="#FF0000">*</font></strong> 
</form>
</body>
<form name=preview action=previewpic.asp method=post target=preview_page>
<input type=hidden name=file1 value=>
</form>