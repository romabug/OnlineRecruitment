<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action,LogoUrl,LogoKeep

Action = Request.QueryString("action")
If Action <> "" Then 
 Select Case Action
  Case "keep"
   Call Keep_Submit() '//��ת�����λ��߻ָ���Ƭ�ĺ���
   Case "dellogo"
   Call Del_Submit() '//��ת��ɾ���ĺ���  
 End Select
End if

'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Logo"
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
'//0��ҵ����,1ͼƬ�ļ���,2ͼƬ����
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�ر����ݿ�����
CloseRs
Set Cmd = Nothing

'//���ܴ���
LogoUrl        = Tmp(1,0)
LogoKeep       = Tmp(2,0)
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="JavaScript" src="../js/Company_Basicinfo.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ��ҵͼƬ��ʶ</title>
</head>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_manage.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="4"></td>
        </tr>
      </table>
      <table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="175" valign="top">
            <!--#include file="../Lefter/Company_BasicInfo.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
              <tr> 
                <td bgcolor="#FFFFFF"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="2"></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                    <tr> 
                      <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ҵͼƬ��ʶ</font></b></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td valign="top"><table width="98%" border="0" align="center" cellspacing="0" class="text01">
                          <form name="form" method="post" action="Com_Logo_LogoUp.asp" enctype="multipart/form-data" >
                            <tr> 
                              <td>���ϴ���ҵͼƬ��ʶ��</td>
                            </tr>
                            <tr> 
                              <td> <input type="hidden" name="filepath" value="../Uploadfiles/CompanyFile"> 
                                <input type="hidden" name="act" value="upload"> 
                                <input name="filename" style="font-family: ����; font-size: 12px" type="file" size="38"> 
                              </td>
                            </tr>
                            <tr> 
                              <td> <input type="button" name="Submit22" value="ɾ��ͼƬ"  onClick="location.href='?action=dellogo';"> 
                                <% If LogoKeep = 0 Then %>
                                <input type="button" name="Submit2" value="����ͼƬ"  onClick="location.href='?action=keep&keepid=1';"> 
                                <% Else %>
                                <input type="button" name="Submit2" value="�ָ�ͼƬ"  onClick="location.href='?action=keep&keepid=0';"> 
                                <% End if %>
                                <input name="Send2" style="font-family: ����; font-size: 12px" type="submit" value="�ϴ�ͼƬ"> 
                              </td>
                            </tr>
                          </form>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td>�ϴ�˵��<font color="#666666">��</font></td>
                          </tr>
                          <tr> 
                            <td>����ͼƬһ��Ϊ<font face="Verdana">JPG</font>��<font face="Verdana">JPEG</font>����<font face="Verdana">GIF</font>��ʽ 
                              ;</td>
                          </tr>
                          <tr> 
                            <td><span style="font-family: ����; font-size: 12px">ͼƬ��С���ܳ���100K 
                              ; </span></td>
                          </tr>
                          <tr> 
                            <td><span style="font-family: ����; font-size: 12px">ͼƬӦ�ô���ɴ�СΪ135 
                              x 160 ���� .</span></td>
                          </tr>
                        </table></td>
                      <td width="35%" height="170" align="center" valign="top"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="4"></td>
                          </tr>
                          <tr> 
                            <td align="center"> 
                              <% 
If LogoKeep = 0 Then
 If LogoUrl <> Null or LogoUrl <> "" Then
  Response.write "<img src=""../UpLoadFiles/CompanyFile/"&LogoUrl&""" width=""135"" height=""160"">"
 Else
  Response.write "<img src=""../UpLoadFiles/DefaultFile/Company.gif"" width=""135"" height=""160"">"
 End if
Else
 Response.Write "ͼƬ������"
End if
 %>
                            </td>
                          </tr>
                          <tr> 
                            <td height="4"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
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
Sub Keep_Submit()     '//���κͻָ�ͼƬ�ĺ���
 'Call Check_url()    '��ֹ�ⲿվ���ύ����
 '//�ύ����
 Comid                = Session("Company")(2)
 Paramid              = Replace_Text(Request.QueryString("keepid"))
 Check_Id(Paramid)
 
 SQL = "Update [pH_Company_Base] Set LogoKeep="&Paramid&",LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)

 CloseDB
 Response.redirect "Com_Logo.asp"
End Sub

Sub Del_Submit()      '//ɾ��ͼƬ����
 '//�ύ����
 Comid                = Session("Company")(2)
 Set Rs = Conn.Execute("Select LogoUrl From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Rs(0) = Null or Rs(0) = "" Then
    CloseRs
    CloseDB
    Response.redirect "Com_Logo.asp"
 Else
     '//ɾ��ͼƬ�ļ�
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/CompanyFile/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/CompanyFile/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Company_Base] Set LogoUrl=Null,LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
    Conn.Execute(SQL)

	CloseRs
    CloseDB
    Response.redirect "Com_Logo.asp"
 End if
 
End Sub

 %>
