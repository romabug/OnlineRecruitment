<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Ncid,Action
Dim Rs,SQL,Vip_Flag,Tmp
Dim Comid,UserName,Jobid,JobName,RealName

Action = Request.QueryString("action")
If Action = "save" Then Call Save_Submit() '�������� 

'//��ȡ�û��ĵ�½���
If IsArray(Session("Company")) Then
 Comid = Session("Company")(2)
 UserName = Session("Company")(0)
Else
 Session.Abandon() 
 Response.write "<script>alert('-��¼����ܽ��иò�����-');window.close();</script>"
 Response.End()
End if
'//�ж���ҵ��Ա�����ͣ���ѻ�Ա���ܷ�����������
If Session("Nc_Vip") <> 1 Then
  Response.write "<script>alert('��ѻ�Ա���ܽ��иò�������������Ա...');window.close();</script>"
  Response.End()
End if

'//��ȡ���жϲ���
Ncid = Replace_Text(Request("perid")) '���˻�ԱID
If Ncid = "" Then
 Response.write "<script language=JavaScript>alert('��û��ѡ���¼��');window.close();</script>"
 Response.End()
End if

'//�����ݿ��л�ȡ�����û�������
SQL = "Select RealName,Age,Edus,Sex,Locus_Area,Locus_City,WorkWillClass1 From [pH_Person_Info] Where Perid='"&Ncid&"'"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then 
 RealName = Rs("RealName")
 Age = Rs("Age")
 Edus = Cls_Edus(Rs("Edus"))
 Sex = Cls_Sex(Rs("Sex"))
 Locus = Rs("Locus_Area")&Rs("Locus_City")
 WorkWillClass = Rs("WorkWillClass1")
End if
Rs.Close


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Css.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ������������</title>
</head>
<body>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="470" border="0" align="center" cellpadding="0" cellspacing="0">
  <Form action="?action=save" method="post" name="theForm">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="eeeeee">
          <tr>
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                <tr>
                  <td height="25" bgcolor="f9f9f9"> &nbsp;<img src="../Images/icon.gif" width="11" height="11" align="absmiddle"> 
                    <strong>�����˲ſ�</strong></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td height="2"></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr bgcolor="f9f9f9"> 
                  <td width="100" height="25" align="right">�� ����</td>
                  <td height="25"><%= RealName %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td height="25" align="right">�� ��</td>
                  <td height="25" bgcolor="f9f9f9"><%= Sex %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td height="25" align="right">�� �䣺</td>
                  <td height="25"><%= Age %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td height="25" align="right">ѧ ����</td>
                  <td height="25"><%= Edus %></td>
                </tr>
                <tr bgcolor="f9f9f9">
                  <td height="25" align="right">���ڵ�����</td>
                  <td height="25"><%= Locus %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td height="25" align="right">��ְ����</td>
                  <td height="25"><%= WorkWillClass %></td>
                </tr>
                <tr bgcolor="f9f9f9"> 
                  <td width="100" height="25" align="right">�����˲ſ⣺</td>
                  <td height="25">
				  <select name="classid"  style="width:160px">
				  <option value="0">ȫ�����</option>
                  <% 
				  Set Rs = Conn.Execute("Select Classid,ClassName From [pH_Company_PersonDB_Class] Where Comid='"&Comid&"' order by AddDate Desc")
				  While Not Rs.Eof
				   Response.write "<option value="&Rs(0)&">"&Rs(1)&"</option>"
				   Rs.Movenext
				  Wend
				  Rs.Close
				   %>
                    </select> </td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="40" align="center"> 
        <input type="submit" name="Submit" value="�� ��" style="height:30px;">
        <input type="button" name="Submit2" value="ȡ��" style="height:30px;" onClick="window.close();">
        
        <input type="hidden" name="perid" value="<%= Ncid %>">

		</td>
    </tr>
  </Form>
</table>
</body>
</html>
<% 
Sub Save_Submit() '�������� 
 Comid         = Session("Company")(2)
 Perid         = Replace_Text(Request.Form("perid"))
 Classid	   = Replace_Text(Request.Form("classid"))

 '//�������ݵ���ҵ�����б�
 SQL = "Insert Into [pH_Company_PersonDB] (Perid,Comid,AddDate,Classid) Values ('"&Perid&"','"&Comid&"',GetDate(),"&Classid&")"
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('�����ɹ���');window.close();</script>"

End Sub

'//�ر����ݿ�����
CloseDB
 %>
