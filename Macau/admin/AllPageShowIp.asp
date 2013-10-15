<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim thispage,mydate
thispage=request("thispage")
mydate=request("mydate")
Call RsName(rs,"Select ip from [01387AllPageCount] where page='"&thispage&"' and visittime='"&mydate&"' order by id desc",1,1)
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
  <form name="form1" method="post" action="AllPageCount.asp">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">全 
          站 页 面 流 量 统 计</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="31%" height="30"><div align="right">输入时间： </div></td>
      <td width="69%" height="30"><input name="mydate" type="text" class="input" id="mydate" size="30">
        <font color="#FF3300"><strong>(时间格式：<font face="Geneva, Arial, Helvetica, sans-serif">2005-9-16</font>)</strong></font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center"> 
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="确 定 查 看">
        </div></td>
    </tr>
  </form>
</table>
<!--#include file="inc/Page40.inc"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td height="25" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">访 
        问 该 页 面 所 有 IP 列 表</font></strong></div></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="30"><font face="Geneva, Arial, Helvetica, sans-serif"><strong><font color="#333333">　<strong>日期：<font color="#FF0000"><%=mydate%></font>　　被访问页面：</strong></font><strong><a href="<%=thispage%>" target=_blank><font face="Verdana, Arial, Helvetica, sans-serif"><%=thispage%></font></a></strong>　　本日本页面流量：<font color="#FF0000"><%=rs.recordcount%></font></strong></font></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="25"> <div align="center"><font color="#333333"><strong>IP</strong></font></div></td>
  </tr>
  <tr bgcolor="#f1f3f5"> 
    <td bgcolor="#f1f3f5"><div align="center">
       <table width="700" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF" class="12">
          <tr>
<%
  i=1 
  do while not rs.eof%>
            <td width="700" height="26" bgcolor="#f1f3f5"><strong><font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=rs(0)%></font></strong></td>
	<%if i mod 4=0 then%>
  </tr><tr>
  <%end if%>
  <%
i=i+1
if i>MaxPerpage then exit do  
rs.movenext
loop%>		
          </tr>
        </table>
        </div></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("AllPageShowIp","thispage="&thispage&"&mydate="&mydate&"&")%>
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