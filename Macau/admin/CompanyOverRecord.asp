<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"Select A.id,A.cid,A.followmen,A.followstatus,B.companyname,B.dealman,B.id,B.regtime,B.overtime from [companyover] A,[01387company] B where A.cid=B.cid order by A.id desc",1,1)
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
      <td height="25" colspan="7" background="image/admin_bg_1.gif"><div align="center"><strong><font color="#FFFFFF">所 
          有 正 式 会 员 到 期 处 理 情 况</font></strong></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28" bgcolor="#CEDBF2"><div align="center">公司</div></td>
      <td><div align="center">跟踪人</div></td>
      <td><div align="center">跟踪记录</div></td>
      <td><div align="center">跟踪状态</div></td>
      <td><div align="center">原处理人</div></td>
      <td><div align="center">注册时间</div></td>
      <td><div align="center">到期时间</div></td>
    </tr>
    <%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="31%" height="28" bgcolor="#f1f3f5"><div align="center"><a href="ShowCompany.asp?ChkNo=<%=rs(1)%>"><%=rs(4)%></a></div></td>
      <td width="13%"><div align="center"><%=rs(2)%></div></td>
      <td width="9%"><div align="center"><a href="javascript:;" onMouseDown="MM_openBrWindow('CompanyOverDeal.asp?id=<%=rs(0)%>&companyid=<%=rs(6)%>','','width=560,height=400')">查看</a></div></td>
      <td width="12%"><div align="center"><%=rs(3)%></div></td>
      <td width="9%"><div align="center"> <a href="javascript:;" onMouseDown="MM_openBrWindow('CompanyDeal.asp?id=<%=rs(6)%>','','width=560,height=400')"> 
          <%if rs(5)<>"" then
	   		response.Write(rs(5))
	   else 
	   		response.write("未处理")
		end if%>
          </a></div></td>
      <td width="13%"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=datevalue(rs(7))%></font></strong></div></td>
      <td width="13%"><div align="center"><font color="#FF0000" face="Geneva, Arial, Helvetica, sans-serif"><%=datevalue(rs(8))%>
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
<%Call PageGo("CompanyOverRecord","")%>
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