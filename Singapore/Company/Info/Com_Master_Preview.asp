<!--#include file="../../Include/Class_Conn.asp" -->
<!--#include file="../../Include/Class_Main.asp" -->
<% 
Dim Comid,Username,Cmd,Rs,SQL
Dim SetDate,Properity,Industry,Currency_Str,Workers,Locus,LogoUrl,LogoKeep,Company_Memo
Dim ContactPerson,Phone,CompanyFax,Email,WebHome,Address,ZipCode
'//�ж��û��Ƿ��ǹ���Ա
If Session("Web_Suppername") = "" Then 
 Response.write "<script>alert('-��ǰ�û�û��Ȩ�޽��иò�����-');window.close();</script>"
 Response.End()
End if

'//��ȡ��Ա��½�ı��
'Username  = Session("Company")(0)
Comid     = Replace_Text(Request.QueryString("param"))
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
Phone             = Tmp(12,0)
CompanyFax        = Tmp(14,0)
Email             = Tmp(15,0)
WebHome           = Tmp(21,0)
Address           = Tmp(19,0)
ZipCode           = Tmp(20,0)

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
<title><%= Cls_WebName %> -- ��ҵ����Ԥ��</title>
</head>
<style>
.buttonstyle {
	BORDER-RIGHT: #ffffff 0px solid; BORDER-TOP: #ffffff 0px solid; BACKGROUND-IMAGE: url(../../Images/input_bg2.jpg); FONT: 12px ����; BORDER-LEFT: #ffffff 0px solid; WIDTH: 135px; CURSOR: hand; COLOR: #333333; BORDER-BOTTOM: #ffffff 0px solid; HEIGHT: 22px; BACKGROUND-COLOR: #e7e7e7
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
                <td>&nbsp;</td>
              </tr>
            </table></td>
          <td width="1" bgcolor="#cfd0cf"></td>
          <td width="10"></td>
          <td width="554" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="25" align="center"><img src="../../Images/Company/arrow1.gif" width="13" height="9"></td>
                      <td height="25" class="font-14"><b><%= Tmp(0,0) %></b></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="10" background="../../Images/Company/bg.gif"></td>
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
                            <td height="6"></td>
                          </tr>
                          <tr> 
                            <td align="center"> 
                              <% 
If LogoKeep = 0 Then
 If LogoUrl <> Null or LogoUrl <> "" Then
  Response.write "<img src=""../../UpLoadFiles/CompanyFile/"&LogoUrl&""" width=""135"" height=""160"">"
 Else
  Response.write "<img src=""../../UpLoadFiles/DefaultFile/Company.gif"" width=""135"" height=""160"">"
 End if
Else
 Response.Write "ͼƬ������"
End if
 %>
                            </td>
                          </tr>
                          <tr> 
                            <td height="6"></td>
                          </tr>
                        </table></td>
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
            <table width="504" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><strong>��ϵ��ʽ��</strong></td>
              </tr>
              <tr> 
                <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
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
                  </table></td>
              </tr>
              <tr> 
                <td height="10"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#FF821E" height="2"></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
              <tr align="center" bgcolor="FFEDDF"> 
                <td width="35%" height="25">ְλ����</td>
                <td width="15%" height="25">�����ص�</td>
                <td width="18%" height="25">��������</td>
                <td width="18%" height="25">��Ч����</td>
                <td height="25">��Ƹ����</td>
              </tr>
              <% 
SQL = "Select Jobid,JobName,Work_Area,Work_City,LastUpdate_Time,End_Date,Number From [pH_Job_Base] Where Comid='"&Comid&"' And JobFlag=1 And End_Date>=getdate() Order By LastUpdate_Time Desc,JobId Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open SQL,Conn,1,1
Rs.Pagesize = 20
Psize       = Rs.PageSize
PCount      = Rs.PageCount
RCount      = Rs.RecordCount

PageNo = Cint(Request.QueryString("PageNo"))
If PageNo < 1 Then
 PageNo = 1
Elseif PageNo > PCount Then
 PageNo = PCount
End if
If Not Rs.Eof Then Rs.AbsolutePage = PageNo

For i = 1 to Psize
  If Rs.Eof Then Exit For
  Jobid       = Rs("Jobid")
  JobName     = Rs("JobName")
  Address	  = Rs("Work_Area")&Rs("Work_City")
  BeginDate	  = FormatDatetime(Rs("LastUpdate_Time"),2)
  EndDate	  = Rs("End_Date")
  Numbers	  = Rs("Number")
  If Numbers = 0 Then Numbers = "������"
 %>
              <tr align="center" bgcolor="#FFFFFF"> 
                <td height="25"><a href="Com_Master_JobView.asp?Comid=<%= Comid %>&Param=<%= Jobid %>" target="_blank"><%= JobName %></a></td>
                <td height="25"><%= Address %></td>
                <td width="17%" height="25"><%= BeginDate %></td>
                <td height="25"><%= EndDate %></td>
                <td height="25"><%= Numbers %></td>
              </tr>
              <tr bgcolor="#FFFFFF"> 
                <td height="1" colspan="5" bgcolor="#dddddd"></td>
              </tr>
              <% 
  Rs.Movenext
 Next
 %>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tr> 
                <td width="50%" height="25">��<Font color="#FF0000"><%= RCount %></Font>�� 
                  ��<Font color="#FF0000"><%= PCount %></Font>ҳ | ��ǰ��<Font color="#FF0000"><%= PageNo %></Font>ҳ</td>
                <td width="50%" align="right"> 
                  <% 
		  If PageNo > 1 Then
		   Response.write "<a href=""?PageNo=1&Param="&Comid&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PageNo-1&"&Param="&Comid&""">��ҳ</a>&nbsp;"    
		  Else
		   Response.write "��ҳ&nbsp;"
		   Response.write "��ҳ&nbsp;" 
		  End if
		 
		  If PageNo < PCount Then
		   Response.write "<a href=""?PageNo="&PageNo+1&"&Param="&Comid&""">��ҳ</a>&nbsp;"
		   Response.write "<a href=""?PageNo="&PCount&"&Param="&Comid&""">βҳ</a>"   
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
