<!--#include file="../../Include/Class_Conn.asp" -->
<!--#include file="../../Include/Class_Main.asp" -->
<% 
Dim Comid,Username,Cmd,Rs,SQL,i,JobId,JobName
Dim CompanyName,DeptName,Deal,Numbers,BeginDate,EndDate,Edus,Flag,Works,Min_Age,Max_Age,Age_Str,Sex,Locus

'//��ȡ�ύ�Ĳ���
JobId     = Request("JobId")
'Response.write Jobid
'Response.End()
If Jobid = "" Then
 Response.write "<script>alert('-��û��ѡ���¼��-');window.close();</script>"
 Response.End()
End if
Jobid = Split(Jobid,",")

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��ҵ��Ƹְλ</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF">
      <!--#include file="../../Header/Info/Person_Search.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF"><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <Form action="" method="post" name="theForm">
          <% 
For k = 0 to UBound(Jobid)
Param = Trim(Jobid(k))
'//������ҵ��Ϣ
SQL = "Select CompanyName,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate,Comid From [pH_Company_Base] Where Comid In (Select Comid From [pH_Job_Base] Where Jobid="&Param&")"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
 CompanyName           = Rs(0)
 Vip_Flag              = Rs(1)
 Vip_Date              = Rs(2)
 Vip_EndDate           = Rs(3)
 Comid				  = Rs(4)
 
End if

Rs.Close

'//���ô洢����
Set Cmd = Server.Createobject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_JobView"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Cmd.Parameters.Append Cmd.CreateParameter("@Jobid",3,1,4)
Cmd.Parameters("@Jobid") = Param
Set Rs = Cmd.Execute
If Not Rs.Eof Then
 Flag = 1
 i    = 0
 Tmp  = Rs.GetRows() '//��������䵽����
End if
'0ְλID,1ְλ����,2ְλ���,3����,4����,5����,6����ʡ,7��,8����Ҫ��,9���Ե�ַ,10ѧ��,11�Ա�,12��������,13����ʱ��,14��ʾ����,15ӦƸ����,16״̬,17Ҫ��ʡ,18��,19��С����,20�������,21����ID,22��ֹ����,23��ϵ��,24�绰,25����,26�绰����,27�ʼ�,28�ʼ�����,29��ַ,30��������
Set Cmd = Nothing

If Flag = 1 Then
 Ncid     = Tmp(0,i)
 JobName = Tmp(3,i)
 '����ְλ���������
 Conn.Execute("Update [pH_Job_Base] Set ViewClicks=ViewClicks+1 Where Jobid="&Cstr(Ncid))

End if

If Flag = 1 Then

 Deal            = Tmp(4,i)  '����
 Numbers         = Tmp(5,i)  '����
 BeginDate       = FormatDateTime(Tmp(13,i),2)
 EndDate         = Tmp(22,i)
 Edus            = Tmp(10,i)
 Works           = Tmp(12,i) '//��������
 Min_Age         = Tmp(19,i) '//��С����
 Max_Age         = Tmp(20,i) '//�������
 Sex             = Tmp(11,i) '//�Ա�

 '//��Ƹ�����ж�
 If Numbers = 0 Then
  Numbers = "��������"
 Else
  Numbers =   Numbers&"��"
 End if
 '//�����ж�
 If Deal = 0 Then
  Deal = "����"
 Else
  Deal = Deal&"Ԫ/��"
 End if
 '//ѧ���ж�
 If Edus = 0 Then
  Edus = "����"
 Else
  Edus = Cls_Edus(Edus)
 End if
 '//���������ж�
 If Works = 0 Then
  Works = "����"
 Else
  Works = Cls_Works(Works)
 End if
 '//����Ҫ��
 Age_Str = Cls_Age(Min_Age,Max_Age)
 '//�Ա��ж�
 Select Case Sex
  Case 0:Sex_Str = "Ů"
  Case 1:Sex_Str = "��"
  Case 2:Sex_Str = "����"
 End Select
'//Ҫ�������ڵ��ж�
If Tmp(17,i) = "����" And Tmp(18,i) = "����" Then
 Locus = "����"
Else
 Locus = Tmp(17,i)&Tmp(18,i)
End if 
'//�ж���ϵ�绰�Ƿ��Ǳ��ܵ�
If Tmp(26,i) = True Then
 Phone            = "������ҵ��ƸҪ��������"
 CompanyFax       = "������ҵ��ƸҪ��������"
Else
 Phone            = Tmp(24,i)
 CompanyFax       = Tmp(25,i)
End if
'//�ж���ϵ�ʼ��Ƿ��Ǳ��ܵ�
If Tmp(28,i) = True Then
 Email            = "������ҵ��ƸҪ��������"
Else
 Email            = Tmp(27,i)
End if

'//�ж���ҵ�Ƿ���VIP��Ա
SQL = "Select Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate From [pH_Company_Base] Where Comid='"&Comid&"'"
Set Re = Conn.Execute(SQL)
Nc_Vip_Flag      = Re(0)
Nc_Vip_Date      = Re(1)
Nc_Vip_EndDate   = Re(2)
Re.Close
%>
          <tr valign="top"> 
            <td align="center"><table width="540" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="30" class="font-14"><b><%= K+1 %>.</b><a href="Com_View.asp?Param=<%= Comid %>" target="_blank"><b><%= CompanyName %></b></a></td>
                </tr>
              </table>
              <table width="540" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td bgcolor="ff811e" height="2"></td>
                </tr>
                <tr> 
                  <td height="25" bgcolor="#ffeee0" class="font-14"><Font color="#000000">&nbsp;<%= Tmp(3,i) %></Font></td>
                </tr>
                <tr> 
                  <td><table width="100%" border="0" cellspacing="1" cellpadding="4">
                      <tr bgcolor="#FFFFFF"> 
                        <td width="15%" height="23" align="left" bgcolor="#f9f9f9">ְλ���ͣ�</td>
                        <td width="35%" height="23"><%= Cls_JobType(Tmp(1,i)) %></td>
                        <td width="15%" height="23" align="left" bgcolor="#f9f9f9">��Ƹ������</td>
                        <td width="35%" height="23"><%= Numbers %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">�������ڣ�</td>
                        <td height="23"><%= BeginDate %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">��ֹ���ڣ�</td>
                        <td height="23"><%= EndDate %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">н�������</td>
                        <td height="23"><%= Deal %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">����������</td>
                        <td height="23"><%= Tmp(6,i)&Tmp(7,i) %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">ѧ��Ҫ��</td>
                        <td height="23"><%= Edus %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">�������ޣ�</td>
                        <td height="23"><%= Works %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">����Ҫ��</td>
                        <td height="23"><%= Age_Str %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">�Ա�Ҫ��</td>
                        <td height="23"><%= Sex_Str %></td>
                      </tr>
                      <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <% If Vip_Flag = True And DateDiff("d",Now(),Vip_Date)<=0 And DateDiff("d",Now(),Vip_EndDate)>=0 Then %>
                      <% If Not IsArray(Session("Person")) Then %>
                      <tr align="left" bgcolor="#FFFFFF"> 
                        <td height="23" colspan="4">&nbsp;ע�Ტ��½����ܲ鿴��ҵ����ϵ��ʽ����<a href="../../Public/MemberLogin.asp">[<u>��ʼ��½</u>]</a>����<a href="../../Public/Register.asp">[<u>���ע��</u>]</a></td>
                      </tr>
                      <% Else %>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">��ϵ�ˣ�</td>
                        <td height="23"><%= Tmp(23,i) %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">��ϵ�绰��</td>
                        <td height="23"><%= Phone %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">������룺</td>
                        <td height="23"><%= CompanyFax %></td>
                        <td height="23" align="left" bgcolor="#f9f9f9">�������룺</td>
                        <td height="23"><%= Tmp(30,i) %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">�����ַ��</td>
                        <td height="23" colspan="3"><%= Email %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">��ϵ��ַ��</td>
                        <td height="23" colspan="3"><%= Tmp(29,i) %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <tr bgcolor="#FFFFFF"> 
                        <td height="23" align="left" bgcolor="#f9f9f9">���Ե�ַ��</td>
                        <td height="23" colspan="3"><%= Tmp(9,i) %></td>
                      </tr>
					  <tr><td height="1" colspan="4" bgcolor="#dddddd"></td></tr>
                      <% 
  End if
End if
 %>
                    </table></td>
                </tr>
              </table>
              <table width="540" border="0" cellspacing="0" cellpadding="4">
                <tr> 
                  <td><strong>ְλ������</strong><br> <%= Tmp(8,i) %> </td>
                </tr>
              </table>
              <table width="540" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td height="30" align="center" valign="bottom"> <img src="../../Images/Company/Joblist_t1.gif" width="100" height="20" onclick="window.open('../../Person/Per_Option.asp?param=fav&ncid=<%= Ncid %>','rslt','width=500,height=320,resizable=yes');"> 
                    <img src="../../Images/Company/Joblist_t2.gif" width="100" height="20" onclick="window.open('../../Person/Per_SendApplication.asp?ncid=<%= Ncid %>','rslt','width=500,height=320,resizable=yes');"> 
                    <% 
If Nc_Vip_Flag = True Then
 If DateDiff("d",Nc_Vip_Date,Date()) >= 0 And DateDiff("d",Nc_Vip_EndDate,Date()) <= 0 Then
 %>
                    <img src="../../Images/Company/Joblist_t3.gif" width="100" height="20" onclick="window.open('../../Person/Per_Option.asp?param=video&ncid=<%= Ncid %>','rslt','width=500,height=320,resizable=yes');"> 
                    <% 
 End if
End if
 %>
                    <img src="../../Images/Company/Joblist_t4.gif" width="100" height="20" onclick="window.open('../../Person/Per_Friend.asp?ncid=<%= Ncid %>','rslt','width=500,height=320,resizable=yes');"> 
                  </td>
                </tr>
                <tr> 
                  <td height="20" align="center"><hr size="1" color="#dddddd"></td>
                </tr>
              </table></td>
            <td width="1" bgcolor="#dddddd"></td>
            <td width="4">&nbsp;</td>
            <td width="190" align="center">&nbsp; </td>
          </tr>
          <% 
End if
Next
 %>
        </form>
      </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" bgcolor="#FFFFFF">
      <!--#include file="../../Include/Info/Footer.asp" -->
    </td>
  </tr>
</table>
</body>
</html>
<% 

'//�ر����ݿ�����
Set Rs = Nothing
CloseDB
 %>
