<!--#include file="../../Include/Class_Conn.asp" -->
<!--#include file="../../Include/Class_Main.asp" -->
<% 
Dim Param
Dim Comid,Username,Cmd,Rs,SQL
Dim SetDate,Properity,Industry,Currency_Str,Workers,Locus,LogoUrl,LogoKeep,Company_Memo
Dim ContactPerson,Phone,CompanyFax,Email,WebHome,Address,ZipCode
Dim Vip_Flag,Vip_Date,Vip_EndDate

If Not IsArray(Session("Company")) Then 
 Response.write "<script>alert('-��¼����ܽ��иò�����-');location.href='../../Public/MemberLogin.asp';</script>"
 Response.End()
End if
'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//������ҵ��Ϣ
SQL = "Select CompanyName,Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate From [pH_Company_Base] Where Comid='"&Comid&"'"
Set Rs = Conn.Execute(SQL)
If Rs.Eof Then
 CloseRs
 CloseDB
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if
CompanyName           = Rs(0)
Vip_Flag              = Rs(1)
Vip_Date              = Rs(2)
Vip_EndDate           = Rs(3)
Rs.Close

'//���ô洢����
Set Cmd = Server.Createobject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_PreviewJob"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Not Rs.Eof Then
 Flag = 1 
 Tmp  = Rs.GetRows() '//��������䵽����
 '//�ж���ҵ�Ƿ���VIP��Ա
 SQL = "Select Nc_Vip_Flag,Nc_Vip_Date,Nc_Vip_EndDate From [pH_Company_Base] Where Comid='"&Comid&"'"
 Set Re = Conn.Execute(SQL)
 Nc_Vip_Flag      = Re(0)
 Nc_Vip_Date      = Re(1)
 Nc_Vip_EndDate   = Re(2)
 Re.Close
End if
'0ְλID,1ְλ����,2ְλ���,3����,4����,5����,6����ʡ,7��,8����Ҫ��,9���Ե�ַ,10ѧ��,11�Ա�,12��������,13����ʱ��,14��ʾ����,15ӦƸ����,16״̬,17Ҫ��ʡ,18��,19��С����,20�������,21����ID,22��ֹ����,23��ϵ��,24�绰,25����,26�绰����,27�ʼ�,28�ʼ�����,29��ַ,30��������
Set Cmd = Nothing

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName&" - "&CompanyName %> - ��Ƹְλ</title>
</head>
<style>
.buttonstyle {
	BORDER-RIGHT: #ffffff 0px solid; BORDER-TOP: #ffffff 0px solid; BACKGROUND-IMAGE: url(../../Images/input_bg2.jpg); FONT: 12px ����; BORDER-LEFT: #ffffff 0px solid; WIDTH: 135; CURSOR: hand; COLOR: #333333; BORDER-BOTTOM: #ffffff 0px solid; HEIGHT: 22px; BACKGROUND-COLOR: #e7e7e7
}
</style>
<script language="JavaScript" src="../../js/Search_Three.js"></script>
<script language="JavaScript">
 function search_check()
 {
 if (document.quicksearch.btnSltFuntype1.value=="ѡ��/�޸�"){
  alert("-��ѡ��ְλ���");
  //document.quicksearch.btnSltFuntype1.focus();
  return false;
 } 
 if (document.quicksearch.btnSltArea1.value=="ѡ��/�޸�"){
  alert("-��ѡ�����");
  //document.quicksearch.btnSltArea1.focus();
  return false;
 } 
 if (document.quicksearch.btnSltIndustry1.value=="ѡ��/�޸�"){
  alert("-��ѡ����ҵ���");
  //document.quicksearch.btnSltIssuedate1.focus();
  return false;
 }
  if (document.quicksearch.btnSltIssuedate1.value=="ѡ��/�޸�"){
  alert("-��ѡ���������");
  //document.quicksearch.btnSltIssuedate1.focus();
  return false;
 }  
 if (document.quicksearch.key.value=="������ؼ���"){
  alert("-������ؼ���-");
  document.quicksearch.key.focus();
  return false;
 }
 }
</script>

<SCRIPT language=javascript>
<!--
buildDiv("popupArea","popupFuntype","popupSubfuntype","popupIndustry","popupIssuedate");
//-->
</SCRIPT>

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
    <td align="center" bgcolor="#FFFFFF"><table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td height="8"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr valign="top"> 
          <td width="195"> <table width="185" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="4">
                    <tr>
                      <td align="center"><img src="../../Images/Company/welcome.gif" width="149" height="43"></td>
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
            <table width="185" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="31" height="33"><img src="../../Images/mid_left.gif" width="31" height="33"></td>
                      <td background="../../Images/mid_bg.gif"><strong><font color="#ff7300">��Ƹְλ</font></strong></td>
                      <td width="30"><img src="../../Images/mid_right.gif" width="30" height="33"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <% 
SQL = "Select Jobid,JobName From [pH_Job_Base] Where Comid='"&Comid&"' And JobFlag=1 And End_Date>=getdate() Order By LastUpdate_Time Desc,JobId Desc"
Set Rs_a = Conn.Execute(SQL)
If Not Rs_a.Eof Then
 While Not Rs_a.Eof
  Response.write "<tr><td height=25>&middot;<a href=""Com_Jobview.asp?Comid="&Comid&"&Param="&Rs_a("Jobid")&""">"&Rs_a("JobName")&"</a></td></tr>"
  Rs_a.Movenext
 Wend 
End if
Rs_a.Close
 %>
                  </table></td>
              </tr>
            </table>
            
          </td>
          <td width="1" bgcolor="#cfd0cf"></td>
          <td width="10"></td>
          <td width="554" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="25" align="center"><img src="../../Images/Company/arrow1.gif" width="13" height="9"></td>
                      <td height="30" class="font-14"><b><%= CompanyName %></b></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="21">&nbsp;</td>
                      <td width="21" rowspan="2"><img src="../../Images/Company/yleft.gif" width="21" height="22"></td>
                      <td width="78" rowspan="2" align="center" valign="bottom" background="../../Images/Company/company_ybg.gif"><a href="Com_PreView.asp?Param=<%= Comid %>">��ҵ���</a></td>
                      <td width="28" rowspan="2"><img src="../../Images/Company/middle.gif" width="28" height="22"></td>
                      <td width="80" rowspan="2" align="center" valign="bottom" background="../../Images/Company/company_wbg.gif"><strong>��Ƹְλ</strong></td>
                      <td width="24" rowspan="2"><img src="../../Images/Company/person_wright.gif" width="24" height="22"></td>
                      <td width="20">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height=1 bgcolor=#ddddda></td>
                      <td height=1 bgcolor=#ddddda></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
				   <Form action="" method="post" name="theForm">
                    <% 
If Flag = 1 Then
For i = 0 To UBound(Tmp,2)
 Set Re = Conn.Execute("Select DeptName From [pH_Company_Dept] Where Ncid="&Cstr(Tmp(21,i)))  '//���Ҳ��ű�
 If Not Re.eof Then DeptName = Re(0)
 Re.Close
 Ncid            = Tmp(0,i)
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
'//����ְλ����ʾ����
Conn.Execute("Update [pH_Job_Base] Set ViewClicks=ViewClicks+1 Where Jobid="&Cstr(Ncid))


%>

              <tr>
                <td align="center">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td bgcolor="#ff811e" height="2"></td>
                    </tr>
                    <tr> 
                        <td height="25" bgcolor="#ffeee0" class="font-14"><Font color="#000000">&nbsp;<b><%= Tmp(3,i) %></b></Font></td>
                    </tr>
                    <tr> 
                      <td><table width="100%" border="0" cellspacing="1" cellpadding="4">
                            <tr> 
                              <td width="15%" height="23" align="left" bgcolor="f9f9f9">ְλ���ͣ�</td>
                              <td width="35%" height="23" bgcolor="#FFFFFF"><%= Cls_JobType(Tmp(1,i)) %></td>
                              <td width="15%" height="23" align="left" bgcolor="f9f9f9">н�������</td>
                              <td width="35%" height="23" bgcolor="#FFFFFF"><%= Deal %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td width="15%" height="23" align="left" bgcolor="f9f9f9">��Ƹ���ţ�</td>
                              <td width="35%" height="23" bgcolor="#FFFFFF"><%= DeptName %></td>
                              <td width="15%" height="23" align="left" bgcolor="f9f9f9">��Ƹ������</td>
                              <td width="35%" height="23" bgcolor="#FFFFFF"><%= Numbers %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">�������ڣ�</td>
                              <td height="23" bgcolor="#FFFFFF"><%= BeginDate %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">��ֹ���ڣ�</td>
                              <td height="23" bgcolor="#FFFFFF"><%= EndDate %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">����������</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Tmp(6,i)&Tmp(7,i) %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">�����ڵأ�</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Locus %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">ѧ��Ҫ��</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Edus %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">�������ޣ�</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Works %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">����Ҫ��</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Age_Str %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">�Ա�Ҫ��</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Sex_Str %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                           
						    <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">��ϵ�ˣ�</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Tmp(23,i) %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">��ϵ�绰��</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Phone %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">������룺</td>
                              <td height="23" bgcolor="#FFFFFF"><%= CompanyFax %></td>
                              <td height="23" align="left" bgcolor="f9f9f9">�������룺</td>
                              <td height="23" bgcolor="#FFFFFF"><%= Tmp(30,i) %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">�����ַ��</td>
                              <td height="23" colspan="3" bgcolor="#FFFFFF"><%= Email %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="4" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">��ϵ��ַ��</td>
                              <td height="23" colspan="3" bgcolor="#FFFFFF"><%= Tmp(29,i) %></td>
                            </tr>
                            <tr> 
                              <td height="1" colspan="5" bgcolor="#dddddd"></td>
                            </tr>
                            <tr> 
                              <td height="23" align="left" bgcolor="f9f9f9">���Ե�ַ��</td>
                              <td height="23" colspan="3" bgcolor="#FFFFFF"><%= Tmp(9,i) %></td>
                            </tr>
							
                          </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="cccccc" height="2"></td>
                    </tr>
                  </table>
                   
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="5"></td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="4">
                    <tr> 
                      <td><strong>ְλ������</strong><br> <%= Tmp(8,i) %> </td>
                    </tr>
                  </table>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="5"></td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><hr size="1" color="#cfd0cf"></td>
                      </tr>
                    </table></td>
              </tr>
<% 
 Next
Else
 Response.write "<tr><td align=Center>��ʱû����Ƹְλ</td></tr>"
End if
 %>
                  </Form>

            </table> </td>
        </tr>
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
