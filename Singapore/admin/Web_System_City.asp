<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"193") <= 0 Then 
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
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>��������</strong></font></td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td align="left"> 
      <table width="50%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr align="center" bgcolor="f5f5f5"> 
                <td width="12%" height="25" bgcolor="f5f5f5"><u>�� ��</u></td>
                <td width="41%" height="25" bgcolor="f5f5f5"><u>��������</u></td>
                <td width="24%" bgcolor="f5f5f5"><u>��������</u></td>
                <td width="23%" height="25" bgcolor="f5f5f5"><u>�������</u></td>
              </tr>
<% 	  
Set Rs = Conn.Execute("Select * From [pH_Web_City]")
While Not Rs.Eof
 Ncid     = Rs("Ncid")
 c_City   = Rs("c_City")
 e_City   = Rs("e_City")		  
%>
              <tr align="center" bgcolor="f5f5f5"> 
                <td width="12%" height="25" bgcolor="f5f5f5"><%= Ncid %></td>
                <td height="25"><%= c_City %></td>
                <td height="25"><%= e_City %></td>
                <td height="25"><a href="?action=del&param=<%= Ncid %>" onClick="return confirm('�Ƿ�ɾ���ü�¼');"><u>ɾ��</u></a> <a href="Web_System_CityEdit.asp?param=<%= Ncid %>"><u>�༭</u></a></td>
              </tr>
<% 
 Rs.Movenext
Wend
Rs.Close
Set Rs = Nothing
				  
%>
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="50%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="0">
		   <form action="?action=add" method="post">
              <tr bgcolor="f5f5f5"> 
                  <td height="25" bgcolor="f5f5f5">��ӵ��� ���ƣ�</font> 
                    <input name="c_city" type="text" id="c_city" size="12">
                    ���룺
                    <input name="e_city" type="text" id="e_city" size="12"> 
                    <input type="submit" name="Submit" value="�� ��">
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
Sub Add_Submit()
 Dim Rs
 c_City = Replace_text(request("c_City"))
 e_City = Replace_text(request("e_City"))
 '//����Ƿ������������
 If e_City="" or c_City = "" Then
  Response.write "�����������ƣ�"
  Response.End()
 End if
 
 '//����Ƿ���ͬ�������
 Set Rs = Conn.Execute("Select * from [pH_Web_City] where e_City='"&e_City&"'")
 If Not Rs.Eof Then
  Rs.close
  Set Rs = Nothing
  Call CloseDB
  Response.write "�õ����Ѿ����ڣ�"
  Response.End()
 End if
 '//�����¼
 Conn.Execute "Insert Into [pH_Web_City] (c_City,e_City) values ('"&c_City&"','"&e_City&"')"
 Rs.close
 Set Rs = Nothing
 Call CloseDB
 Response.write "��ӳɹ���"
 Response.write "<meta http-equiv=refresh content=""2;URL=Web_System_City.asp"">" 
 Response.End()
End Sub

'//ɾ����¼
Sub Del_Submit()
 Dim Param
 Param = Replace_Text(Request.QueryString("param"))
 Conn.Execute("Delete From [pH_Web_City] Where Ncid="&Cstr(Param))
 Call CloseDB
 Response.write "ɾ���ɹ���"
 Response.write "<meta http-equiv=refresh content=""2;URL=Web_System_City.asp"">" 
 Response.End()
End Sub

Call CloseDB()
 %>

