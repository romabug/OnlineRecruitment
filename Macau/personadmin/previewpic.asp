<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<title>ͼƬԤ��</title>
<%
file1=request.Form("file1")
check=right(file1,len(file1)-InStr(file1,"."))
checkchar="GIF,JPG,JPEG"
if instr(lcase(checkchar),lcase(check))>=1 then
%>
<img src="<%=request.Form("file1")%>">
<%else%>
<SCRIPT language=JavaScript>
alert('�����ļ����Ͳ������ϴ�!.\nֻ���������͵��ļ��ű������ϴ�: "GIF,JPG,JPEG".\n��ѡ�����ļ�.');
window.close();</SCRIPT>
<%end if%>
<%
conn.close
set conn=nothing
%>