<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,CompanyName

Action = Request.QueryString("action")
If Action = "del" Then Call Del_Submit() '��ת��ɾ������
'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Dept"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 Rs.Close
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����
'//0��ҵ����
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�رռ�¼������
Rs.Close
Set Cmd = Nothing

'//���ܴ���
CompanyName  = Tmp(0,0)
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ������</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_Search.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			
              <tr> 
                <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                    <tr> 
                      <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="2"></td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                          <tr> 
                            <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;������</font></b> 
                              [�������Խ�������ְλ������]</td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="2"></td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                          <tr bgcolor="f5f5f5"> 
                            <td height="24">&nbsp;����������</td>
                            <td width="20%" height="24" align="center">�� ��</td>
                          </tr>
                          <% 
SQL = "Select Ncid,Searcher_Name From [pH_Company_Searcher] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 Response.write "<tr bgcolor=""f9f9f9""><td height=""25"">&nbsp;��ʱû�д���������</td><td height=""25"" align=""center"">&nbsp;</td></tr>"
Else
 While Not Rs.Eof
  Ncid           = Rs(0)
  Searcher_Name  = Rs(1)
 %>
                          <tr bgcolor="f9f9f9"> 
                            <td height="25">&nbsp;<a href="Com_Searcher_Base.asp?Param=<%= Ncid %>" target="_blank"><u><%= Searcher_Name %></u></a></td>
                            <td height="25" align="center"> <a href="?action=del&param=<%= Ncid %>" onClick="return confirm('�Ƿ�ɾ���ü�¼');"><u>ɾ��</u></a> 
                              <a href="Com_Searcher_Edit.asp?Param=<%= Ncid %>"><u>�༭</u></a> 
                            </td>
                          </tr>
                          <% 
  Rs.Movenext
 Wend
End if 
Rs.Close 
 %>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="2"></td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                          <tr> 
                            <td height="25" bgcolor="f5f5f5"><font color="#000000"><strong>&nbsp;</strong></font><strong>˵��</strong><br> 
                              &nbsp;��������������ƿ��԰�����������������ѯ����������ְλ��Ϣ<br> &nbsp;���༭���鿴/�޸��������е���������<br> 
                              &nbsp;��ɾ������������ɾ��</td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="2"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="40" align="center"><input type="button" name="Submit" value="����������" style="height:30px;" onClick="location.href='Com_Searcher_Add.asp';">
                  </td>
              </tr>
			 
            </table>
            
          </td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 
Sub Del_Submit() 'ɾ���������ļ�¼
 Call Check_url()    '��ֹ�ⲿվ���ύ����
 '//�ύ����
 Comid                = Session("Company")(2)
 Ncid                = Replace_Text(Request("param"))
 Check_Id(Ncid)
 
 SQL = "Delete From [pH_Company_Searcher] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid)
 Conn.Execute(SQL)

 CloseDB
 Response.redirect "Com_Searcher.asp"

End Sub

'//�ر����ݿ�����
CloseDB
 %>
