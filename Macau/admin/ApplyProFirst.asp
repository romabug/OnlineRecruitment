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
conn.execute("update [01387applypro] set passok=3,refuse='',passtime='"&date()&"' where id="&ChkNo(0)&"")
Call RsName(rs,"select id from [01387member] where firstcommend=1 and promember=1 and uid<>'"&ChkNo(1)&"'",1,1)
if rs.recordcount>1 then
  Call CloseRs()
  Call ShowError("首页只能推荐2名高级人才！")
end if
Call RsName(rs1,"select firstcommend from [01387member] where uid='"&ChkNo(1)&"'",3,3)
if rs1(0)=true then
  conn.execute("update [01387member] set firstcommend=0,promember=1 where uid='"&ChkNo(1)&"'")
else
  conn.execute("update [01387member] set firstcommend=1,promember=1 where uid='"&ChkNo(1)&"'")
end if
rs1.close
set rs1=nothing
call CloseConn()
Call ShowErrorTo("操作成功！","Applypro.asp")
%>
