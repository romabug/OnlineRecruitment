<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim SQL,Rs,i,CompanyName,Comid
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��ҵ����</title>
</head>
<SCRIPT language=JavaScript src="../js/funlib.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ua.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/ftiens4.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/persontreeviewnodes.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/areacityselector.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/joball.js"></SCRIPT>
<script language="JavaScript">
 function login_check()
 {

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
 function search_check(){
 if (document.theForm.key.value=="������ְλ/�����ؼ���"){
  alert("-������ְλ/�����ؼ���-");
  document.theForm.key.focus();
  return false;
 }
 }
</script>

<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Header/Company_manage.asp" --></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td> <TABLE cellSpacing=0 cellPadding=0 width=760 border=0>
        <TBODY>
          <TR> 
            <TD height="6"></TD>
          </TR>
          <TR> 
            <TD  class=M><TABLE cellSpacing=0 cellPadding=0 width=650 
align=center border=0>
                <TBODY>
                  <TR> 
                    <TD width=10><IMG height=10 src="../Images/Company_Login/tab_top_left.gif" 
      width=10></TD>
                    <TD width="100%" background="../Images/Company_Login/tab_top_bg.gif"></TD>
                    <TD width=10><IMG height=10 src="../Images/Company_Login/tab_top_right.gif" 
      width=10></TD>
                  </TR>
                </TBODY>
              </TABLE>
              <table width="650" border="0" align="center" cellpadding="0" cellspacing="0" style="BORDER-RIGHT: #B2D0EA 1px solid; BORDER-LEFT: #B2D0EA 1px solid" >
                <tr> 
                  <td width="429" valign="top"><table width="429" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="150"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td><IMG src="../Images/Company_Login/ent_login_p1.jpg" 
      width=150></td>
                            </tr>
                            <tr> 
                              <td align="center"><font color="333399"><%= Cls_Webname %>��ӭ����</font></td>
                            </tr>
                          </table></td>
                        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td><IMG height=25 src="../Images/Company_Login/ent_login_p3.gif" 
            width=200></td>
                            </tr>
                            <tr> 
                              <td><TABLE cellSpacing=0 cellPadding=4 width=100% border=0>
                                  <Form action="../Public/Login.asp" method="post"  name="login" onSubmit="return login_check();">
                                    <TR> 
                                      <TD width="60" height="30" align=right class=bor-white>�û�����</TD>
                                      <TD> <input name="username" type="text" class=input-reg id="username"   style="width:120px;" size="20" > 
                                      </TD>
                                    </TR>
                                    <TR> 
                                      <TD width="60" height="30" align=right class=bor-white>�� 
                                        �룺</TD>
                                      <TD> <input name="password" type="password" class=input-reg id="password"   style="width:120px; height:18px;" size="20" > 
                                      </TD>
                                    </TR>
                                    <TR> 
                                      <TD width="60" height="30" align=right class=bor-white>�� 
                                        �ͣ�</TD>
                                      <TD> <select name="usertype"  style="width:120px; height:18px;">
                                          <option value="person">--���˻�Ա--</option>
                                          <option value="company" selected>--��ҵ��Ա--</option>
                                          <option value="school">--ԺУ��Ա--</option>
                                          <option value="educate">--��ѵ����--</option>
                                        </select></TD>
                                    </TR>
                                    <TR> 
                                      <TD width="60" height="30" align=right class=bor-white>&nbsp;</TD>
                                      <TD> <input type="submit" name="Submit" value=" ��ʼ��¼ "> 
                                        <a href="../Public/Get_Password.asp">��������</a></TD>
                                    </TR>
                                  </Form>
                                </TABLE></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="10"></td>
                      </tr>
                      <tr> 
                        <td>ע����վ��Ա�ʺŽ���Ӣ����ĸ������ ,��֧�������ʺ�;<BR>
                          ����������������ĵ�½��������&quot;��������&quot;�����һ�����;</td>
                      </tr>
                    </table></td>
                  <td width="1"><IMG height=220 
      src="../Images/Company_Login/per_login_xian.gif" width=1></td>
                  <td width="220" valign="top"> <TABLE style="MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px" cellSpacing=0 
      cellPadding=0 width=190 align=center border=0>
                      <TBODY>
                        <TR> 
                          <TD><IMG height=25 src="../Images/Company_Login/per_login_p2.gif" 
          width=190></TD>
                        </TR>
                        <TR> 
                          <TD> <UL style="MARGIN: 10px 5px 10px 25px">
                              <LI class=li_7><%= Cls_Webname %>,�Ǹ���������ְ������ƽ̨; 
                              <LI class=li_7>���ע���������ϸ������ְλ�������ȸ��Ի��Ĺ���; 
                              <LI class=li_7>ְҵָ������Ƶ��ְ,ͨ����Ƶ�豸�Ϳ��Բ�������.</LI>
                            </UL></TD>
                        </TR>
                        <TR> 
                          <TD align=middle><a href="../Company/Register.asp"><img src="../Images/Company_Login/reg_company.gif" width="134" height="29" border="0"></a></TD>
                        </TR>
                      </TBODY>
                    </TABLE></td>
                </tr>
              </table>
              <TABLE cellSpacing=0 cellPadding=0 width=650 align=center border=0>
                <TBODY>
                  <TR> 
                    <TD width=10><IMG height=10 src="../Images/Company_Login/tab_bot_left.gif" 
      width=10></TD>
                    <TD width="100%" background="../Images/Company_Login/tab_bot_bg.gif"></TD>
                    <TD width=10><IMG height=10 src="../Images/Company_Login/tab_bot_right.gif" 
      width=10></TD>
                  </TR>
                </TBODY>
              </TABLE>
              <TABLE style="MARGIN-TOP: 5px" cellSpacing=0 cellPadding=0 width=650 
align=center border=0>
                <TBODY>
                  <TR> 
                    <TD width=10><IMG height=35 src="../Images/Company_Login/per_login_tleft.gif" 
      width=190></TD>
                    <TD width="100%" background="../Images/Company_Login/per_login_tbg.gif"></TD>
                    <TD width=10><IMG height=35 src="../Images/Company_Login/per_login_tright.gif" 
      width=10></TD>
                  </TR>
                </TBODY>
              </TABLE>
              <TABLE style="BORDER-RIGHT: #B2D0EA 1px solid; BORDER-LEFT: #B2D0EA 1px solid" cellSpacing=0 cellPadding=0 width=650 align=center 
bgColor=#F1F5FA border=0>
                <TBODY>
                  <TR> 
                    <TD colSpan=5 height=7></TD>
                  </TR>
                  <TR> 
                    <TD width=20 height=23>&nbsp;</TD>
                    <TD width=15><IMG height=11 src="../Images/Company_Login/per_login_b.gif" 
      width=11></TD>
                    <TD>������Ƹ�����Է�����ҵ��Ƹְλ,ʵ��������Ƹ;</TD>
                    <TD width=15><IMG height=11 src="../Images/Company_Login/per_login_b.gif" 
      width=11></TD>
                    <TD>��Ƶ��Ƹ���ṩ������Ƶ���Ժ�¼����ҵ��Ƶ����Ƶ����;</TD>
                  </TR>
                  <TR> 
                    <TD height=23>&nbsp;</TD>
                    <TD height=20><IMG height=11 src="../Images/Company_Login/per_login_b.gif" 
      width=11></TD>
                    <TD>У԰��Ƹ��Ϊ��ҵ��Ӧ���ҵ���ṩ�˲Ž���ƽ̨;</TD>
                    <TD><IMG height=11 src="../Images/Company_Login/per_login_b.gif" width=11></TD>
                    <TD>��ͷ��������ҵ�ṩ��һ�ָ߼��˲���Ƹ����ط���;</TD>
                  </TR>
                  <TR> 
                    <TD height=23>&nbsp;</TD>
                    <TD height=20><IMG height=11 src="../Images/Company_Login/per_login_b.gif" 
      width=11></TD>
                    <TD>��ְ��Ϣ������ҵ�ṩ��ʱ��ְ��Ƹ��Ϣ��������;</TD>
                    <TD><IMG height=11 src="../Images/Company_Login/per_login_b.gif" width=11></TD>
                    <TD><SPAN class=hui12b>HR��Ѷ��</SPAN>��������Դ��ҵ��Ա�ṩ��һ����Ϣ��Ѷ����.</TD>
                  </TR>
                  <TR> 
                    <TD colSpan=5 height=7></TD>
                  </TR>
                </TBODY>
              </TABLE>
              <TABLE cellSpacing=0 cellPadding=0 width=650 align=center border=0>
                <TBODY>
                  <TR> 
                    <TD width=10><IMG height=10 src="../Images/Company_Login/per_login_bleft.gif" 
      width=10></TD>
                    <TD width="100%" background="../Images/Company_Login/per_login_bbg.gif"></TD>
                    <TD width=10><IMG height=10 src="../Images/Company_Login/per_login_bright.gif" 
      width=10></TD>
                  </TR>
                </TBODY>
              </TABLE></TD>
          </TR>
        </TBODY>
      </TABLE></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><!--#include file="../Include/Footer.asp" --></td>
  </tr>
</table>
</body>
</html>
<% 
Call CloseDB
 %>
