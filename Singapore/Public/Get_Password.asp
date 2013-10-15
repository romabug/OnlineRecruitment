<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 找回密码</title>
</head>
<script language="JavaScript">
 function check_reg(){
 if (document.reg.username.value==""){
  alert("-请输入用户名-");
  document.reg.username.focus();
  return false;
 }

 }

</script>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Include/Header.asp" -->
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="50%" height="75" valign="bottom"><img src="../Images/password.gif" width="292" height="67"></td>
                <td width="50%" valign="bottom"><img src="../Images/reg1_2.gif" width="380" height="54"></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td><hr size="1" color="#f1b5a1"></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td> <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <form action="Get_Password2.asp" name="reg" method="POST"  onSubmit="return check_reg();">
                <tr> 
                  <td height="30"><FONT color=#cc0000><STRONG 
            class=font14b>第一步 确认帐号</STRONG></FONT>（说明：确认您在网站会员名和类型）</td>
                </tr>
                <tr> 
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#f1b5a1">
                      <tr> 
                        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="100" height="30" align="right"><font color="#FF0000">*</font> 
                                用户名称：</td>
                              <td width="220" height="30"> <input name="username" type="text" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> </font><font color="#999999"> 
                                </font></font></font></font></font><font color="#999999">(英文字母、数字或下划线，4~20个字符)</font><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font></font></font></font></font></td>
                            </tr>
                            <tr> 
                              <td width="100" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                                会员类型：</td>
                              <td width="220" height="30" bgcolor="#fff7f0"><select name="usertype" style="width:120px;">
                                  <option value="person" selected>--个人会员--</option>
                                  <option value="company">--企业会员--</option>
								  <option value="intro">--中介会员--</option>
                                  <option value="school">--院校会员--</option>
                                  <option value="educate">--培训机构--</option>
                                </select> </td>
                              <td height="30" bgcolor="#fff7f0">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td align="center">&nbsp;</td>
                </tr>
                <tr> 
                  <td align="center"> <input type="submit" name="Submit" value="确 认 提 交" style="height:30px;"> 
                  </td>
                </tr>
              </Form>
            </table></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table> 
      <!--#include file="../Include/Footer.asp" -->
    </td>
  </tr>
</table>
</body>
</html>
