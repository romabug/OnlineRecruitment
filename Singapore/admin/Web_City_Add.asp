<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"230") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
Select Case Action
 Case "add"
  Call Add_Submit()
 Case "del"
  Call Del_Submit()
End Select
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/Css.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>��ӵ���</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="50%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="0">
              <form action="?action=add" method="post" name="add" onSubmit="return add_check();">
                <script language="JavaScript">
			   function add_check()
			   {
			    if(document.add.c_city.value=="")
				{
				  alert("�������Ʋ���Ϊ�գ�");
				  document.add.c_city.focus();
				  return false;
				}
				if(document.add.e_city.value=="")
				{
				  alert("����ƴ�����벻��Ϊ�գ�");
				  document.add.e_city.focus();
				  return false;
				}
				if(document.add.suppername.value=="")
				{
				  alert("��������Ա���Ʋ���Ϊ�գ�");
				  document.add.suppername.focus();
				  return false;
				}
				if(document.add.password.value=="")
				{
				  alert("�����������벻��Ϊ�գ�");
				  document.add.password.focus();
				  return false;
				}
			   }
			  </script>
                <tr bgcolor="#f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="#f5f5f5"><p>�������ƣ�</p></td>
                  <td bgcolor="#f5f5f5"><input name="c_name" type="text" id="c_city2" size="20">
                    (�磺����)</td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td height="25" align="right" bgcolor="#f5f5f5">Ӣ�����ƣ�</td>
                  <td bgcolor="#f5f5f5"><input name="e_name" type="text" id="e_city3" size="20"></td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="#f5f5f5">��������Ա��</td>
                  <td bgcolor="#f5f5f5"><input name="suppername" type="text" id="e_city3" size="20"></td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="#f5f5f5">�������룺</td>
                  <td bgcolor="#f5f5f5"><input name="password" type="password" id="e_city4" size="20"></td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td height="25" align="right" bgcolor="#f5f5f5">����λ�ã�</td>
                  <td bgcolor="#f5f5f5"><input name="c_level" type="text" id="suppername" value="1" size="6"></td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td height="25" align="right" bgcolor="#f5f5f5">����״̬��</td>
                  <td bgcolor="#f5f5f5"><input name="flag" type="radio" value="1" checked>
                    ��ͨ 
                    <input type="radio" name="flag" value="0">
                    �ر�</td>
                </tr>
                <tr bgcolor="#f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="#f5f5f5">&nbsp;</td>
                  <td bgcolor="#f5f5f5"><input type="submit" name="Submit" value="�� ��"></td>
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
Sub Add_Submit()
 Dim Rs
 c_Name = Replace_text(request("c_Name"))
 e_name = Replace_text(request("e_name"))
 SupperName = Replace_text(request("SupperName"))
 Password = Replace_text(request("Password"))
 Password = Md5(Password)
 c_Level = Replace_text(request("c_Level"))
 Flag = Replace_text(request("Flag"))
 '//����Ƿ������������
 If c_Name="" or e_name="" Then
  Response.write "�����������ĺ�Ӣ�����ƣ�"
  Response.End()
 End if
 Set Rs = Conn.Execute("Select Cityid From [pH_Web_City] Where e_Name='"&e_Name&"'")
 If Not Rs.Eof Then
  Response.write "��Ӣ�������Ѿ����ڣ�"
  Response.End()
 End if
 Rs.Close
 
 '//�����¼
 Conn.Execute "Insert Into [pH_Web_City] (c_Name,e_Name,SupperName,Password,c_Level,Flag) values ('"&c_Name&"','"&e_Name&"','"&SupperName&"','"&Password&"',"&c_Level&","&Flag&")"
 '��ȡ��վID
 Set Rs = Conn.Execute("Select Top 1 Cityid From [pH_Web_City] Order by Cityid Desc")
 Cityid = Rs(0)
 Rs.Close
 '//���÷�վ��������
 Conn.Execute("Insert Into [pH_Web_Parameter] (About,Statement,Service,Contact,JobEmailSendDate,Cityid) Values ('����д������ݣ�','����д������ݣ�','����д������ݣ�','����д������ݣ�',getdate(),"&Cityid&")")
 
 Call CloseDB
 Response.write "��ӳɹ���"
 Response.write "<meta http-equiv=refresh content=""1;URL=Web_City_Manage.asp"">" 
 Response.End()
End Sub


Call CloseDB()
 %>

