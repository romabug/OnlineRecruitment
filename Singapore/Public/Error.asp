<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Conn.asp" -->
<% 
Dim Param,ErroStr
Param = Request.QueryString("param")
Check_Id(Param)
Select Case Param
 Case 2001: ErrorStr = "����ְλ�����ޣ������ٷ�����"
 Case 2002: ErrorStr = "��ѡ��ְλ���ٽ��и��������"
 Case 2003: ErrorStr = "�Բ��������ʺ�û��ͨ�����,��ʱ���ܽ��и��������"
 Case 2004: ErrorStr = "�Բ���û���ҵ�ָ���Ļ�Ա��"
 Case 2005: ErrorStr = "�Բ������ṩ������𰸲���ȷ���뼰ʱ��ϵ��վ�ͷ���Ա�һ����룡"
 Case 2006: ErrorStr = "�Բ��������ڵĻ�Ա�鲻�ܽ��иò�����"
End Select
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ������Ϣ</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Include/Header.asp" -->
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td height="4"></td>
        </tr>
        <tr> 
          <td height="1" bgcolor="#eeeeee"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td width="45%" valign="top"> <img src="../Images/error.gif" width="325" height="199"></td>
                <td align="right" valign="top"> <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="50">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><strong><font color="#FF0000">������Ϣ</font></strong></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td class="font-14"><font color=#ff0000><%= ErrorStr %></font></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
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
