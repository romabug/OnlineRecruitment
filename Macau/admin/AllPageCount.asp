<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim mydate
mydate=request("mydate")
if request("mydate")<>"" then
Call RsName(rs,"Select count(id),page from [01387AllPageCount] where visittime='"&mydate&"' group by page order by count(id) desc",1,1)
Call RsName(rs1,"Select count(id) from [01387AllPageCount] where visittime='"&mydate&"'",1,1)
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
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">ȫ 
          վ ҳ �� �� �� ͳ ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="31%" height="30"><div align="right">����ʱ�䣺 </div></td>
      <td width="69%" height="30"><input name="mydate" type="text" class="input" id="mydate" value="<%=date()%>" size="30"> 
        <font color="#FF3300"><strong>(ʱ���ʽ��<font face="Geneva, Arial, Helvetica, sans-serif">2005-9-16</font>)</strong></font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center"> 
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="ȷ �� �� ��">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5">
      <td height="26" colspan="2"><div align="center"><strong><font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif">2005��ÿ��ҳ������ͳ������ͼ</font><font face="Verdana, Arial, Helvetica, sans-serif">����<a href="AllPageMonth.asp?myyear=2005&mymonth=9">9��</a>��<a href="AllPageMonth.asp?myyear=2005&mymonth=10">10��</a>��<a href="AllPageMonth.asp?myyear=2005&mymonth=11">11��</a>��<a href="AllPageMonth.asp?myyear=2005&mymonth=12">12��</a></font></strong></div></td>
    </tr>
  </form>
</table>
<%
else
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
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
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">ȫ 
          վ ҳ �� �� �� ͳ ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="31%" height="30"><div align="right">����ʱ�䣺 </div></td>
      <td width="69%" height="30"><input name="mydate" type="text" class="input" id="mydate" value="<%=date()%>" size="30"> 
        <font color="#FF3300"><strong>(ʱ���ʽ��<font face="Geneva, Arial, Helvetica, sans-serif">2005-9-16</font>)</strong></font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center"> 
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="ȷ �� �� ��">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5">
      <td height="26" colspan="2"><div align="center"><strong><font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif">2005��ÿ��ҳ������ͳ������ͼ</font><font face="Verdana, Arial, Helvetica, sans-serif">����<a href="AllPageMonth.asp?myyear=2005&mymonth=9">9��</a>��<a href="AllPageMonth.asp?myyear=2005&mymonth=10">10��</a>��<a href="AllPageMonth.asp?myyear=2005&mymonth=11">11��</a>��<a href="AllPageMonth.asp?myyear=2005&mymonth=12">12��</a></font></strong></div></td>
    </tr>
  </form>
</table>
<%
response.end()
end if
%>
<!--#include file="inc/Page15.inc"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td height="25" colspan="3" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">ȫ 
        վ ҳ �� �� �� ͳ �� �� �� </font></strong></div></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="30" colspan="3"><strong><font color="#333333">���鿴����ʱ�䣺</font><font color="#FF0000" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=mydate%></strong></font>��������ҳ����������<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=rs1(0)%></font></strong></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="25"> <div align="center"><font color="#333333"><strong>���ʴ���</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>������ҳ��</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>���ʸ�ҳ������IP</strong></font></div></td>
  </tr>
  <%
  i=1 
  do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="21%" height="30"><div align="center"><strong><font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=rs(0)%></font></strong></div></td>
    <td width="62%"><div align="center"><font color="#0033CC" face="Verdana, Arial, Helvetica, sans-serif"> 
        <%if rs(1)="self" then response.Write("ֱ��������ַ") else response.write("<a href='"&rs(1)&"' target=_blank>"&rs(1)&"</a>")%>
        </font></div></td>
    <td width="17%"><div align="center">
	<a href="AllPageShowIp.asp?thispage=<%=rs(1)%>&mydate=<%=mydate%>">�鿴</a></div></td>
  </tr>
  <%
i=i+1
if i>MaxPerpage then exit do  
rs.movenext
loop%>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("AllPageCount","mydate="&mydate&"&")%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call CloseRs()
rs1.close
set rs1=nothing
call CloseConn()
%>
</body>
</html>