<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select username,companyname from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>澳门劳工招聘网-企业招聘管理</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="inc/myaccount.js"></script>
<body>
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
        <table class='win_update_table' border='0' cellpadding='0' cellspacing='1'>
          <form name="form1" method="post" action="myaccount_save.asp">
		  <tr>
            <td colspan='2' class='win_update_table_top'>密码修改</td>
          </tr>
		    <tr>
            <td width="32%" class='win_update_table_td'>公司名称：</td>
            <td width="68%"><%=rs("companyname")%></td>
          </tr>
          <tr>
            <td class='win_update_table_td'>用 户 名：</td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif"><strong><%=rs("username")%></strong></font> </td>
          </tr>
          <tr>
            <td class='win_update_table_td'>密 &nbsp;&nbsp;&nbsp;码：</td>
            <td><input name="pwd1" type="password" class="input" id="pwd1" size="16" /></td>
          </tr>
          <tr>
            <td class='win_update_table_td'>重复密码：</td>
            <td>           <input name="pwd2" type="password" class="input" id="pwd2" size="16" /></td>
          </tr> <tr>
            <td colspan="2" align="center" ><button accessKey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" />  确认修改 </button></td>
          </tr></form> 
    </table></td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
