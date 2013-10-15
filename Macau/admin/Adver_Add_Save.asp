<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/upload_5xsoft.inc"--> 
<!--#include file="inc/Admin_Function.asp"-->
<%
server_v1=Request.ServerVariables("HTTP_REFERER")
server_v2=Request.ServerVariables("SERVER_NAME")
if mid(server_v1,8,len(server_v2))<>server_v2 then 
response.write("提交参数错误！") 
response.end()
end if 
function getex(filename)
getex = right(filename,(len(filename)-InStr(filename,".")))
End Function
dim upload,file,formName,formPath,fname,getfilename
set upload=new upload_5xsoft
formPath=upload.form("filepath")
'if session("situ")=1 or session("situ")=2 and upload.form("adsitu")="" then
'Call ShowError("选择广告位置！")
'end if
'如果表单为空，返回前页
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
if file.FileSize>0 then
file.SaveAs Server.mappath(formPath&fname&"."&getex(file.filename))
session("img")=fname&"."&getex(file.filename)
end if
set file=nothing
next
Call RsName(rs,"select*from [01387AdvLogo]",3,3)
rs.addnew
rs("Situation")=Session("situ")
if upload.form("adsitu")<>"" then
rs("adsitu")=upload.form("adsitu")
end if
rs("Mytype")=upload.form("mytype")
rs("Width")=upload.form("width")
rs("Height")=upload.form("height")
if upload.form("picname")<>"" then
rs("picname")=upload.form("picname")
end if
rs("Url")=upload.form("url")
rs("Img")=session("img")
rs("Hit")=0
rs("show")=true
rs("Addtime")=Date()
rs.update
set upload=nothing
session("img")=""
session("situ")=""
session("situation")=""
Call ShowErrorTo("操作成功！","Adver_Right.asp")
Call CloseRs()
Call CloseConn()
%>