<!--#include file="../../conn.asp"-->
<!--#include file="../cookies.asp"-->
<!-- #include file="upfile.asp" -->
<%

dim sql,rs,MachineName,FileName,file,D1,ImgnameI,MachineType,TeacherCount,MachinePower,formPath,StartDate,MachineJj,Contact,CAddress,PostCode,CTel,CFax,Email,Website,fileup,ProductImgI
set FileUP=new Upload_file 
FileUP.GetDate(-1)
formPath="../../images/linkpic/"
linkname=Server.HTMLEncode(trim(FileUP.form("linkname")))
url=Server.HTMLEncode(trim(FileUP.form("url")))
ProductImgI=Server.HTMLEncode(trim(FileUP.form("ProductImgI")))
types=Server.HTMLEncode(trim(FileUP.form("types")))
indexlook=Server.HTMLEncode(trim(FileUP.form("indexlook")))
hist=Server.HTMLEncode(trim(FileUP.form("hist")))
look=Server.HTMLEncode(trim(FileUP.form("look")))
style=Server.HTMLEncode(trim(FileUP.form("style")))

set file=FileUP.file("ProductImgI")
	if file.filesize then
		if file.filesize > 512000 then 
		response.Write("<script language=javascript>alert('图片不能超过500K，图片实际大小"&int(file.filesize/1024)&" K');history.go(-1);</script>")
		response.end
		end if
		if LCase(file.FileExt) <> "jpg" and LCase(file.FileExt) <> "gif" Then
		response.Write("<script language=javascript>alert('图片格式只能为jpg或gif！');history.go(-1);</script>")
		response.End()
		end if
		if ImgnameI<>"" then DelFile "../../images/linkpic/",ImgnameI
		ProductImgI=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&"."&file.FileExt
		filename=formPath&ProductImgI
		file.SaveToFile Server.mappath(filename)
	else
		if D1="ON" then
		DelFile "../../images/linkpic/",ImgnameI
		else
		ProductImgI=ImgnameI
		end if
	end if
	
set rs=server.CreateObject("ADODB.RecordSet")
sql="select * from [link] "
rs.open sql,conn,1,3
rs.addnew
rs("linkname")=linkname
rs("url")=url
rs("images")=ProductImgI
rs("types")=types
rs("indexlook")=indexlook
rs("hist")=hist
rs("look")=look
rs("addtime")=now()

if style<>"" then
rs("style")=style
end if

rs.update
response.Write linkname&"<br>"
response.Write url&"<br>"
response.Write ProductImgI
'response.Write "我"
response.Write("<SCRIPT language=JavaScript>alert('添加成功！');history.go(-1);</SCRIPT>")


rs.close
set rs=nothing
conn.close
set conn=nothing
response.End()%>