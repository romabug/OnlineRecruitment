<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

Action = Request.QueryString("action")
If Action = "submit" Then
  Call Submit() '//���ñ������ݵĺ���
Elseif Action = "del" Then
  Call DelSubmit() '//����ɾ�����ݵĺ���
 Elseif Action = "editsubmit" Then
  Call EditSubmit() '//�����޸����ݵĺ��� 
End if

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

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Company_Dept.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ��ҵ����</title>
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
            <!--#include file="../Lefter/Company_BasicInfo.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <% 
	  If Action = "add" Then
	    Call AddForm()
	  Elseif Action = "edit" Then
	    Call EditForm()
	  Else
	   Call Main()
	  End if
	  Sub Main()
	   %>
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
                            <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ҵ����</font></b></td>
                          </tr>
                        </table>
                        <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                          <tr align="center" bgcolor="f5f5f5"> 
                            <td width="25%" height="25">��������</td>
                            <td width="20%" height="25">��������</td>
                            <td width="35%" height="25">�ʼ���ַ</td>
                            <td width="20%" height="25">&nbsp;</td>
                          </tr>
                          <% 
'//������ҵ�Ĳ���
SQL = "Select Ncid,DeptName,Burden,Email From [pH_Company_Dept] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
 While Not Rs.Eof
  Ncid      = Rs("Ncid")
  DeptName  = Rs("DeptName")
  Burden    = Rs("Burden")
  Email     = Rs("Email")
 %>
                          <tr bgcolor="f9f9f9"> 
                            <td height="25"><%= DeptName %></td>
                            <td height="25"><%= Burden %></td>
                            <td height="25"><%= Email %></td>
                            <td height="25" align="center"><a href="?action=del&param=<%= Ncid %>" onClick="return confirm('ȷ��ɾ���ò���?');">ɾ��</a> 
                              <a href="?action=edit&param=<%= Ncid %>">�༭</a></td>
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
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="40" align="center"><input type="button" name="Submit" value="�����ҵ����" style="height:30px;" onClick="location.href='?action=add';"> 
                </td>
              </tr>
            </table>
            <% 
	  End Sub
	  
	  '//��Ӳ��ŵı�
	  Sub AddForm()
	   %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=submit" name="edit" method="post" onSubmit="return form_check();">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ҵ����</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ƣ� </td>
                              <td height="25"><input name="deptname" type="text" id="deptname" size="20" maxlength="30"> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ܣ�</td>
                              <td height="25" bgcolor="f9f9f9"><input name="burden" type="text" id="burden" size="20" maxlength="20"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �ʼ���ַ��</td>
                              <td height="25"><input name="email" type="text" id="deptname3" size="30" maxlength="50"> 
                              </td>
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
                  <td height="40" align="center"><input type="submit" name="submit" value=" �����ҵ���� " style="height:30px;"> 
                  </td>
                </tr>
              </form>
            </table>
            <% 
End Sub
	  
Sub EditForm() '//�༭��ҵ����

 Ncid                   = Replace_Text(Request("param"))
 Check_Id(Ncid)        '//����Ƿ�����ֵ
 SQL = "Select Ncid,DeptName,Burden,Email From [pH_Company_Dept] Where Comid='"&Comid&"' And Ncid="&Cstr(Ncid)
 Set Rs = Conn.Execute(SQL)
 Ncid      = Rs("Ncid")
 DeptName  = Rs("DeptName")
 Burden    = Rs("Burden")
 Email     = Rs("Email")
 Rs.Close
	   %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=editsubmit" name="edit" method="post" onSubmit="return form_check();">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ҵ����</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ƣ� </td>
                              <td height="25"><input name="deptname" type="text" id="deptname" size="20" maxlength="30" value="<%= DeptName %>"> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="18%" height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ܣ�</td>
                              <td height="25" bgcolor="f9f9f9"><input name="burden" type="text" id="burden" size="20" maxlength="20" value="<%= Burden %>"></td>
                            </tr>
                            <tr> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �ʼ���ַ��</td>
                              <td height="25"><input name="email" type="text" size="30" maxlength="50" value="<%= Email %>"> 
                              </td>
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
                  <td height="40" align="center"><input type="hidden" name="param" value="<%= Ncid %>"> 
                    <input type="submit" name="submit" value=" �����ҵ���� " style="height:30px;"> 
                  </td>
                </tr>
              </form>
            </table>
            <% End Sub %>
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
Sub Submit() '������ҵ��������
 Check_Url() '//��վ�ύ���ݼ��
 Username               = Session("Company")(0)
 Comid                  = Session("Company")(2)
 DeptName               = Replace_Text(Request.Form("DeptName"))
 Burden                 = Replace_Text(Request.Form("Burden"))
 Email                  = Replace_Text(Request.Form("Email"))
 
 SQL = "Insert Into [pH_Company_Dept] (Comid,Username,DeptName,Burden,Email) Values ('"&Comid&"','"&Username&"','"&DeptName&"','"&Burden&"','"&Email&"')"
 Conn.Execute(SQL) 
 '//����������ʱ��
 SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//�ر����ݿ�����
 CloseDB
 
 Response.redirect "Com_Dept.asp"
End Sub

Sub DelSubmit() 'ɾ����ҵ����
 Check_Url() '//��վ�ύ���ݼ��
 Comid                  = Session("Company")(2)
 Ncid                   = Replace_Text(Request("param"))
 Check_Id(Ncid)        '//����Ƿ�����ֵ
 
 SQL = "Delete From [pH_Company_Dept] Where Ncid="&Ncid&" And Comid='"&Comid&"'"
 Conn.Execute(SQL)
  
 '//����������ʱ��
 SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//�ر����ݿ�����
 CloseDB
 
 Response.redirect "Com_Dept.asp"
End Sub

Sub EditSubmit() '������ҵ��������[�޸�]
 Check_Url() '//��վ�ύ���ݼ��
 Comid                  = Session("Company")(2)
 Ncid                   = Replace_Text(Request.Form("param"))
 DeptName               = Replace_Text(Request.Form("DeptName"))
 Burden                 = Replace_Text(Request.Form("Burden"))
 Email                  = Replace_Text(Request.Form("Email"))
 
 SQL = "Update [pH_Company_Dept] Set DeptName='"&DeptName&"',Burden='"&Burden&"',Email='"&Email&"' Where Ncid="&Ncid&" And Comid='"&Comid&"'"
 Conn.Execute(SQL) 
 '//����������ʱ��
 SQL = "Update [pH_Company_Base] Set LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 '//�ر����ݿ�����
 CloseDB
 
 Response.redirect "Com_Dept.asp"
End Sub


'//�ر����ݿ�����
CloseDB
 %>
