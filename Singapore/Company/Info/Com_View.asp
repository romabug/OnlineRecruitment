<!--#include file="../../Include/Class_Conn.asp" -->
<!--#include file="../../Include/Class_Main.asp" -->
<% 
Dim Param
Dim Comid,Username,Cmd,Rs,SQL
Dim SetDate,Properity,Industry,Currency_Str,Workers,Locus,LogoUrl,LogoKeep,Company_Memo
Dim ContactPerson,Phone,CompanyFax,Email,WebHome,Address,ZipCode
Dim Vip_Flag,Vip_Date,Vip_EndDate
Param     = Replace_Text(Request.QueryString("Param"))
'//��ȡ��Ա��½�ı��
Comid     = Param
'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Preview"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����
'//0��ҵ����,1Ӫҵִ��,2��ҵ,3��ҵ����,4�������,5��,6��,7Ա������,8ע���ʽ�,9�ʽ�����,10��ҵ���,11��ϵ��,12�绰,13�绰����,14����,15�ʼ�,16�ʼ�����,17��ҵ����ʡ,18����,19��ַ,20��������,21��ҵ��ַ,22LOGO,23ͼƬ����,24������ʱ��,25VIP���,26VIP��ʼʱ��,27��ֹʱ��,28��ʾ����,29������Ƶ,30��ͨʱ��,31��ֹʱ��,32��Ƶ״̬,33��Ƶ�ļ�
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�ر����ݿ����
Rs.Close
Set Cmd = Nothing
'//������ҵ����ʾ����
Conn.Execute("Update [pH_Company_Base] Set ViewClicks=ViewClicks+1 Where Comid='"&Comid&"'")

SetDate           = Tmp(4,0)&"��"&Tmp(5,0)&"��"&Tmp(6,0)&"��"
Properity         = Cls_Properity(Tmp(3,0))                        '//�����ҵ����
Industry          = Cls_Industry(Tmp(2,0))                         '//�����ҵ
Currency_Str      = Tmp(8,0)&"��/Ԫ "&Cls_Currency(Tmp(9,0))       '//ע���ʽ������
Workers           = Cls_Workers(Tmp(7,0))                          '//���Ա����
Locus             = Tmp(17,0)&Tmp(18,0)
LogoUrl           = Tmp(22,0)
LogoKeep          = Tmp(23,0)
Company_Memo      = Tmp(10,0)

ContactPerson     = Tmp(11,0)
'//�ж���ϵ�绰�Ƿ��Ǳ��ܵ�
If Tmp(13,0) = True Then
 Phone            = "������ҵ��ƸҪ��������"
 CompanyFax       = "������ҵ��ƸҪ��������"
Else
 Phone            = Tmp(12,0)
 CompanyFax       = Tmp(14,0)
End if
'//�ж���ϵ�ʼ��Ƿ��Ǳ��ܵ�
If Tmp(16,0) = True Then
 Email            = "������ҵ��ƸҪ��������"
Else
 Email            = Tmp(15,0)
End if
WebHome           = Tmp(21,0)
Address           = Tmp(19,0)
ZipCode           = Tmp(20,0)
Vip_Flag          = Tmp(25,0)
Vip_Date          = Tmp(26,0)
Vip_EndDate       = Tmp(27,0)

Nc_Video           = Tmp(29,0)
Video_Date         = Tmp(30,0)
Video_EndDate      = Tmp(31,0)
Video_Flag         = Tmp(32,0)
Video_File         = Tmp(33,0) 

If WebHome = "http://" Then WebHome = ""
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../../Css/Style.css" type=text/css rel=stylesheet>
<title> �¼�����Ƹ �������� ������� ������ǲ <%= Tmp(0,0) %></title>
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
          <td width="195"> <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tr>
                <td align="center"><img src="../../Images/Company/welcome.gif" width="149" height="43"></td>
              </tr>
            </table>
 <% If Nc_Video = True And DateDiff("d",Video_Date,Date())>=0 And DateDiff("d",Video_EndDate,Date())<=0  Then %>
            <table width="185" border="0" cellspacing="0" cellpadding="0">
              
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td align="center"><table width="180" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="159" align="center" valign="middle" background="../../Images/Company/Videoborder_180.jpg"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="170" height="148">
                          <param name="movie" value="../../Include/Class_flvplayer2.swf?autostart=true&file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>">
                          <param name="quality" value="high">
                          <embed src="../../Include/Class_flvplayer2.swf?autostart=true&file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>" width="170" height="148" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></object> 
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="5"></td>
              </tr>
            </table>
<% End if %>
            <table width="185" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
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
  Response.write "<tr><td height=25>&middot;<a href=""Com_Job.asp?Comid="&Comid&"&Param="&Rs_a("Jobid")&""">"&Rs_a("JobName")&"</a></td></tr>"
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
                      <td height="30" class="font-14"><b><%= Tmp(0,0) %></b></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="21">&nbsp;</td>
                      <td width="21" rowspan="2"><img src="../../Images/Company/company_left.gif" width="22" height="22"></td>
                      <td width="78" rowspan="2" align="center" valign="bottom" background="../../Images/Company/company_wbg.gif"><strong>��ҵ���</strong></td>
                      <td width="28" rowspan="2"><img src="../../Images/Company/company_middle.gif" width="28" height="22"></td>
                      <td width="80" rowspan="2" align="center" valign="bottom" background="../../Images/Company/company_ybg.gif"><a href="Com_Joball.asp?Param=<%= Comid %>">��Ƹְλ</a></td>
                      <td width="24" rowspan="2"><img src="../../Images/Company/company_right.gif" width="24" height="22"></td>
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
            <table width="504" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><strong>��˾��Ϣ��</strong></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><table width="100%" border="0" cellspacing="1" cellpadding="0">
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">�������ڣ�</td>
                            <td height="25"><%= SetDate %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">��ҵ���ʣ�</td>
                            <td height="25"><%= Properity %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">������ҵ��</td>
                            <td height="25"><%= Industry %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">ע���ʽ�</td>
                            <td height="25"><%= Currency_Str %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">Ա��������</td>
                            <td height="25"><%= Workers %></td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width="70" height="25" align="left">���ڵ�����</td>
                            <td height="25"><%= Locus %></td>
                          </tr>
                        </table></td>
                      <td width="150" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="center"> <% 
If LogoKeep = 0 Then
 If LogoUrl <> Null or LogoUrl <> "" Then
  Response.write "<img src=""../../UpLoadFiles/CompanyFile/"&LogoUrl&""" width=""135"" height=""160"">"
 Else
  Response.write "<img src=""../../UpLoadFiles/DefaultFile/Company.gif"" width=""135"" height=""160"">"
 End if
Else
 Response.Write "ͼƬ������"
End if
 %> </td>
                          </tr>
                          <tr> 
                            <td height="6"></td>
                          </tr>
                        </table>
                        <% If Nc_Video = True And DateDiff("d",Video_Date,Date())>=0 And DateDiff("d",Video_EndDate,Date())<=0  Then %>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="center"><img src="../../Images/video2.gif" width="14" height="16" align="absmiddle"> 
                              <a href="../../Company/Com_VideoView.asp?Comid=<%= Comid %>" target="_blank"><font color="#ff6600">���Ÿ���ҵ��Ƶչʾ</font></a> 
                            </td>
                          </tr>
                        </table>
                        <% End if %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <table width="504" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><strong>��˾��飺</strong></td>
              </tr>
              <tr> 
                <td><%= Company_Memo %></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <% 
If Vip_Flag = True And DateDiff("d",Now(),Vip_Date)<=0 And DateDiff("d",Now(),Vip_EndDate)>=0 Then

 %>
            <table width="504" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><strong>��ϵ��ʽ��</strong></td>
              </tr>
              <tr> 
                <td>
                  <% If Not IsArray(Session("Person")) Then %>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="30">&nbsp;ע�Ტ��½����ܲ鿴��ҵ����ϵ��ʽ����<a href="../../Public/MemberLogin.asp">[<u>��ʼ��½</u>]</a>����<a href="../../Public/Register.asp">[<u>���ע��</u>]</a></td>
                    </tr>
                  </table>
                  <% Else %>
                  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">��ϵ�ˣ�</td>
                      <td height="25"><%= ContactPerson %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">��ϵ�绰��</td>
                      <td height="25"><%= Phone %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">������룺</td>
                      <td height="25"><%= CompanyFax %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">�����ַ��</td>
                      <td height="25"><%= Email %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">��ҵ��ַ��</td>
                      <td height="25"><%= WebHome %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">�������룺</td>
                      <td height="25"><%= ZipCode %></td>
                    </tr>
                    <tr bgcolor="#FFFFFF"> 
                      <td width="70" height="25" align="left">ͨѶ��ַ��</td>
                      <td height="25"><%= Address %></td>
                    </tr>
                  </table>
            <% 
End if
 %>
				  </td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <% 
End if
 %>
          </td>
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
