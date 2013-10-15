<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<title>图片预览</title>
<%
file1=request.Form("file1")
check=right(file1,len(file1)-InStr(file1,"."))
checkchar="GIF,JPG,JPEG"
if instr(lcase(checkchar),lcase(check))>=1 then
%>
<img src="<%=request.Form("file1")%>">
<%else%>
<SCRIPT language=JavaScript>
alert('这种文件类型不允许上传!.\n只有以下类型的文件才被允许上传: "GIF,JPG,JPEG".\n请选择别的文件.');
window.close();</SCRIPT>
<%end if%>
<%
conn.close
set conn=nothing
%>