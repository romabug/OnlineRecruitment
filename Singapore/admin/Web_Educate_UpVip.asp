<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Action,Schid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"14") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
Schid  = Replace_text(request("Schid"))
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
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�����շ�(VIP)��Ա</strong></font></td>
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
 Set Rs = Conn.Execute("Select Username,SchoolName,Email From [pH_Educate_Base] Where Schid='"&Schid&"'")
 If Not Rs.Eof Then
  Username      = Rs(0) 
  SchoolName   = Rs(1)
  Email         = Rs(2)
%>
              <form action="?action=edit" method="post">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">�������ƣ�</td>
                  <td bgcolor="f5f5f5"><%= SchoolName %></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">�����ʺţ�</td>
                  <td bgcolor="f5f5f5"><%= Username %></td>
                </tr>
                <tr bgcolor="f5f5f5">
                  <td height="25" align="right" bgcolor="f5f5f5">�շ����ͣ�</td>
                  <td bgcolor="f5f5f5">
				  <select name="level" id="level">
             		<% 
		  			Set Re = Conn.Execute("Select i_LevelId,i_VipName From [pH_Educate_VipLevel]")
		 			While Not Re.Eof 
		 			  Response.write "<option value="&Re(0)&">"&Re(1)&"</option>"
		  			  Re.Movenext
		 			Wend 
		 			Re.Close
		  			 %>
                    </select>
				   </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">��ʼʱ�䣺</td>
                  <td bgcolor="f5f5f5">
				  <input name="begindate" type="text" id="begindate" size="16" maxlength="30" onclick="SD(this,'document.all.begindate')" value="<%= Date() %>"> 
                    <input name="Schid" type="hidden" id="Schid" value="<%= Schid %>"> 
                    <input name="pageno" type="hidden" id="pageno" value="<%= PageNo %>"> 
                    <input name="email" type="hidden" id="email" value="<%= Email %>"> 
                    <input name="SchoolName" type="hidden" id="SchoolName" value="<%= SchoolName %>"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="�� ��"></td>
                </tr>
              </form>
              <% 
 Else
 %>
              <tr bgcolor="f5f5f5"> 
                <td height="25" colspan="2" bgcolor="f5f5f5">û���ҵ����û�!</td>
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
 Schid       = Replace_text(request("Schid"))
 PageNo      = Replace_text(request("PageNo"))
 Level       = Replace_text(request("Level"))
 BeginDate   = Replace_text(request("BeginDate"))
 Email       = Replace_text(request("Email"))
 SchoolName = Replace_text(request("SchoolName"))
 '�жϻ�Ա�Ƿ���˹�
 Set Rs = Conn.Execute("Select Flag From [pH_Educate_Base] Where Schid='"&Trim(Schid)&"'")
 If Rs(0) = False Then
   Response.write "<script language=JavaScript>alert('������������ͨ���Ըû�Ա�����');location.href='"&PageNo&"';</script>"
   Response.End()
 End if
 Rs.Close
 '���Ҹ߼���Ա�ļ���Ĳ���
 'Set Rs = Conn.Execute("Select * From [pH_Educate_VipLevel] Where i_Levelid="&Cstr(Level))
 'VipClicks = Rs("i_VipClick")
 'VipJobs = Rs("i_VipJob")
 'Rs.Close
 '����
 SQL = "UPdate [pH_Educate_Base] Set VipFlag=1,VipLevel="&Level&",VipDate='"&BeginDate&"',VipEndDate=DateAdd(m,"&Level&",'"&BeginDate&"'),VipApplyDate=null Where Schid='"&Trim(Schid)&"'"
 Conn.Execute(SQL)
 '�����ʼ�
 'HtmlStr = "���ã�������ѵ����["&SchoolName&"]��"&Cls_WebName&"�Ѿ���"&BeginDate&"�ɹ����óɸ߼�VIP��Ա����ֹ������"&DateAdd("m",Level,BeginDate)&"<br><hr><br>"&Cls_WebName
 'Call SendEmail(Email,HtmlStr,"������ѵ������VIP��Ա")
 
 Response.write "<script language=JavaScript>alert('���óɹ���');location.href='"&PageNo&"';</script>"
End Sub

Call CloseDB()
 %>

