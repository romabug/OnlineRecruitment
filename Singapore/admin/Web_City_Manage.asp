<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"231") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
Select Case Action
 Case "flag"
  Call Flag_Submit()
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
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
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
      <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="4">
              <tr align="center" bgcolor="#f5f5f5"> 
                <td width="6%" height="25" bgcolor="#f5f5f5"><u>�� ��</u></td>
                <td height="25" bgcolor="#f5f5f5"><u>��������</u></td>
                <td width="10%" bgcolor="#f5f5f5"><u>��������</u></td>
                <td width="10%" bgcolor="#f5f5f5"><u>Ӣ������</u></td>
                <td width="6%" bgcolor="#f5f5f5">״̬</td>
                <td width="15%" bgcolor="#f5f5f5"><u>��������Ա����</u></td>
                <td width="6%" bgcolor="#f5f5f5">˳��</td>
                <td width="12%" height="25" bgcolor="#f5f5f5"><u>�������</u></td>
              </tr>
              <% 
Set Rs = Server.CreateObject("ADODB.recordset")
SQL = "Select * From [pH_Web_City] Order by c_level Asc"
Rs.Open SQL,Conn,1,1

Rs.Pagesize = 15
Psize       = Rs.PageSize
PCount      = Rs.PageCount
RCount      = Rs.RecordCount

PageNo = Cint(Request.QueryString("PageNo"))
If PageNo < 1 Then
 PageNo = 1
Elseif PageNo > PCount Then
 PageNo = PCount
End if
Thepage = (PageNo-1)*Psize
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

For i = 1 to Psize
 If Rs.Eof Then Exit For
 Cityid     = Rs("Cityid")
 c_Name   = Rs("c_Name")
 e_Name   = Rs("e_Name")
 Suppername = Rs("Suppername")
 c_Level = Rs("c_Level")
 Flag = Rs("Flag")
 If Flag = True Then
  Flag_Str = "<a href=?action=flag&param="&Cityid&"&State=0>��ͨ</a>"
 Else
  Flag_Str = "<a href=?action=flag&param="&Cityid&"&State=1><font color=#999999>�ر�</font></a>"
 End if
%>
              <tr align="center" bgcolor="#f5f5f5"> 
                <td width="6%" height="25" bgcolor="#f5f5f5"><%= Thepage+i %></td>
                <td height="25" align="left"><%= c_Name %></td>
                <td height="25"><%= Cityid %></td>
                <td height="25"><%= e_Name %></td>
                <td height="25"><%= Flag_Str %></td>
                <td height="25"><%= SupperName %></td>
                <td height="25"><%= c_Level %></td>
                <td height="25"><a href="?action=del&param=<%= Cityid %>" onClick="return confirm('�Ƿ�ɾ���ü�¼');"><u>ɾ��</u></a> 
                  <a href="Web_City_Edit.asp?param=<%= Cityid %>"><u>�༭</u></a> 
                </td>
              </tr>
              <% 
 Rs.Movenext
Next

				  
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A5B6CC">
  <tr> 
    <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="1" cellpadding="0">
        <tr> 
          <td height="25" bgcolor="#f5f5f5"> <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tr> 
                <td width="50%" height="25">��<Font color="#FF0000"><%= RCount %></Font>�� 
                  ��<Font color="#FF0000"><%= PCount %></Font>ҳ | ��ǰ��<Font color="#FF0000"><%= PageNo %></Font>ҳ</td>
                <td width="30%" align="right"> 
                  <%
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&ParamName="&ParamName&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&ParamName="&ParamName&""">��ҳ</a>&nbsp;"    
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "��ҳ&nbsp;" 
		  End if
		   
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&ParamName="&ParamName&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&ParamName="&ParamName&""">βҳ</a>"   
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "βҳ" 
		  End if
		   %>
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<% 
Rs.Close
Set Rs = Nothing

'//����״̬
Sub Flag_Submit()
 Dim Param
 Param = Replace_Text(Request.QueryString("param"))
 State1 = Replace_Text(Request.QueryString("State"))
 Conn.Execute("Update [pH_Web_City] Set Flag="&State1&" Where Cityid="&Cstr(Param))
 Call CloseDB
 Response.write "���óɹ���"
 Response.write "<meta http-equiv=refresh content=""2;URL=Web_City_Manage.asp"">" 
 Response.End()
End Sub


'//ɾ����¼
Sub Del_Submit()
 Dim Param
 Param = Replace_Text(Request.QueryString("param"))
 Conn.Execute("Delete From [pH_Web_City] Where Cityid="&Cstr(Param))
 'ɾ���������
 Conn.Execute("Delete From [pH_Web_Parameter] Where Cityid="&Cstr(Param))
 Call CloseDB
 Response.write "ɾ���ɹ���"
 Response.write "<meta http-equiv=refresh content=""2;URL=Web_City_Manage.asp"">" 
 Response.End()
End Sub

Call CloseDB()
 %>

