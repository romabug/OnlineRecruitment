<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Conn.asp" -->
<% 
Dim Param,ErroStr

SQL = "Select Top 1 Statement From [pH_Web_Parameter] Where Cityid=0"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then Statement = Rs(0)
Rs.Close
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��վ����</title>
</head>
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
                <td width="160" valign="top"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="25" align="left" valign="bottom" background="../Images/Public/left10_bg.jpg" style="padding-left:10px;"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="65" height="20" align="center" valign="bottom" bgcolor="#FFFFFF"><strong>��վ����</strong></td>
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td style="BORDER-RIGHT: #D53E3E 1px solid; BORDER-LEFT: #D53E3E 1px solid;BORDER-bottom: #D53E3E 1px solid;"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="About.asp">��������</a> </td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Statement.asp">��վ����</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Service.asp">����ר��</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Feedback.asp">�û�����</a> </td>
                          </tr>
                          <tr>
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Friend.asp">�������</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="../Public/Link.asp">��������</a></td>
                          </tr>
                          <tr> 
                            <td height="25"><img src="../Images/icon3.gif" width="12" height="16">&nbsp; 
                              <a href="Contact.asp">��ϵ����</a> </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  
                </td>
                <td width="10">&nbsp;</td>
                <td align="center" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="31" height="33"><img src="../Images/mid_left_public.gif" width="31" height="33"></td>
                      <td background="../Images/mid_bg.gif" class="font-14"><strong><font color="#333333">��վ����</font></strong></td>
                      <td width="30"><img src="../Images/mid_right.gif" width="30" height="33"></td>
                    </tr>
                  </table> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="2"><%= Statement %></td>
                    </tr>
                  </table>
                </td>
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
