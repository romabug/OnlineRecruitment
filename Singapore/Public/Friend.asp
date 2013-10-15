<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->

<% 
Dim Param,ErroStr

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 合作伙伴</title>
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
    <td>
      <!--#include file="../Include/Header.asp" -->
      
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="160" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="25" align="left" valign="bottom" background="../Images/Public/left10_bg.jpg" style="padding-left:10px;"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>网站导航</strong></td>
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td style="BORDER-RIGHT: #D53E3E 1px solid; BORDER-LEFT: #D53E3E 1px solid;BORDER-bottom: #D53E3E 1px solid;"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="About.asp">关于我们</a> </td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Statement.asp">网站声明</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Service.asp">服务专区</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Feedback.asp">用户反馈</a> </td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Friend.asp">合作伙伴</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Link.asp">友情链接</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Contact.asp">联系我们</a> </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table></td>
                <td width="5">&nbsp;</td>
                <td align="center" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="31" height="33"><img src="../Images/mid_left_public.gif" width="31" height="33"></td>
                      <td background="../Images/mid_bg.gif" class="font-14"><strong><font color="#333333">合作伙伴</font></strong></td>
                      <td width="30"><img src="../Images/mid_right.gif" width="30" height="33"></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="5">
                    <tr> 
                      <%
		  
  Set Rs = Conn.Execute("Select LinkName,LinkUrl,LinkImgPath From [pH_FriendLink] Where State=1 And Style=1 And Class=0 And Cityid=0 Order By Ordernum Asc")
  if not rs.eof then
  j=0
  do while not rs.eof%>
                      <td height="15" align="left"> <div align="center"><a href="<%=rs("LinkUrl")%>" target="_blank"><img src="../UpLoadFiles/link/<%= Rs("LinkImgPath") %>" border="0" alt="<%= Rs("LinkName") %>" width="88" height="31"></a></div></td>
                      <%rs.movenext
j=j+1
if j mod 5 = 0 and not rs.eof then
response.write "</tr><tr>"
end if
loop
end if
rs.close%>
                    </tr>
                  </table>
                  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="5">
                    <tr> 
                      <%
		  
  Set Rs = Conn.Execute("Select LinkName,LinkUrl From [pH_FriendLink] Where State=1 And Style=0 And Class=0 And Cityid=0 Order By Ordernum Asc")
  if not rs.eof then
  j=0
  do while not rs.eof %>
                      <td height="15"><div align="center"><a href="<%=rs("LinkUrl")%>" target="_blank"><%=rs("LinkName")%></a></div></td>
                      <%rs.movenext
j=j+1
if j mod 5 = 0 and not rs.eof then
response.write "</tr><tr>"
end if
loop
end if
rs.close%>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <!--#include file="../Include/Footer.asp" -->
          </td>
        </tr>
      </table>
      </td>
  </tr>
</table>
</body>
</html>
