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
<title><%= Cls_WebName %> -- 企业服务</title>
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
 function search_check(){
 if (document.theForm.key.value=="请输入职位/姓名关键字"){
  alert("-请输入职位/姓名关键字-");
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
                              <td align="center"><font color="333399"><%= Cls_Webname %>欢迎您！</font></td>
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
                                      <TD width="60" height="30" align=right class=bor-white>用户名：</TD>
                                      <TD> <input name="username" type="text" class=input-reg id="username"   style="width:120px;" size="20" > 
                                      </TD>
                                    </TR>
                                    <TR> 
                                      <TD width="60" height="30" align=right class=bor-white>密 
                                        码：</TD>
                                      <TD> <input name="password" type="password" class=input-reg id="password"   style="width:120px; height:18px;" size="20" > 
                                      </TD>
                                    </TR>
                                    <TR> 
                                      <TD width="60" height="30" align=right class=bor-white>类 
                                        型：</TD>
                                      <TD> <select name="usertype"  style="width:120px; height:18px;">
                                          <option value="person">--个人会员--</option>
                                          <option value="company" selected>--企业会员--</option>
                                          <option value="school">--院校会员--</option>
                                          <option value="educate">--培训机构--</option>
                                        </select></TD>
                                    </TR>
                                    <TR> 
                                      <TD width="60" height="30" align=right class=bor-white>&nbsp;</TD>
                                      <TD> <input type="submit" name="Submit" value=" 开始登录 "> 
                                        <a href="../Public/Get_Password.asp">忘记密码</a></TD>
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
                        <td>注：网站会员帐号仅限英文字母和数字 ,不支持中文帐号;<BR>
                          　　如果您忘记您的登陆密码请点击&quot;忘记密码&quot;连接找回密码;</td>
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
                              <LI class=li_7><%= Cls_Webname %>,是个人理想求职的网络平台; 
                              <LI class=li_7>免费注册简历、详细搜索、职位搜索器等个性化的功能; 
                              <LI class=li_7>职业指导、视频求职,通过视频设备就可以参与面试.</LI>
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
                    <TD>网络招聘：可以发布企业招聘职位,实现在线招聘;</TD>
                    <TD width=15><IMG height=11 src="../Images/Company_Login/per_login_b.gif" 
      width=11></TD>
                    <TD>视频招聘：提供在线视频面试和录制企业视频等视频服务;</TD>
                  </TR>
                  <TR> 
                    <TD height=23>&nbsp;</TD>
                    <TD height=20><IMG height=11 src="../Images/Company_Login/per_login_b.gif" 
      width=11></TD>
                    <TD>校园招聘：为企业和应届毕业生提供人才交流平台;</TD>
                    <TD><IMG height=11 src="../Images/Company_Login/per_login_b.gif" width=11></TD>
                    <TD>猎头服务：向企业提供的一种高级人才招聘等相关服务;</TD>
                  </TR>
                  <TR> 
                    <TD height=23>&nbsp;</TD>
                    <TD height=20><IMG height=11 src="../Images/Company_Login/per_login_b.gif" 
      width=11></TD>
                    <TD>兼职信息：向企业提供临时兼职招聘信息发布服务;</TD>
                    <TD><IMG height=11 src="../Images/Company_Login/per_login_b.gif" width=11></TD>
                    <TD><SPAN class=hui12b>HR资讯：</SPAN>向人力资源从业人员提供的一种信息资讯服务.</TD>
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
