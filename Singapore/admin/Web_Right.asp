<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
username = Session("Web_Suppername")
 %>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
<body  topmargin="4">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td align="left"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="100" height="130" style="padding-left:15px;"><img src="images/admin_p.gif" width="90" height="100"></td>
          <td valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="90">&nbsp;</td>
              </tr>
              <tr>
                <td height="25">����,<font color="#880000"><%=username%></font> ��ӭ��������վ�������� | <a href="Web_Logout.asp">�˳�</a></td>
              </tr>
            </table></td>
        </tr>
      </table> 
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="2"></td>
        </tr>
        <tr> 
          <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF"><strong>��Ȩ�͵�½��Ϣ</strong></font></td>
        </tr>
        <tr> 
          <td height="5"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellpadding="6" cellspacing="1" bgcolor="#eeeeee">
        <tr bgcolor="#FFFFFF"> 
          <td width="100">��Ȩ��Ϣ��</td>
          <td><%= Cls_Webname %>&nbsp;<%= Cls_Builddate %></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td>�û�����</td>
          <td><font color="#880000"><%=username%></font></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td>��ǰIP��ַ��</td>
          <td><font color="#880000"><%=Request.ServerVariables("Remote_HOST")%></font></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td>��վ��ַ��</td>
          <td><font color="#880000"><%=Request.ServerVariables("Http_HOST")%></font></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td>������汾��</td>
          <td><font color="#880000"><%=Request.ServerVariables("Http_User_Agent")%></font></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td>WEB��������</td>
          <td><font color="#880000"><%=Request.ServerVariables("Server_Software")%></font></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td>��ݹ��ڣ� </td>
          <td><font color="#880000"><%=Session.timeout%>���� </font></td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="2"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF"><strong>����֧����Ϣ</strong></font></td>
  </tr>
  <tr> 
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="6" cellspacing="1" bgcolor="#eeeeee">
  <tr bgcolor="#FFFFFF"> 
    <td width="100">���ߣ�</td>
    <td>TONY TEAM </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="100">CTO��</td>
    <td>TONY</td>
  </tr>

</table>

