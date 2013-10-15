<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Conn.asp" -->
<% 
Dim Prevurl
Prevurl = "../Educate/Demand_Add.asp"
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 会员登录</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<script language="JavaScript">
 function login_check(){
 if (document.login.username.value==""){
  alert("-请输入用户名-");
  document.login.username.focus();
  return false;
 }
  if (document.login.password.value==""){
  alert("-请输入登陆密码-");
  document.login.password.focus();
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
          <td><TABLE cellSpacing=0 cellPadding=0 width=750 border=0>
              <TBODY>
                <TR> 
                  <TD class=M>&nbsp;</TD>
                </TR>
                <TR> 
                  <TD height="30" class=M><IMG height=16 src="../Images/icon_attion_16.gif"  width=16 align=absMiddle> 
                    <span style="color: #CC6633"><FONT style="FONT-WEIGHT: bold; FONT-SIZE: 16px">请选择您所要进行的操作.</FONT></span></TD>
                </TR>
              </TBODY>
            </TABLE></td>
        </tr>
        <tr> 
          <td><hr size="1"  color="#CCCCCC"></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td><TABLE width=704 border=0 align="center" cellPadding=0 cellSpacing=0>
              <TBODY>
                <TR> 
                  <TD width=368 align=right valign="top"> <TABLE cellSpacing=0 cellPadding=0 width=352 border=0>
                      <TBODY>
                        <TR> 
                          <TD width="352"><IMG height=26 src="../Images/signin_01.gif" 
          width=352></TD>
                        </TR>
                        <TR> 
                          <TD height=161 align="center" background=../Images/signin_02.gif><table width="90%" border="0" cellspacing="0" cellpadding="0">
                              <tr> 
                                <td><div align="center">请选择好会员类型，方可正常登陆</div></td>
                              </tr>
                            </table>
                            <TABLE cellSpacing=0 cellPadding=4 width=90% border=0>
                              <Form action="Login.asp" method="post"  name="login" onSubmit="return login_check();">
                                <TR> 
                                  <TD width="80" height="30" align=right class=bor-white>用户名：</TD>
                                  <TD> <input name="username" type="text" class=input-reg id="username"   style="width:120px;" size="20" > 
                                  </TD>
                                </TR>
                                <TR> 
                                  <TD width="80" height="30" align=right class=bor-white>密 
                                    码：</TD>
                                  <TD> <input name="password" type="password" class=input-reg id="password"   style="width:120px; height:18px;" size="20" > 
                                    <a href="Get_Password.asp">忘记密码</a>？ </TD>
                                </TR>
                                <TR> 
                                  <TD width="80" height="30" align=right class=bor-white>类 
                                    型：</TD>
                                  <TD> <select name="usertype"  style="width:120px; height:18px;">
                                      <option value="person" selected>--个人会员--</option>
                                      <option value="company">--企业会员--</option>
                                      <option value="intro">--中介会员--</option>
                                      <option value="educate">--培训机构--</option>
                               
                                    </select></TD>
                                </TR>
                                <TR> 
                                  <TD width="80" height="30" align=right class=bor-white>&nbsp;</TD>
                                  <TD> <input type="submit" name="Submit" value=" 开始登录 "></TD>
                                </TR>
                              </Form>
                            </TABLE></TD>
                        </TR>
                      </TBODY>
                    </TABLE></TD>
                  <TD width=28>&nbsp;</TD>
                  <TD width=340 valign="top"> <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                      <TBODY>
                        <TR> 
                          <TD height="25" valign="top"><FONT style="FONT-WEIGHT: bold; FONT-SIZE: 14px" 
       color="#FF0000">还不是会员，请注册！</Font></TD>
                        </TR>
                        <TR>
                          <TD>&nbsp;</TD>
                        </TR>
                        <TR> 
                          <TD><img src="../images/dot_02.jpg"> <strong><a href="../Person/Register.asp" class="STYLE1" >新加坡劳务人员登记</a></strong></TD>
                        </TR>
                        <TR> 
                          <TD><font color="#999999">注册成为<%= Cls_WebName %>个人会员，轻松求职，方便快捷...</font></TD>
                        </TR>
                        <TR> 
                          <TD><hr size="1" color="#FFCC99"></TD>
                        </TR>
                        
                        <TR> 
                          <TD><img src="../images/dot_02.jpg"> <strong><a href="../Company/Register.asp" class="STYLE1"  >新加坡雇主招聘登记</a></strong></TD>
                        </TR>
                        <TR> 
                          <TD><font color="#999999">注册成为<%= Cls_WebName %>企业会员，满意招聘所需人才...</font></TD>
                        </TR>
                        <TR> 
                          <TD><hr size="1"  color="#99CCFF"></TD>
                        </TR>
                        <TR> 
                          <TD>&nbsp;</TD>
                        </TR>
                        <TR> 
                          <TD><font color="#999999">.</font></TD>
                        </TR>
                        <TR> 
                          <TD> </TD>
                        </TR>
                        <TR> 
                          <TD><img src="../images/dot_02.jpg"> <strong><a href="../Intro/Register.asp">劳务中介登记</a></strong></TD>
                        </TR>
                        <TR> 
                          <TD><font color="#999999">快速</font><font color="#999999">注册成为<%= Cls_WebName %>中介机构用户..</font></TD>
                        </TR>
                        <TR> 
                          <TD><hr size="1" color="#FFCC99"></TD>
                        </TR>
                        
                        <TR> 
                          <TD><img src="../images/dot_02.jpg"> <strong><a href="../Educate/Register.asp">培训机构、院校登记</a></strong></TD>
                        </TR>
                        <TR> 
                          <TD><font color="#999999">快速</font><font color="#999999">注册成为<%= Cls_WebName %>培训机构用户.</font></TD>
                        </TR>
                        <TR> 
                          <TD><hr size="1"  color="#99CCFF"></TD>
                        </TR>
                      </TBODY>
                    </TABLE></TD>
                </TR>
              </TBODY>
            </TABLE></td>
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
