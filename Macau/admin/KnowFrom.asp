<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"select knowfrom from [01387company]",1,1)
dim a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,total
a1=0
a2=0
a3=0
a4=0
a5=0
a6=0
a7=0
a8=0
a9=0
a10=0
a11=0
a12=0
do while not rs.eof
  knowfrom=split(rs(0),", ")
  for i=0 to ubound(knowfrom)
    select case knowfrom(i)
	  case "��������"
      a1=a1+1
      case "��վ����"
      a2=a2+1
	  case "������"
      a3=a3+1
	  case "������־"
      a4=a4+1
	  case "��ְ�"
      a5=a5+1
	  case "�����ʼ�"
      a6=a6+1
	  case "���ѽ���"
      a7=a7+1
	  case "����ɵ�"
      a8=a8+1
	  case "�㲥��̨"
      a9=a9+1
	  case "�������"
      a10=a10+1
	  case "��������"
      a11=a11+1
	  case "����"
      a12=a12+1
    end select
  next
rs.movenext
loop
total=a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12
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
  <form name="form1" method="post" action="">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
          �� �� ֪ �� �� �� ; �� �� ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28" bgcolor="#DFE8F7"><div align="right"><strong>�� ֪ ; ��&nbsp;&nbsp;</strong></div></td>
      <td bgcolor="#f1f3f5">&nbsp; <strong><font face="Verdana, Arial, Helvetica, sans-serif">���� 
        ��ѡ��<font color="#FF0000"> <%=total%>&nbsp;</font>Ʊ</font></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#0066CC">1.��������</font>&nbsp;&nbsp;</strong></font></div></td>
      <td width="74%" bgcolor="#f1f3f5"> <div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a1%></font> Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a1/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a1/total)*100)%> height=7></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>2.��վ����&nbsp;&nbsp;</strong></font></div></td>
      <td width="74%"> <div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a2%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a2/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a2/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>3.������&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a3%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a3/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a3/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>4.������־&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a4%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a4/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a4/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>5.��ְ�&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a5%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a5/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a5/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>6.�����ʼ�&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a6%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a6/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a6/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>7.���ѽ���&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a7%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a7/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a7/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>8.����ɵ�&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a8%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a8/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a8/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>9.�㲥��̨&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a9%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a9/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a9/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>10.�������&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a10%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a10/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a10/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>11.��������&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a11%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a11/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a11/total)*100)%> height=9></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="26%" height="28" bgcolor="#DFE8F7"><div align="right"><font color="#0066CC" face="Verdana, Arial, Helvetica, sans-serif"><strong>12.����&nbsp;&nbsp;</strong></font></div></td>
      <td bgcolor="#f1f3f5"><div align="left">&nbsp;<font color="#0000FF" face="Verdana, Arial, Helvetica, sans-serif"><%=a12%></font> 
          Ʊ&nbsp;<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=round((a12/total)*100,2)%>%&nbsp;</font>&nbsp;&nbsp;<img src=../images/vote.gif width=<%=int((a12/total)*100)%> height=9></div></td>
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