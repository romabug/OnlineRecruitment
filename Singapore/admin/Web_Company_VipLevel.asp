<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"117") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
If Action = "submit" Then Call Submit()


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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>��ҵ(��)Ȩ�޹���</strong></font></td>
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
  <tr> 
    <td align="left" bgcolor="#FFFFFF">
<table width="500" border="0" cellpadding="4" cellspacing="1" bordercolor="#111111" bgcolor="#FFFFFF" class="text01" style="border-collapse: collapse">
        <tr bgcolor="f5f5f5"> 
          <td width="10%" height="25" align="center" bgcolor="f5f5f5"> ���</td>
          <td width="25%" height="25" align="left" bgcolor="f5f5f5"> 
            <p align="left">�������</td>
          <td width="25%" height="25" align="left" bgcolor="f5f5f5"> ������ϵ��ʽ����</td>
          <td width="20%" align="left">����ְλ��</td>
          <td height="25"> <p align="center">����</td>
        </tr>
        <%
SQL = "Select * From [pH_Company_VipLevel]"
Set Rs = Conn.Execute(SQL)
While Not Rs.Eof
 
%>
        <Form action="?action=submit&id=<%= Rs("i_Id") %>" method="post" name="<%= "theForm"&Rs("i_Id") %>">
          <tr bgcolor="f5f5f5"> 
            <td width="8%" height="25"  align="center"><%= Rs("i_Id") %></td>
            <td width="20%" height="25" align="left" ><%= Rs("i_VipName") %></td>
            <td height="25" align="left" > <input name="vipclick" type="text" size="8" value="<%= Rs("i_VipClick") %>"> 
            </td>
            <td height="25" align="left" > <input name="vipjob" type="text" id="vipjob" value="<%= Rs("i_VipJob") %>" size="8"></td>
            <td height="25" align="center" > <input type="submit" name="Submit" value="�༭" onClick="{if(confirm('ȷʵҪ�޸ĸ����Ĳ�����')){return true;}return false;}"></td>
          </tr>
        </Form>
        <% 
 Rs.Movenext
Wend
Rs.Close
Set Rs = Nothing



 %>
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
    <td align="left"> <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr> 
                <td height="25" bgcolor="f5f5f5"> &nbsp;ע�⣺������޸�������ϵ��ʽ�Ĵ����ͷ���ְλ����</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<% 
Sub Submit()
 Dim VipClick,VipQx,Id,VipJob
 VipClick = SafeRequest("VipClick")
 
 Id = SafeRequest("Id")
 VipJob = SafeRequest("VipJob")
 SQL = "Update [pH_Company_VipLevel] Set i_VipClick="&VipClick&",i_VipJob="&VipJob&" Where i_Id="&Cstr(Id)
 Conn.Execute(SQL)
 CloseDB
 Response.Redirect "Web_Company_VipLevel.asp"
End Sub

Call CloseDB()
 %>

