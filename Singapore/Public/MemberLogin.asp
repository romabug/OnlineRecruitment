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
<title><%= Cls_WebName %> -- ��Ա��¼</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<script language="JavaScript">
 function login_check(){
 if (document.login.username.value==""){
  alert("-�������û���-");
  document.login.username.focus();
  return false;
 }
  if (document.login.password.value==""){
  alert("-�������½����-");
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
                    <span style="color: #CC6633"><FONT style="FONT-WEIGHT: bold; FONT-SIZE: 16px">��ѡ������Ҫ���еĲ���.</FONT></span></TD>
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
                                <td><div align="center">��ѡ��û�Ա���ͣ�����������½</div></td>
                              </tr>
                            </table>
                            <TABLE cellSpacing=0 cellPadding=4 width=90% border=0>
                              <Form action="Login.asp" method="post"  name="login" onSubmit="return login_check();">
                                <TR> 
                                  <TD width="80" height="30" align=right class=bor-white>�û�����</TD>
                                  <TD> <input name="username" type="text" class=input-reg id="username"   style="width:120px;" size="20" > 
                                  </TD>
                                </TR>
                                <TR> 
                                  <TD width="80" height="30" align=right class=bor-white>�� 
                                    �룺</TD>
                                  <TD> <input name="password" type="password" class=input-reg id="password"   style="width:120px; height:18px;" size="20" > 
                                    <a href="Get_Password.asp">��������</a>�� </TD>
                                </TR>
                                <TR> 
                                  <TD width="80" height="30" align=right class=bor-white>�� 
                                    �ͣ�</TD>
                                  <TD> <select name="usertype"  style="width:120px; height:18px;">
                                      <option value="person" selected>--���˻�Ա--</option>
                                      <option value="company">--��ҵ��Ա--</option>
                                      <option value="intro">--�н��Ա--</option>
                                      <option value="educate">--��ѵ����--</option>
                               
                                    </select></TD>
                                </TR>
                                <TR> 
                                  <TD width="80" height="30" align=right class=bor-white>&nbsp;</TD>
                                  <TD> <input type="submit" name="Submit" value=" ��ʼ��¼ "></TD>
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
       color="#FF0000">�����ǻ�Ա����ע�ᣡ</Font></TD>
                        </TR>
                        <TR>
                          <TD>&nbsp;</TD>
                        </TR>
                        <TR> 
                          <TD><img src="../images/dot_02.jpg"> <strong><a href="../Person/Register.asp" class="STYLE1" >�¼���������Ա�Ǽ�</a></strong></TD>
                        </TR>
                        <TR> 
                          <TD><font color="#999999">ע���Ϊ<%= Cls_WebName %>���˻�Ա��������ְ��������...</font></TD>
                        </TR>
                        <TR> 
                          <TD><hr size="1" color="#FFCC99"></TD>
                        </TR>
                        
                        <TR> 
                          <TD><img src="../images/dot_02.jpg"> <strong><a href="../Company/Register.asp" class="STYLE1"  >�¼��¹�����Ƹ�Ǽ�</a></strong></TD>
                        </TR>
                        <TR> 
                          <TD><font color="#999999">ע���Ϊ<%= Cls_WebName %>��ҵ��Ա��������Ƹ�����˲�...</font></TD>
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
                          <TD><img src="../images/dot_02.jpg"> <strong><a href="../Intro/Register.asp">�����н�Ǽ�</a></strong></TD>
                        </TR>
                        <TR> 
                          <TD><font color="#999999">����</font><font color="#999999">ע���Ϊ<%= Cls_WebName %>�н�����û�..</font></TD>
                        </TR>
                        <TR> 
                          <TD><hr size="1" color="#FFCC99"></TD>
                        </TR>
                        
                        <TR> 
                          <TD><img src="../images/dot_02.jpg"> <strong><a href="../Educate/Register.asp">��ѵ������ԺУ�Ǽ�</a></strong></TD>
                        </TR>
                        <TR> 
                          <TD><font color="#999999">����</font><font color="#999999">ע���Ϊ<%= Cls_WebName %>��ѵ�����û�.</font></TD>
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
