<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select username,companyname from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

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
            <td colspan='2' class='win_update_table_top'>�����޸�</td>
          </tr>
		    <tr>
            <td width="32%" class='win_update_table_td'>��˾���ƣ�</td>
            <td width="68%"><%=rs("companyname")%></td>
          </tr>
          <tr>
            <td class='win_update_table_td'>�� �� ����</td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif"><strong><%=rs("username")%></strong></font> </td>
          </tr>
          <tr>
            <td class='win_update_table_td'>�� &nbsp;&nbsp;&nbsp;�룺</td>
            <td><input name="pwd1" type="password" class="input" id="pwd1" size="16" /></td>
          </tr>
          <tr>
            <td class='win_update_table_td'>�ظ����룺</td>
            <td>           <input name="pwd2" type="password" class="input" id="pwd2" size="16" /></td>
          </tr> <tr>
            <td colspan="2" align="center" ><button accessKey="K" type="submit" onClick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" />  ȷ���޸� </button></td>
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
