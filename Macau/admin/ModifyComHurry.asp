<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request.form("ChkNo")
page=request.form("page")
if chkNO="" then
Call ShowError("��ѡ��һ����ҵ��")
end if
if len(chkNO)<>15 then
Call ShowError("��������")
end if
Call RsName(rs,"Select famous from [01387company] where cid='"&ChkNo&"'",1,1)
if rs(0)=true then
ShowError("֪����ҵ���ɼӼ���")
Call CloseRs()
end if
Call RsName(rs,"Select Count(id) from [01387company] where hurry=1 and cid<>'"&ChkNo&"'",1,1)
if rs(0)>=6 then
ShowError("�Ӽ���ҵ�Ѿ��ﵽ6�ң������������Ӽ���")
Call CloseRs()
end if
Call RsName(rs,"Select hurry from [01387company] where cid='"&ChkNo&"'",3,3)
if rs(0)=true then
conn.execute("update [01387company] set hurry='0' where cid='"&ChkNo&"'")
else
conn.execute("update [01387company] set hurry='1' where cid='"&ChkNo&"'")
end if
call closers()
call closeconn()
call ShowErrorTo("�����ɹ���","CompanyList.asp?Page="&page&"")
%>