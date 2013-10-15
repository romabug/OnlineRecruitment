<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"select pid,title,contacter,tel,addtime,passok from [01387PartTime] order by id desc",1,1)
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
		{form1.action="FreeJobGo.asp";form1.submit();}
	else
		{form1.action="DelFreeJob.asp";form1.submit();}
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
      <td height="25" colspan="6" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">自 
          由 兼 职 信 息 列 表</font></strong></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28"><div align="center"><font color="#000000"><font color="#333333">标题</font></font></div></td>
      <td bgcolor="#CEDBF2"><div align="center"><font color="#333333">联系人</font></div></td>
      <td><div align="center"><font color="#333333">电话</font></div></td>
      <td><div align="center"><font color="#333333">发布日期</font></div></td>
      <td><div align="center">状态</div></td>
      <td><div align="center">操作</div></td>
    </tr>
    <%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="34%" height="28"><div align="center"><a href="javascript:;" onMouseDown="MM_openBrWindow('../PartTime/ShowInfo.asp?pid=<%=rs(0)%>','','scrollbars=yes,width=520,height=436')"> 
          <%if len(rs(1))>14 then response.write(left(rs(1),14)&"...")else response.write(rs(1))%>
          </a></div></td>
      <td width="12%" bgcolor="#f1f3f5"><div align="center"><a href="javascript:;" onMouseDown="MM_openBrWindow('ShowInfo.asp?pid=<%=rs(0)%>','','scrollbars=yes,width=520,height=436')"><%=rs(2)%></a></div></td>
      <td width="23%"><div align="center"> <font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(3)%></font> </div></td>
      <td width="13%"> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><strong> 
          </strong><%=rs(4)%><strong> </strong></font></div></td>
      <td width="11%"><div align="center">
	  <%
	  select case rs(5)
	  case true
	  response.Write("<font color=red>审核通过</font>")
	  case false
	  response.write("<font color=blue>未审核</font>")
	  end select
	  %>
	  </div></td>
      <td width="7%"><div align="center">
          <input type="radio" name="pid" value="<%=rs(0)%>">
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="6"> <div align="right"> 
          <input type="button" name="btnShow" value="审核通过" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
          <input type="button" name="btnDel" value="删除所选信息(慎用)" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("FreeList","")%>
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