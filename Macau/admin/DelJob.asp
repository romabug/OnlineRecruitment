<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%

ChkNo=request("ChkNo")
page=request("page")
if chkNO="" then
Call ShowError("��ѡ��һ��ְλ��")
end if
conn.execute("delete from [01387joblist] where jid='"&ChkNo&"'")
conn.execute("delete from [01387applylist] where jid='"&ChkNo&"'")
conn.execute("delete from [01387favorite] where jid='"&ChkNo&"'")

response.write("<script language=javascript>" & _
		vbcrlf & "alert(""ɾ���ɹ���"");" & _
		vbcrlf & "location='joblist.asp?page="&page&"'" & _
		vbcrlf & "</script>")
		response.End 

Call CloseConn()
%>