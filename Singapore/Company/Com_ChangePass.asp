<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp,Temp(3)
Dim Cmd,Rs,Action
Dim Ncid,DeptName,Burden,Email

Action = Request.QueryString("action")
If Action = "edit" Then Call Edit_Submit() '��ת�����溯��

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

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ��������</title>
</head>
<script language="JavaScript" >
function theForm_check()
{
if (document.theForm.oldpass.value=="")
{
 alert("������ԭ���룡");
 document.theForm.oldpass.focus();
 return false;
}

if (document.theForm.newpass.value=="")
{
 alert("�����������룡");
 document.theForm.newpass.focus();
 return false;
}

if (document.theForm.newpass2.value=="")
{
 alert("����ȷ�������룡");
 document.theForm.newpass2.focus();
 return false;
}
if (document.theForm.newpass2.value!=document.theForm.newpass.value)
{
 alert("ȷ�������������벻��ͬ��");
 document.theForm.newpass2.focus();
 return false;
}

}
</script>

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
            <!--#include file="../Lefter/Company_Base.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=edit" name="theForm" method="post" onSubmit="return theForm_check()">
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
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��������</font></b></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                            <tr bgcolor="f9f9f9"> 
                              <td width="22%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ԭ���룺</td>
                              <td height="25"> <input name="oldpass" type="password" id="oldpass" size="15" maxlength="30"></td>
                            </tr>
                            <tr> 
                              <td width="22%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �����룺</td>
                              <td height="25"><input name="newpass" type="password" id="newpass" size="15" maxlength="30"> 
                              </td>
                            </tr>
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ȷ�����룺</td>
                              <td height="25"><input name="newpass2" type="password" id="newpass2" size="15" maxlength="30"></td>
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
                  <td height="40" align="center"><input type="submit" name="submit" value=" �� �� " style="height:30px;"> 
                  </td>
                </tr>
              </form>
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
Sub Edit_Submit()
 '//���ղ���
 UserName          = Session("Company")(0)
 Comid             = Session("Company")(2)

 OldPass           = Replace_Text(Request.Form("OldPass"))
 NewPass           = Replace_Text(Request.Form("NewPass"))
 
 OldPass           = Md5(OldPass)
 NewPass           = Md5(NewPass)
 '������û�и��û�����
 SQL = "Select UserName From [pH_Company_Base] Where Comid='"&Comid&"' And Password='"&OldPass&"'"
 Set Rs = Conn.Execute(SQL)
 If Rs.Eof Then
  Response.write "<script>alert('�Բ������ṩ��ȷ��ԭ����...');history.back(-1);</script>"
  Response.End()
 End if
 Rs.Close
 '��������
 Conn.Execute("Update [pH_Company_Base] Set Password='"&NewPass&"' Where Comid='"&Comid&"'")
 '����Sessionֵ
 Temp(0) = UserName
 Temp(1) = NewPass
 Temp(2) = Comid
 Session("Company") = Temp
 
 Response.write "<script>alert('�޸ĳɹ���');location.href='Com_ChangePass.asp';</script>"
 
End Sub


'//�ر����ݿ�����
CloseDB
 %>
