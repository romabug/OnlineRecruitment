<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Comid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"150") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Dim Rs,SQL,ID
Dim Action
ID = SafeRequest("Id")
Check_ID(ID)
Action = SafeRequest("action")

If Action = "vip" Then Call Vip()

set rs=server.createobject("adodb.recordset")
sql="select Title,AddDate from [Ph_WorkInfo] where Id="&cstr(id)
rs.open sql,conn,1,1


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�������</title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>���������Ϣ</strong></font></td>
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
    <td align="left"> <table width="60%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee" style="border-collapse: collapse">
        <form method="POST" action="?action=vip">
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right">��Ϣ���⣺</td>
            <td width="83%"><%=rs("Title")%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right">����ʱ�䣺</td>
            <td width="83%"><%= Rs("AddDate") %></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right">��Ϣ��ˣ�</td>
            <td width="83%"> <select size="1" name="flag">
                <option value="1">ͨ�����</option>
                <option value="2">��ͨ�����</option>
              </select> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="20%" align="right">&nbsp;</td>
            <td width="83%"> <input type="submit" value="�ύ" name="B1"> <input name="id" type="hidden" id="id" value="<%= Id %>"></td>
          </tr>
        </form>
      </table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Vip()
 Dim Flag
 Flag = SafeRequest("Flag")
 Conn.Execute("Update [PH_WorkInfo] Set i_Flag="&Flag&" Where Id="&Cstr(Id))
 CloseDB
 Response.redirect "Web_Job_Work.asp"
End Sub

Call CloseDB()
 %>

