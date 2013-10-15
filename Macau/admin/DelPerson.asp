<%@ Language=VBScript %>
<%response.buffer=false%>
<%response.expires = 0 %>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request.Form("ChkNo")
if chkNO="" then
Call ShowError("请选择个人会员！")
end if
ChkNo=split(ChkNo,", ")
for i=0 to ubound(ChkNo)
  Call RsName(rs,"select pic from [01387member] where uid='"&ChkNo(i)&"'",1,1)
  set fso=server.CreateObject("Scripting.FileSystemObject")
  If fso.fileexists(server.MapPath("../person/upload/"&rs(0)&"")) then
  fso.deletefile(server.mappath("../person/upload/"&rs(0)&""))
  end if
  Call CloseRs()
  Call RsName(rs,"select idcardpic from [01387applypro] where uid='"&ChkNo(i)&"'",1,1)
  if not rs.eof then
  If fso.fileexists(server.MapPath("../person/upload/"&rs(0)&"")) then
  fso.deletefile(server.mappath("../person/upload/"&rs(0)&""))
  set fso=nothing
  end if
  Call CloseRs()
  end if
  if i=ubound(ChkNo) then
    uid=uid&"'"&ChkNo(i)&"'"
  else
    uid=uid&"'"&ChkNo(i)&"',"
  end if
next
if request.Form("ChkNo").count<=1 then
conn.execute("delete from [01387applypro] where uid="&uid&"")
conn.execute("delete from [01387applylist] where uid="&uid&"")
conn.execute("delete from [01387favorite] where uid="&uid&"")
conn.execute("delete from [01387sendresume] where uid="&uid&"")
conn.execute("delete from [01387member] where uid="&uid&"")
else
conn.execute("delete from [01387applypro] where uid in ("&uid&")")
conn.execute("delete from [01387applylist] where uid in ("&uid&")")
conn.execute("delete from [01387favorite] where uid in ("&uid&")")
conn.execute("delete from [01387sendresume] where uid in ("&uid&")")
conn.execute("delete from [01387member] where uid in ("&uid&")")
end if
Call ShowErrorTo("操作成功！","PersonList.asp?page="&request.QueryString("page")&"")
Call CloseConn()
%>