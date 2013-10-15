<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="inc/ShowMenu.js"></script>
<body bgcolor="#799ae1" leftmargin="0" topmargin="5" marginwidth="0" marginheight="0" scroll=yes>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="image/title.gif" width="158" height="38"></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/title_bg_quit.gif"><table width="80%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><a href="main.asp" target="mainFrame"><strong>管理首页</strong></a> <strong>|</strong> 
              <a href="logout.asp" target="_parent"><strong>退出</strong></a></div>
            </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/admin_left_3.gif" onclick=showsubmenu(2)><table width="68%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><strong><font color="#0033CC">企业会员管理</font></strong></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="25" id=submenu2><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
        <tr> 
          <td height="5" colspan="2"> </td>
        </tr>
        <tr> 
          <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td width="79%"><a href="CompanyList.asp" target="mainFrame">企业会员列表</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="CompanyOvertime.asp" target="mainFrame">会员到期情况</a></td>
        </tr>
      </table>
      <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="10"> </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="158" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="25" background="image/admin_left_5.gif" onclick=showsubmenu(4)><table width="51%" border="0" cellpadding="0" cellspacing="0" class="12">
        <tr> 
          <td><div align="center"><strong><font color="#0033CC">系统管理</font></strong></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="25" id=submenu4><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d6dff7" class="t1">
        <tr> 
          <td height="5" colspan="2"> </td>
        </tr>
        <tr> 
          <td width="21%" height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td width="79%"><a href="IpCount.asp" target="mainFrame">首页IP访问统计</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="NewPageCount.asp" target="mainFrame">页面流量统计</a></td>
        </tr>
        <tr> 
          <td height="24"><div align="center"><img src="image/bullet.gif" width="15" height="20"></div></td>
          <td><a href="ChangePwd.asp" target="mainFrame">密码修改</a></td>
        </tr>
      </table>
      <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="10"> </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
