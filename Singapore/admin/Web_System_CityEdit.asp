<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Param
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
Param  = Replace_text(request("param"))

Select Case Action
 Case "edit"
  Call Edit_Submit() '//��ת���༭����
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�������</title>
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="60%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="0">
<% 	  
 Set Rs = Conn.Execute("Select * From [pH_Web_City] Where Ncid="&Cstr(Param))
 If Not Rs.Eof Then
  Ncid     = Rs("Ncid")
  c_City   = Rs("c_City")
  e_City   = Rs("e_City")
%>
		   <form action="?action=edit" method="post">
              <tr bgcolor="f5f5f5"> 
                  <td height="25" bgcolor="f5f5f5">&nbsp;��  �༭����&nbsp;&nbsp;&nbsp;���ƣ�</font> 
                    <input name="c_city" type="text" id="c_city" size="16" value="<%= c_City %>">
                    ���룺
                    <input name="e_city" type="text" id="e_city" size="16" value="<%= e_City %>"> 
                    <input type="submit" name="Submit" value="�� ��">
                    <input type="hidden" name="param" value="<%= Ncid %>"> </td>
              </tr>
		    </form>
<% 
 Else
 %>
               <tr bgcolor="f5f5f5"> 
                  <td height="25" bgcolor="f5f5f5">&nbsp;��  
                    û���ҵ������
				</td>
              </tr>
<% 
 End if
 Rs.Close
 Set Rs = Nothing
 %>
</table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit()
 Dim Rs
 c_City = Replace_text(request("c_City"))
 e_City = Replace_text(request("e_City"))
 Param    = Replace_text(request("param"))
 '//����Ƿ������������
 If c_City="" or e_City = ""  Then
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
 '//�޸ļ�¼
 Conn.Execute("Update [pH_Web_City] Set c_City='"&c_City&"',e_City='"&e_City&"' Where Ncid="&Cstr(Param))
 Rs.close
 Set Rs = Nothing
 Call CloseDB
 Response.write "�༭�ɹ���"
 Response.write "<meta http-equiv=refresh content=""2;URL=Web_System_City.asp"">" 
 Response.End()
End Sub

Call CloseDB()
 %>

