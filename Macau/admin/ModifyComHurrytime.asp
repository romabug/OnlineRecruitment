<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request("ChkNo")
'******************************************************修改
if request.QueryString("action")="modify" then
dim cid,hurry,hurrytime
cid=request.querystring("cid")
hurry=request.form("hurry")
hurrytime=request.form("hurrytime")
if hurry=1 then
  Call RsName(rs,"select count(id) from [01387company] where hurry=1 and cid<>'"&cid&"' and hurrytime>='"&date()&"'",1,1)
   if rs(0)>=6 then
    call closers()
    Call ShowErrorTo("加急企业已经达到6家，不可再新增加急！","CompanyList.asp?page="&request("page")&"")
   end if
end if
Call RsName(rs,"select cid,hurry,hurrytime from [01387company] where cid='"&cid&"'",1,1)
select case hurrytime
case 1
hurrytime=dateadd("d",1,date())
case 2
hurrytime=dateadd("d",3,date())
case 3
hurrytime=dateadd("d",7,date())
case 4
hurrytime=dateadd("d",15,date())
case 5
hurrytime=dateadd("m",1,date())
end select
conn.execute("update [01387company] set hurry="&hurry&",hurrytime='"&hurrytime&"' where cid='"&cid&"'")
Call CloseRs()
call ShowErrorTo("操作成功！","CompanyList.asp?page="&request("page")&"")
end if
'******************************************************修改结束
if chkNO="" then
Call ShowError("请选择一家企业！")
end if
if len(chkNO)<>15 then
Call ShowError("参数错误！")
end if
Call RsName(rs,"Select cid,companyname,hurry,hurrytime from [01387company] where cid='"&ChkNo&"'",1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="ModifyComHurrytime.asp?page=<%=request("page")%>&action=modify&cid=<%=chkNo%>">
    <tr> 
      <td height="25" colspan="3" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">修 
          改 首 页 加 急 企 业 过 期 时 间</font></strong></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28" bgcolor="#CEDBF2"><div align="center">公司</div></td>
      <td><div align="center">是否加急企业</div></td>
      <td><div align="center">加急过期时间：<%if rs(2)=0 then response.write("非加急企业") else response.write(rs(3))%></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="19%" height="28" bgcolor="#f1f3f5"><div align="center"><%=rs(1)%></div></td>
      <td width="21%"><div align="center">
          <input name="hurry" type="radio" value="1" <%if rs(2)=true then response.Write("checked")%>>
          是 
          <input type="radio" name="hurry" value="0" <%if rs(2)=false then response.Write("checked")%>>
          否</div></td>
      <td width="21%"><div align="center"> 
          <select name="hurrytime" class="input" id="hurrytime">
		    <option value="1">修改过期时间</option>
            <option value=1>一天</option>
            <option value=2>三天</option>
            <option value=3>一个星期</option>
            <option value=4>半个月</option>
            <option value=5>一个月</option>
          </select>
        </div></td>
    </tr>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="3"> <div align="center"> 
          <input type="submit" name="btnPower" value="确定修改" style="font-size=12;height=26">
          <input type="button" name="btnPower2" value="返 回" onclick="location.href='CompanyList.asp'" style="font-size=12;height=26">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call closers()
call CloseConn()
%>
</body>
</html>