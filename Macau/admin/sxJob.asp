<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
lngid=request("ChkNo")
page=request("page")
if lngid="" then
Call ShowError("��ѡ��һ��ְλ��")
end if
'response.Write lngid
conn.execute("update [01387company] set lastlogin='"&now()&"',logintime=logintime+1 where id in ("&lngid&") ")

'response.Write lngid
'response.End()
response.write("<script language=javascript>" & _
		vbcrlf & "alert(""ˢ�³ɹ���"");" & _
		vbcrlf & "location='joblist.asp?page="&page&"'" & _
		vbcrlf & "</script>")
		response.End 
Call CloseConn()
%>