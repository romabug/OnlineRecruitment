<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=request("id")
if id="" or isnumeric(id)=false then
	Call ShowError("参数错误！")
end if
page=request("page")
Call RsName(rs,"Select company,dealman,dealresult,addtime,dealtime from [01387Feedback] where id="&id&"",1,1)
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
  <form name="form1" method="post" action="QuickDeal.asp?action=go&id=<%=id%>&page=<%=page%>">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">快 
          速 通 道 处 理 详 情</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">公司：</div></td>
      <td><strong><%=rs(0)%></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">提交时间：</div></td>
      <td><strong><font face="Verdana, Arial, Helvetica, sans-serif"><%=rs(3)%></font></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">处理人：</div></td>
      <td><%=rs(1)%></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">处理时间：</div></td>
      <td><strong><font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=rs(4)%></font></strong></td>
    </tr>
    <tr> 
      <td width="23%" height="120" bgcolor="#f1f3f5"><div align="right">处理结果：</div></td>
      <td width="77%" bgcolor="#f1f3f5"><div align="left"><%=rs(2)%></div></td>
    </tr>
    <tr> 
      <td height="26" colspan="2" bgcolor="#E6E9EC"> <div align="center"> 
          <input type="button" name="btnPower2" value="返 回" onclick="javascript:history.go(-1)">
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