<html>
<head>
<title>MACAU69管理登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCCCCC" background="../images/bg2.gif">
<p>&nbsp;</p><p>&nbsp;</p><table width="400" height="238" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.gif">
  <tr>
    <td width="100%" ><form name="form1" action="check.asp" method=post>
      <p>&nbsp;</p><TABLE width=387 height="208" border=0 align=center cellPadding=2 cellSpacing=4 bordercolor="#CCCCCC" bgcolor="#FFFFFF" class=main>
        <TR align="right">
            <TD colSpan=2 align="center" bgcolor="#ffffff" class=menu><div align="center"> 
                <strong><font color="#666666" size="5">labor access<br>
                </font></strong></div></TD>
        </TR>
        <TR>
            <TD height="25" align="right"><strong>用户名：</strong></TD>
          <TD><INPUT class=input maxLength=50 name=username></TD>
        </TR>
        <TR>
            <TD height="25" align="right"><strong>密　码：</strong></TD>
          <TD><INPUT class=input type=password maxLength=50 name=password></TD>
        </TR>
        <TR>
            <TD height="25" align="right"><strong>验证码：</strong></TD>
          <td><input name=verifycode type=text class="input" value="<%If GetCode=9999 Then Response.Write "9999"%>" size="5" maxlength="50">
            &nbsp;请在验证码框输入 <img src="../company/getcode.asp"></td>
        </TR>
        <TR>
          <TD colSpan=2 align="center"><INPUT name="submit" type=submit class=botton value=用户登录>
&nbsp;&nbsp;&nbsp;&nbsp;
<INPUT name="reset" type=reset class=botton value=刷新重写></TD>
        </TR>
      </TABLE>
    </form></td>
  </tr>
</table>
</body>
</html>
