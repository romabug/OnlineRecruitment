<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Perid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"204") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
id  = Replace_text(request("id"))


Select Case Action
 Case "edit"
  Call Edit_Submit() '//��ת���༭����
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/Css.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<script language="JavaScript">

function theForm_Submit(id)
{
		
		if (id=="video")
		{
		    up.target='_self';
			up.action="Web_Person_Option.asp?param=video&perid=<%= perid %>&pageno=Web_Person_VideoManage.asp?perid=<%= perid %>"
			up.submit();	   
		}			
		
}

</script>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="50%">&nbsp;<font color="#FFFFFF">�� <strong>�û�����</strong></font></td>
          <td width="50%" align="right"><a href="Web_Other_AddAds.asp"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="5"></td>
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
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <% 	
'���һ�Ա������  
 Set Rs = Conn.Execute("Select * From [pH_Web_Feedback] Where ac_id="&Id)
 If Not Rs.Eof Then

%>
              <tr bgcolor="f5f5f5"> 
                <td width="100" height="25" align="right" bgcolor="f5f5f5">�� ����</td>
                <td bgcolor="f5f5f5"><%= Rs("ac_Name") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td width="100" height="25" align="right" bgcolor="f5f5f5">�� ����</td>
                <td bgcolor="f5f5f5"><%= Rs("ac_Phone") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td height="25" align="right" bgcolor="f5f5f5">�����ʼ���</td>
                <td bgcolor="f5f5f5"><%= Rs("ac_Mail") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td height="25" align="right" bgcolor="f5f5f5">QQ/MSN��</td>
                <td bgcolor="f5f5f5"><%= Rs("ac_QQ") %></td>
              </tr>
              <tr bgcolor="f5f5f5">
                <td height="25" align="right" bgcolor="f5f5f5">�������ͣ�</td>
                <td bgcolor="f5f5f5"><%= Rs("ac_Type") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td height="25" align="right" bgcolor="f5f5f5">������飺</td>
                <td height="100" bgcolor="f5f5f5"><%= Rs("ac_Memo") %></td>
              </tr>
              <tr bgcolor="f5f5f5"> 
                <td height="25" align="right" bgcolor="f5f5f5">�ύʱ�䣺</td>
                <td bgcolor="f5f5f5"><%= Rs("ac_Adddate") %> <input type="button" name="Submit" value="�� ��" onClick="history.back(-1);"> 
                </td>
              </tr>
              <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">û���ҵ�����Ϣ!</td>
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

Call CloseDB()
 %>

