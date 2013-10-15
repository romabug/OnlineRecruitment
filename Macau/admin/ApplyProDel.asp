<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim chkNO
chkNO=request("chkNO")
if chkNO="" then
Call ShowError("请选择个人会员！")
end if
chkNO=split(chkNO,"#")
conn.execute("delete from [01387applypro] where id="&Cint(ChkNo(0))&"")
conn.execute("update [01387member] set promember=0,procommend=0 where uid='"&ChkNo(1)&"'")
call CloseConn()
Call ShowErrorTo("操作成功！","Applypro.asp")
%>
