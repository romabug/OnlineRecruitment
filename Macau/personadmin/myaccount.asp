<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����͹���Ƹ��������ְ����</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body >
<!--#include file="top.asp"-->
<script language="JavaScript" src="inc/myaccount.js"></script>
<script type="text/javascript" src="inc/index.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
  <tr>
    <td height="22" class="win2_update_table_top">�����ʺ��������</td>
  </tr>
                    <form name="form1" method="post" action="myaccount_save.asp">
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFE2BB">
        <tr bgcolor="efefef">
          <td width="20%" height="26" align="right" class="win2_update_table_td"> �� �� ����</td>
          <td width="80%" bgcolor="#FFFFFF">&nbsp; <font face="Verdana, Arial, Helvetica, sans-serif"><strong><%=rs("username")%></strong></font></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="26" align="right" class="win2_update_table_td"> �ܡ����룺</td>
          <td>&nbsp;
              <input name="pwd1" type="password" class="input" id="pwd1" size="16" />
          </td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="26" align="right" class="win2_update_table_td"> �ظ����룺</td>
          <td>&nbsp;
              <input name="pwd2" type="password" class="input" id="pwd2" size="16" />
          </td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="26" align="right" class="win2_update_table_td"> �ʡ����䣺</td>
          <td>&nbsp;
 <input name="email" type="text" class="input" id="email" value="<%=rs("email")%>" size="26" maxlength="50" onKeyPress="return regInput(this,'mail');" onpaste="return regInput(this,'mail',true);">
                          <input name="Submit22" type="button" class="button" value="�������" onClick="check_email()"> 
          </td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="52" colspan="2"><table width="96%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="17%">&nbsp;</td>
              <td width="83%">&nbsp;
                <button accesskey="K" type="submit" onclick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> ȷ�Ϸ���</button></td>
              </tr>
          </table></td>
        </tr>
      </table>
        </td>
    </tr>
  </form>
</table></td>
  </tr>
</table>
<form name=previewemail action=inc/chkemail_modify.asp method=post target=preview_page>
<input type=hidden name=email value=>
</form>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
