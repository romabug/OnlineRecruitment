<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action


'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_UserCenter"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Comid",200,1,30)
Cmd.Parameters("@Comid") = Comid
Set Rs = Cmd.Execute
If Rs.Eof Then
 Rs.Close
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����

'//0��ҵ����,1��½����,2����½ʱ��,3����ʱ��,4VIP���,5VIP��ͨʱ��,6VIP����,7��ֹʱ��,8��Ա״̬,9������Ƶ,10��Ƶ��ͨʱ��,11��ֹʱ��,12,������ϵ��ʽ����,13����ְλ����
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�رռ�¼������
Rs.Close
Set Cmd = Nothing

CompanyName           = Tmp(0,0)
LoginCount            = Tmp(1,0)
LastDate              = Tmp(2,0)
LastUpdate_Time       = Tmp(3,0)
Vip_Flag              = Tmp(4,0)
Vip_Date              = Tmp(5,0)
Vip_Level             = Tmp(6,0)
Vip_EndDate           = Tmp(7,0)
Flag                  = Tmp(8,0)
Nc_Video              = Tmp(9,0)
Video_Date            = Tmp(10,0)
Video_EndDate         = Tmp(11,0)
Vip_Clicks			  = Tmp(12,0)
Vip_Jobs			  = Tmp(13,0)
'��ȡ��Ա�����
Level_Str = ""
Click_Str = ""
If Flag = True Then '�Ѿ�ͨ�����
 If Vip_Flag = True Then '�Ǹ߼���Ա
  If DateDiff("d",Vip_Date,Date()) >= 0 And DateDiff("d",Vip_EndDate,Date()) <= 0 Then
   Level_Str = "����<font color=#ff0000>�߼��շѻ�Ա</font>["&FormatDateTime(Vip_Date,2)&" �� "&FormatDateTime(Vip_EndDate,2)&"],�����Է���<u>"&Vip_Jobs&"</u>����Ƹְλ"
   Click_Str = "<tr><td height=""25""><img src=""../Images/icon2.gif"" width=""12"" height=""16"">"
   Click_Str = Click_Str&" �߼���Ա��������ҵĿǰ�����Բ鿴<u>"&Vip_Clicks&"</u>λ�˲ŵ���ϵ��ʽ,<a href=Com_VipClicks.asp><u>��ϸ��¼</u></a> ;"
   Click_Str = Click_Str&"</td></tr>"
  Else
   Level_Str = "����<font color=#ff0000>�����շѻ�Ա</font>[����ʱ�䣺"&FormatDateTime(Vip_EndDate,2)&"]"
  End if
 Else '��ѻ�Ա
   Level_Str = "����<font color=#ff0000>��ѻ�Ա</font>[��Ƹ�Ĳ��ֹ����ܵ�����]"
 End if
Else
   Level_Str = "����<font color=#ff0000>δ��˻�Ա</font>[��Ƹ�Ĳ��ֹ����ܵ�����]"
End if

'�жϻ�Ա�Ƿ�����Ƶ
Video_Str = ""
If Nc_Video = True Then

 If DateDiff("d",Video_Date,Date()) >= 0 And DateDiff("d",Video_EndDate,Date()) <= 0 Then
  Video_Str = "��ͨʱ�䣺<u>"&Formatdatetime(Video_Date,2)&"</u> ��ֹʱ�䣺<u>"&Formatdatetime(Video_EndDate,2)&"</u>"
 Elseif DateDiff("d",Video_EndDate,Date()) > 0  Then
  Video_Str = "�Ѿ���ֹ����ֹʱ�䣺<u>"&Formatdatetime(Video_EndDate,2)&"</u>"
 End if
 
Else
 Video_Str = "������ҵû��������Ƶ��<a href=Com_Rec_Record.asp target=_blank>������￪ʼ¼����Ƶ</a>"
End if

'��ȡ��Чְλ
Job_Num      = 0
ViewClicks   = 0
SQL = "Select Count(Jobid),Sum(ViewClicks) From [pH_Job_Base] Where Comid='"&Comid&"' And JobFlag=1 And DateDiff(d,End_Date,GetDate())<=0"
Set Rs = Conn.Execute(SQL)
If Not Rs.Eof Then
 Job_Num      = Rs(0)
 ViewClicks   = Rs(1)
End if
Rs.Close

'��ȡ�ռ����ż���
InBox_Num          = 0 
InBox_NewNum       = 0
'�ռ����ż���
Set Rs = Conn.Execute("Select Count(*) From [pH_Company_InBox] Where Comid='"&Comid&"'")
If Not Rs.Eof Then InBox_Num = Rs(0)
Rs.Close
'�ռ������ż���
Set Rs = Conn.Execute("Select Count(*) From [pH_Company_InBox] Where Comid='"&Comid&"' And Flag=0")
If Not Rs.Eof Then InBox_NewNum = Rs(0) 
Rs.Close

'��ȡ�˲ſ�����
PersonDB_Num          = 0 

Set Rs = Conn.Execute("Select Count(*) From [pH_Company_PersonDB] Where Comid='"&Comid&"'")
If Not Rs.Eof Then PersonDB_Num = Rs(0)
Rs.Close
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ����</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td width="175" valign="top"> 
            <!--#include file="../Lefter/Company_BasicInfo.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
              <tr> 
                <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;�ʺ���Ϣ</font></b></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  �𾴵�<%= Cls_WebName %>�û���<font color=#ff0000><%= CompanyName %></font>����ӭ��������ҵ��Ƹ�������� 
                </td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  ��Ա���<%= Level_Str %> ;</td>
              </tr>
              <%= Click_Str %> 
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  ��ҵ��Ƶ��<%= Video_Str %></td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  �ϴε�¼ʱ�䣺<u><%= LastDate %></u> ����¼������ <u><%= LoginCount %></u> �� ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  �������<%= Cls_WebName %>���κ�������߽��飬��<a href="../Public/Feedback.asp" target="_blank">�������</a>�������Ŀ��� 
                  .</td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
              <tr> 
                <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��Ƹ��Ϣ</font></b></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  ְλ��Ϣ��<font color=#ff0000><u><%= Job_Num %></u></font> ����Чְλ ,����ְ���ܼ���� <font color=#ff0000><u><%= ViewClicks %></u></font> �� ,<a href="Com_JobManage.asp"><u>��˲鿴</u></a> ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  �ռ������� <font color=#ff0000><u><%= InBox_Num %></u></font> ��ӦƸ�ʼ������� <font color=#ff0000><u><%= InBox_NewNum %></u></font> �������ʼ� ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  ��ҵ�˲ſ��� <font color=#ff0000><u><%= PersonDB_Num %></u></font> �ݼ��� ,<a href="Com_PersonDB.asp"><u>��˲鿴</u></a>  .</td>
              </tr>
            </table>
            
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
              <tr> 
                <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��������</font></b></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  <a href="Com_FastSearch.asp">��������</a> ֻ��ָ�����ٵ������������ܿ��ٵ���������ҵ������˲� 
                  ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  <a href="Com_Searcher.asp">������</a> ���Խ����õ������������棬�ܿ��ٵİ�Ԥ�����������������ʵ��˲� 
                  ; </td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  Ϊ��������� <a href="Com_AllSearch.asp">��ϸ����</a> <a href="Com_ClassSearch.asp">��������</a> 
                  ��ǿ������������棬���������ҵ������˲� .</td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd">
              <tr> 
                <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;������Ϣ</font></b></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  �뽫<a href="Com_BasicInfo.asp">��ҵ������Ϣ</a>��<a href="Com_Dept.asp">������Ϣ</a>��<a href="Com_Logo.asp">��ҵͼƬ</a>����д���� 
                  ,�Դﵽ���õ���ƸЧ�� ;</td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  <a href="http://www.chsi.com.cn/xlcx/" target="_blank">ȫ���ߵȽ���ѧ����ѯ</a>; 
                </td>
              </tr>
              <tr> 
                <td height="25"><img src="../Images/icon2.gif" width="12" height="16"> 
                  �������ʹ�ù��������κ����⻶ӭ��ʱ<a href="../Public/Contact.asp">��ϵ����</a> .</td>
              </tr>
            </table></td>
        </tr>
      </table>
      
      <!--#include file="../Include/Footer.asp" -->
</td>
  </tr>
</table>
</body>
</html>
<% 
'//�ر����ݿ�����
CloseDB
 %>
