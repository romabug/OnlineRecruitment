<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="../Include/Class_Main.asp" -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%= Cls_WebName %> -- 管理中心 登陆平台</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function theForm_chk(){
if (document.theForm.UserName.value==""){
 alert("-请输入管理用户名-");
 document.theForm.UserName.focus();
 return false;
}
if (document.theForm.Password.value==""){
 alert("-请输入管理密码-");
 document.theForm.Password.focus();
 return false;
}
if (document.theForm.code.value==""){
 alert("-请输入验证码-");
 document.theForm.code.focus();
 return false;
}
}
</script>
<body leftmargin="0" topmargin="0" bgcolor="#002779">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr> 
    <td valign="middle" align="center"> <table width="460" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="images/login_1.jpg" width="190" height="23"></td>
        </tr>
      </table>
      <table width="460" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="images/login_2.jpg" width="460" height="142"></td>
        </tr>
      </table>
      <table width="460" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td bgcolor="#EEEEEE" height="6"></td>
        </tr>
      </table>
      <table width="460" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="120" bgcolor="#FFFFFF" align="center"><table width="300" border="0" align="center" cellPadding="0" cellSpacing="0" bordercolor="#111111" class="text01" style="border-collapse: collapse">
              <FORM name=theForm method=post action="Web_Loginchk.asp" onSubmit="return theForm_chk();">
                <tr> 
                  <td> <img alt border="0" height="1" src="images/spacer.gif" width="97"></td>
                  <td> <img alt border="0" height="1" src="images/spacer.gif" width="60"></td>
                </tr>
                <tr> 
                  <td width="18%" height="25" align="right">用户名<span style="font-size: 12px">：</span></td>
                  <td> <span style="FONT-SIZE: 12px"> 
                    <input name="UserName" size="13" style="width:140px;" tabIndex="1">
                    </span> </td>
                </tr>
                <tr> 
                  <td width="18%" height="25" align="right">密&nbsp;&nbsp;码<span style="font-size: 12px">：</span> 
                  </td>
                  <td> <span style="FONT-SIZE: 12px"> 
                    <input name="Password" size="13" style="width:140px;" tabIndex="1" type="password">
                    </span> </td>
                </tr>
                <tr> 
                  <td width="18%" height="25" align="right">验证码：</td>
                  <td><input name="code" type="text" id="code" size="13" style="width:95px;"> 
                    <img src="../Include/Class_Code.asp"> </td>
                </tr>
                <tr align="center"> 
                  <td height="25">&nbsp; </td>
                  <td height="25" align="left"><input name="imageField" type="image" src="Images/bt_login.gif" width="70" height="16" border="0">
                    <img src="Images/bt_reset.gif" width="70" height="16" onClick="javascript:history.back(-1);"> </td>
                </tr>
              </form>
            </table> </td>
        </tr>
      </table>
      <table width="460" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
        <tr> 
          <td><img src="images/login_3.gif" width="10" height="10"></td>
          <td align="right"><img src="images/login_4.gif" width="10" height="10"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>

