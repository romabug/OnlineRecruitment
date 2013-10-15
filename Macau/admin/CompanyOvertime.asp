<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
if request("power")="" then
Call RsName(rs,"Select cid,username,companyname,legal,tel,famous,power,regtime,overtime,powertime,dealman,id from [01387company] where power<>1 and power<>0 and powertime<>1 and overtime<'"&dateadd("m",1,date())&"' order by overtime asc,id desc",1,1)
else
Call RsName(rs,"Select cid,username,companyname,legal,tel,famous,power,regtime,overtime,powertime,dealman,id from [01387company] where power="&request("power")&" and powertime<>1 and overtime<'"&dateadd("m",1,date())&"' order by overtime asc, id desc",1,1)
end if
%>
<!--#include file="inc/Page15.inc"-->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<script language=jscript>
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnShow")
		{form1.action="ShowCompany.asp";form1.submit();}
	else if (btnClicked.name=="btnFamous")
		{form1.action="ModifyComFamous.asp";form1.submit();}
	else if (btnClicked.name=="btnPower")
		{form1.action="ModifyComPower.asp";form1.submit();}
	else
		{form1.action="DelCompany.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="">
    <tr> 
      <td height="25" colspan="9" background="image/admin_bg_1.gif"><div align="center"><strong><font color="#FFFFFF">最 
          近 一 个 月 到 期 会 员</font></strong></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28"><div align="center">用户名</div></td>
      <td bgcolor="#CEDBF2"><div align="center">公司</div></td>
      <td><div align="center">法人</div></td>
      <td><div align="center">电话</div></td>
      <td><div align="center">知名企业</div></td>
      <td><div align="center">会员等级</div></td>
      <td><div align="center">处理人</div></td>
      <td><div align="center">注册时间</div></td>
      <td><div align="center">到期时间</div></td>
    </tr>
    <%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="10%" height="28"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><a href="ShowCompany.asp?ChkNo=<%=rs(0)%>"><U><%=rs(1)%></U></a></font></strong></div></td>
      <td width="22%" bgcolor="#f1f3f5"><div align="center"><a href="ShowCompany.asp?ChkNo=<%=rs(0)%>"><%=rs(2)%></a></div></td>
      <td width="8%"><div align="center"><%=rs(3)%></div></td>
      <td width="17%"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(4)%></font></strong></div></td>
      <td width="7%"><div align="center"> 
          <%
dim famous
Select Case rs(5)
Case true
famous="<font color=red>是</font>"
Case false
famous="<font color=blue>否</font>"
End Select
%>
          <%=famous%></div></td>
      <td width="10%"><div align="center"> 
          <%
dim power
Select Case rs(6)
Case 1
power="<a href='CompanyOvertime.asp?Power=1'>普通会员</a>"
Case 2
power="<a href='CompanyOvertime.asp?Power=2'><font color=blue>正式会员</font></a>"
Case 3
power="<a href='CompanyOvertime.asp?Power=3'><font color=green>VIP会员</font></a>"
Case 4
power="<a href='CompanyOvertime.asp?Power=4'><font color=red>重点推荐</font></a>"
End Select
%>
          <%=power%></div></td>
      <td width="7%"><div align="center"> <a href="javascript:;" onMouseDown="MM_openBrWindow('CompanyDeal.asp?id=<%=rs(11)%>','','width=560,height=400')"> 
          <%if rs(10)<>"" then
	   		response.Write(rs(10))
	   else 
	   		response.write("未处理")
		end if%>
          </a></div></td>
      <td width="11%"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=datevalue(rs(7))%></font></strong></div></td>
      <td width="10%"><div align="center"><font color="#FF0000" face="Geneva, Arial, Helvetica, sans-serif"> 
          <%if rs(9)=1 then response.Write("永久会员") else response.write("<b>"&datevalue(rs(8))&"</b>")%>
          </font></div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("CompanyOvertime","power="&request("power")&"&")%>
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