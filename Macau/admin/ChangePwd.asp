<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"Select id,username from [01387lch_admin] where username='"&request.cookies("01387job")("superlogin")&"'",1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<script language="JavaScript">
function check()
{
   if(document.form1.pwd1.value=="")
   	{   alert ("请输入新密码！");
		document.form1.pwd1.focus();
		return false;
	}
   if (document.form1.pwd1.value!=document.form1.pwd2.value)
	{
		alert ("两次密码输入不相同，请重新输入！");
		document.form1.pwd1.value='';    
		document.form1.pwd2.value='';
		document.form1.pwd1.focus();
		return false;
	}
  }
</script>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="ChangePwd_save.asp">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">新 
          增 管 理 员</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="40%" height="30"><div align="right">用户名：</div></td>
      <td width="60%"><font color="#FF0000" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs(1)%></strong></font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30"><div align="right">密码： </div></td>
      <td height="30"><input name="pwd1" type="password" class="input" id="pwd1" size="30">
        <font color="#FF3300">&nbsp;</font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30"><div align="right">确认密码： </div></td>
      <td height="30"><input name="pwd2" type="password" class="input" id="pwd2" size="30">
        <font color="#FF3300">&nbsp;</font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center">
          <input name="id" type="hidden" id="id" value="<%=rs(0)%>">
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="确 定 修 改" onClick="return check()">
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
call CloseRs()
call CloseConn()
%>
</body>
</html>