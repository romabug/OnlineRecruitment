<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Username,Usertype
Username = Replace_Text(Request.Form("Username"))
Usertype = Replace_Text(Request.Form("Usertype"))

Select Case UserType
 Case "person"
  SQL = "Select Username,Question From [pH_Person_Base] Where UserName='"&Username&"'"
  Set Rs = Conn.Execute(SQL)
  If Rs.Eof Then
   Response.Redirect "Error.asp?Param=2004"
   Response.End()
  End if
  Questions = Rs("Question")
 Case "company" 
  SQL = "Select Username,Question From [pH_Company_Base] Where UserName='"&Username&"'"
  Set Rs = Conn.Execute(SQL)
  If Rs.Eof Then
   Response.Redirect "Error.asp?Param=2004"
   Response.End()
  End if
  Questions = Rs(1)
 Case "school" 
  SQL = "Select Username,Question From [pH_School_Base] Where UserName='"&Username&"'"
  Set Rs = Conn.Execute(SQL)
  If Rs.Eof Then
   Response.Redirect "Error.asp?Param=2004"
   Response.End()
  End if
  Questions = Rs(1)
 Case "educate"
  SQL = "Select Username,Question From [pH_Educate_Base] Where UserName='"&Username&"'"
  Set Rs = Conn.Execute(SQL)
  If Rs.Eof Then
   Response.Redirect "Error.asp?Param=2004"
   Response.End()
  End if
  Questions = Rs(1)
 Case "intro"
  SQL = "Select Username,Question From [pH_Intro_Base] Where UserName='"&Username&"'"
  Set Rs = Conn.Execute(SQL)
  If Rs.Eof Then
   Response.Redirect "Error.asp?Param=2004"
   Response.End()
  End if
  Questions = Rs(1)
End Select



 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- 找回密码</title>
</head>
<script language="JavaScript">
 function check_reg(){
 if (document.reg.answer.value==""){
  alert("-请输入用于找回密码的问题答案-");
  document.reg.answer.focus();
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
                <td width="50%" valign="bottom"><img src="../Images/reg2_3.gif" width="380" height="54"></td>
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
              <form action="Get_Password3.asp" name="reg" method="POST"  onSubmit="return check_reg();">
                <tr> 
                  <td height="30"><FONT color=#cc0000><STRONG 
            class=font14b>第一步 确认找回密码的问题答案</STRONG></FONT></td>
                </tr>
                <tr> 
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#f1b5a1">
                      <tr> 
                        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="100" height="30" align="right">密码提示：</td>
                              <td width="220" height="30"><%= Questions %>&nbsp; </td>
                              <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> </font><font color="#999999"> 
                                </font></font></font></font></font></font></td>
                            </tr>
                            <tr> 
                              <td width="100" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                                问题答案：</td>
                              <td width="220" height="30" bgcolor="#fff7f0"><span style="font-family: 宋体; font-size: 12px"><font color="#000000">
                                <input name="answer" class="fieldtext" id="answer" size="26" maxLength="50">
                                </font></span> </td>
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
                  <td align="center"><input type="hidden" name="username" value="<%= Username %>">
                    <input type="hidden" name="usertype" value="<%= Usertype %>">
                    <input type="submit" name="Submit" value="确 认 提 交" style="height:30px;"> 
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
