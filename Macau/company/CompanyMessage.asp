<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../inc/function.asp"-->
<%
id=request.QueryString("id")
set rs=conn.execute("select title,content,addtime from [01387CompanyMessage] where id="&id)
conn.execute("update [01387CompanyMessage] set viewed=1 where id="&id)
%><html>
<style type="text/css">
<!--
.12 {
	font-size: 12px;
	line-height: 26px;
	color: #003399;
}
-->
</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-企业短消息</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="561" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="3"><img src="../images/jobcn_tisi_topbg.gif" width="561" height="14"></td>
  </tr>
  <tr> 
    <td width="4" background="../images/jobcn_tisi_leftbg.gif"></td>
    <td width="553" height="291" align="center" valign="top" background="../images/message.jpg"><table width="96%" border="0" align="center" cellpadding="1" cellspacing="3" class="12">
        <tr>
          <td height="56">&nbsp;</td>
        </tr>
        <tr> 
          <td><div align="center"><strong><font color="#FF0000"><%=rs(0)%></font></strong>&nbsp;&nbsp;<font face="Verdana, Arial, Helvetica, sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF3300"><%=rs(2)%></font></font></div></td>
        </tr>
        <tr> 
          <td><div align="center"><%=rs(1)%></div></td>
        </tr>
        <tr> 
          <td><div align="center"><a href="Javascript:window.close()">[关闭窗口]</a></div></td>
        </tr>
      </table>
    </td>
    <td width="4" background="../images/jobcn_tisi_rightbg.gif"></td>
  </tr>
  <tr> 
    <td colspan="3"><img src="../images/jobcn_tisi_bottombg.gif" width="561" height="10"></td>
  </tr>
</table>
</body>
</html>
