<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Corid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"22") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
Corid  = Replace_text(request("Corid"))
PageNo = Replace_text(request("pageno"))

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
<link href="../CSS/css.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg">&nbsp;<font color="#FFFFFF">�� <strong>�޸�����</strong>[ϵͳ�Զ����޸ĺ�����뷢�͵���ҵ����]</font></td>
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
    <td align="left"> <table width="50%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <% 	
'���һ�Ա������  
 Set Rs = Conn.Execute("Select Username,CorpName,Email From [pH_Intro_Base] Where Corid='"&Corid&"'")
 If Not Rs.Eof Then
  Username      = Rs(0) 
  CorpName      = Rs(1)
  Email         = Rs(2)
%>
              <form action="?action=edit" method="post">
                <tr bgcolor="f5f5f5">
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">�������ƣ�</td>
                  <td bgcolor="f5f5f5"><%= CorpName %></td>
                </tr>
                <tr bgcolor="f5f5f5">
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">�����ʺţ�</td>
                  <td bgcolor="f5f5f5"><%= Username %></td>
                </tr>
                <tr bgcolor="f5f5f5">
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">�޸����룺</td>
                  <td bgcolor="f5f5f5"><input name="password" type="text" id="password" size="16" maxlength="30">
				  
                    <input name="Corid" type="hidden" id="Corid" value="<%= Corid %>">
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>">
					<input name="email" type="hidden" id="email" value="<%= Email %>">
					<input name="CorpName" type="hidden" id="CorpName" value="<%= CorpName %>">
					</td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="����������"></td>
                </tr>
              </form>
 <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">û���ҵ��û���!</td>
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
Sub Edit_Submit() '�޸�����
 Corid       = Replace_text(request("Corid"))
 PageNo      = Replace_text(request("PageNo"))
 Password    = Replace_text(request("Password"))
 Email       = Replace_text(request("Email"))
 CorpName    = Replace_text(request("CorpName"))
 '����
 Pass        = Md5(Password)
 '�޸�����
 SQL = "UPdate [pH_Intro_Base] Set Password='"&Trim(Pass)&"' Where Corid='"&Trim(Corid)&"'"
 Conn.Execute(SQL)
 '�����ʼ�
 HtmlStr = "���ã�������"&Cls_WebName&"������"&Cls_WebName&"����������<u>"&Password&"</u>���뼰ʱ���µ������½����վ���޸ĸ����룡"
 Call SendEmail(Email,HtmlStr,"���������޸ĳɹ�")
 
 Response.write "<script language=JavaScript>alert('�����޸ĳɹ���');location.href='"&PageNo&"';</script>"
End Sub

Call CloseDB()
 %>
