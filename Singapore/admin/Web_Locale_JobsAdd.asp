<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Comid,PageNo
Dim Locid,Sortid,CompanyName,JobName,Require,Place,Valid,InviteDate
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"171") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
Param  = Replace_text(request("Param"))


Select Case Action
 Case "edit"
  Call Edit_Submit() '//��ת���༭����
End Select
Set Rs = Conn.Execute("Select CompanyName From [pH_Locale_Base] Where Ncid="&Cstr(Param))
CompanyName = Rs(0)
Rs.Close

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�����Ƹ��ҵ����Ƹְλ</strong></font></td>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="70%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post" name="reg">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">��ҵ���ƣ�</td>
                  <td><%= CompanyName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" align="right">ְλ���ƣ�</td>
                  <td> 
                    <input name="jobname" type="text" id="jobname" size="30"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">��Ƹ������</td>
                  <td> 
                    <input name="users" type="text" id="users" style="width:100px" value="0" maxlength="4">
                    �� ( Ĭ��Ϊ0,��ʾ������ ) </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">�� ����</td>
                  <td> 
                    <input name="deal" type="text" style="width:100px" value="0" maxlength="4">
                    Ԫ/�� ( Ĭ��Ϊ0,��ʾ�������� )</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">��Ч�ڣ�</td>
                  <td> 
                    <select name="valid" size=1 >
                      <option value="0">������Ч 
                      <option value="7">һ���� 
                      <option value="15">����� 
                      <option value="30">һ���� 
                      <option value="60">������ 
                      <option value="90" selected>������ 
                      <option value="180">���� 
                    </select></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">����������</td>
                  <td> 
                    <!--#include file="../Include/Class_Locus.asp" -->
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right">ְλҪ��</td>
                  <td> 
                    <textarea name="require" cols="45" rows="6" id="require"></textarea></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right">&nbsp; </td>
                  <td> 
                    <input type="submit" name="Submit" value="�� ��"> 
                    <input name="locid" type="hidden" id="locid" value="<%= Param %>"> 
                    <input name="companyname" type="hidden" id="companyname" value="<%= CompanyName %>"> 
                  </td>
                </tr>
              </form>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() '�޸�����

 Locid					= Replace_text(Request.form("Locid"))
 CompanyName			= Replace_text(Request.form("CompanyName"))
 JobName				= Replace_text(Request.form("JobName"))
 Require				= Replace_text(Request.form("Require"))
 Valid					= Replace_text(Request.form("Valid"))
 Users					= Replace_text(Request.form("Users"))
 Deal					= Replace_text(Request.form("Deal"))
 Locus_Area				= Replace_text(Request.form("x_suozaidi"))
 Locus_City				= Replace_text(Request.form("x_suozaidi1"))
 
 If Require <> "" Then Require = Replace(Require,Chr(13),"<br>")
 
 '��������
 SQL = "Insert Into [pH_Locale_Jobs] (Locid,CompanyName,JobName,Require,Valid,Deal,Users,Locus_Area,Locus_City,AddDate) Values ("&Locid&",'"&CompanyName&"','"&JobName&"','"&Require&"',"&Valid&","&Deal&","&Users&",'"&Locus_Area&"','"&Locus_City&"',Getdate())"
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='Web_Locale_Jobs.asp';</script>"
 Response.End()
End Sub

Call CloseDB()
 %>

