<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<% 
Dim Comid,Username,Tmp
Dim Cmd,Rs,Action,LogoUrl,LogoKeep

Action = Request.QueryString("action")
If Action = "submit" Then 
 Call Submit() 
Elseif Action = "del" Then
 Call Del_Submit() 
Elseif Action = "delphoto" Then
 Call DelPhoto_Submit() '//��ת��ɾ���ĺ���  
End if

'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)
'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Video"
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
'//0��ҵ����,1������Ƶ,2��Ƶ״̬,3��ͨʱ��,4��ֹʱ��,5��Ƶ�ļ�,6ͼƬ�ļ�
'//�� Tmp(0,0) ��ʾ��ҵ����
'//�ر����ݿ�����
CloseRs
Set Cmd = Nothing

'//���ܴ���
Nc_Video        = Tmp(1,0)
Video_Flag      = Tmp(2,0)
Video_Date      = Tmp(3,0)
Video_EndDate   = Tmp(4,0)
Video_File      = Tmp(5,0)
Video_PhotoUrl  = Tmp(6,0)

Video_Str = ""
If Nc_Video = True Then
 Video_FlagStr = "" '��Ƶչʾ������
 Select Case Video_Flag
  Case 0:Video_FlagStr = "������"
  Case 1:Video_FlagStr = "<font color=#666666>�Ի�Ա����</font>"
  Case 2:Video_FlagStr = "<font color=#ff0000>������</font>"
 End Select
 If DateDiff("d",Video_Date,Date()) >= 0 And DateDiff("d",Video_EndDate,Date()) <= 0 Then
  Video_Str = "������Ƶչʾ��ͨʱ�䣺"&Formatdatetime(Video_Date,2)&"��ֹʱ�䣺"&Formatdatetime(Video_EndDate,2)&" <a href=?action=del>ɾ����Ƶչʾ</a>"
 Elseif DateDiff("d",Video_EndDate,Date()) > 0  Then
  Video_Str = "������Ƶչʾ��ֹ����ֹʱ�䣺"&Formatdatetime(Video_EndDate,2)&" <a href=?action=del>ɾ����Ƶչʾ</a>"
 End if

ElseIf Nc_Video = False And Video_File <> "" Then
 Video_Str = "��¼�Ƶ���Ƶչʾ��ʱû��ͨ����վ��ˣ�<a href=?action=del>�������ɾ���ļ�����¼����Ƶ</a>"
Else
 Video_Str = "����û��������Ƶչʾ��<a href=Com_Rec_Record.asp target=_blank>�����������¼����Ƶ</a>"
End if

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ��ҵ��Ƶչʾ</title>
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
            <!--#include file="../Lefter/Company_Video.asp" -->
          </td>
          <td width="5">&nbsp;</td>
          <td valign="top">
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
              <tr> 
                <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="2"></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                    <tr> 
                      <td height="25" bgcolor="f5f5f5"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="50%"><b><font color="#000000">&nbsp;��ҵ��Ƶչʾ</font></b></td>
                            <td width="50%" align="right"> <a href="Com_Rec_Record.asp" target="_blank"><u><font color="#FF0000">������Ƶ¼��</font></u></a> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="25" align="left">&nbsp;<%= Video_Str %></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="2"></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <% If Video_File <> "" Then %>
                    <tr align="left"> 
                      <td height="25" colspan="2" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="5"></td>
                          </tr>
                          <tr> 
                            <td align="center"> <TABLE borderColor=#e8e8e8 
                                align=center border=10>
                                <TBODY>
                                  <TR> 
                                    <TD bgColor=#999999><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="240" height="200">
                                        <param name="movie" value="../Include/Class_flvplayer.swf?file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>">
                                        <param name="quality" value="high">
                                        <embed src="../Include/Class_flvplayer.swf?file=../UpLoadFiles/Com_VideoFile/<%= Video_File %>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="240" height="200"></embed></object></TD>
                                  </TR>
                                </TBODY>
                              </TABLE></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <% Else %>
                    <tr align="left"> 
                      <td height="25" colspan="2">&nbsp;����û��������Ƶչʾ��<a href=Com_Rec_Record.asp target=_blank>�����������¼����Ƶ</a></td>
                    </tr>
                    <% End if %>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                    <tr> 
                      <td height="25" bgcolor="f5f5f5"><b><font color="#000000">��Ƶ����</font></b></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="2"></td>
                    </tr>
                  </table>
                  <% If Nc_Video = True Then %>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td valign="top"><table width="98%" border="0" align="center" cellspacing="0" class="text01">
                          <form name="form" method="post" action="Com_Rec_PhotoUp.asp" enctype="multipart/form-data" >
                            <tr> 
                              <td>���ϴ�����ͼƬ��</td>
                            </tr>
                            <tr> 
                              <td> <input type="hidden" name="filepath" value="../Uploadfiles/CompanyVideoPhoto"> 
                                <input type="hidden" name="back" value="1"> <input type="hidden" name="act" value="upload"> 
                                <input name="filename" style="font-family: ����; font-size: 12px" type="file" size="38"> 
                              </td>
                            </tr>
                            <tr> 
                              <td> <input type="button" name="Submit22" value="ɾ��ͼƬ"  onClick="location.href='?action=delphoto';"> 
                                <input name="Send2" style="font-family: ����; font-size: 12px" type="submit" value="�ϴ�ͼƬ"></td>
                            </tr>
                          </form>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                            <td><span style="font-family: ����; font-size: 12px">ͼƬӦ�ô���ɴ�СΪ80 
                              x 75 ���� .</span></td>
                          </tr>
                        </table></td>
                      <td width="35%" height="170" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="4"></td>
                          </tr>
                          <tr> 
                            <td align="center"> 
                              <% 

 If Video_PhotoUrl <> Null or Video_PhotoUrl <> "" Then
  Response.write "<img src=""../UpLoadFiles/CompanyVideoPhoto/"&Video_PhotoUrl&""" width=""80"" height=""75"" class=photoborder>"
 End if

 %>
                            </td>
                          </tr>
                          <tr> 
                            <td height="4"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="25" align="left" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> <font color="#000000">��Ƶ</font>���ԣ���ǰ����Ϊ<u><%= Video_FlagStr %></u>;</td>
                    </tr>
                    <tr> 
                      <td height="25" align="right"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <form action="?action=submit" name="theForm" method="post">
                            <tr> 
                              <td height="25"> <input type="radio" name="flag" value="0" <% If Video_Flag = 0 Then Response.write "Checked" %>>
                                ��ȫ���� ;</td>
                            </tr>
                            <tr> 
                              <td height="25"> <input type="radio" name="flag" value="1" <% If Video_Flag = 1 Then Response.write "Checked" %>>
                                ֻ����ҵ��Ա���� ;</td>
                            </tr>
                            <tr> 
                              <td height="25"> <input type="radio" name="flag" value="2" <% If Video_Flag = 2 Then Response.write "Checked" %>>
                                ��ȫ���� ;</td>
                            </tr>
                            <tr> 
                              <td height="25"><input type="submit" name="Submit" value=" �� �� �� �� " ></td>
                            </tr>
                          </form>
                        </table></td>
                    </tr>
                  </table>
                  <% ElseIf Nc_Video = False And Video_File <> "" Then %>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td>&nbsp;��¼�Ƶ���Ƶչʾ��ʱû��ͨ����վ��ˣ�<a href=?action=del>�������ɾ��չʾ����¼��</a></td>
                    </tr>
                  </table>
                  <% Else %>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td>&nbsp;����û��������Ƶչʾ��<a href=Com_Rec_Record.asp target=_blank>�����������¼����Ƶ</a></td>
                    </tr>
                  </table>
                  <% End if %>
                </td>
              </tr>
            </table> </td>
        </tr>
      </table>

<!--#include file="../Include/Footer.asp" -->
	  </td>
  </tr>
</table>

</body>
</html>
<% 
Sub Submit() '������Ƶ״̬
 Comid = Session("Company")(2) 
 Flag = Replace_Text(Request.Form("flag"))
 
 SQL = "Update [pH_Company_Base] Set Video_Flag="&Flag&",LastUpdate_Time=getdate() Where Comid='"&Comid&"'"
 Conn.Execute(SQL)
 
 CloseDB
 Response.redirect "Com_Video.asp"
End Sub


Sub Del_Submit()'ɾ����Ƶ�ļ�

 Comid = Session("Company")(2)
 Set Rs = Conn.Execute("Select Video_File From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Rs(0) = Null or Rs(0) = "" Then
    CloseRs
    CloseDB
    Response.redirect "Com_Video.asp"
	Response.End()
 Else
     '//ɾ���ļ�
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/Com_VideoFile/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/Com_VideoFile/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Company_Base] Set Nc_Video=0,Video_Date=Null,Video_EndDate=Null,Video_File=Null,Video_PhotoUrl=Null Where Comid='"&Comid&"'"
    Conn.Execute(SQL)
	CloseDB
    Response.write "<script>alert('-�Ѿ��ɹ���ɾ��������Ƶ�ļ���-');location.href='Com_Video.asp';</script>"
	Response.End()
 End if

End Sub


Sub DelPhoto_Submit()      '//ɾ����Ƭ
 '//�ύ����
 Comid = Session("Company")(2)
 Set Rs = Conn.Execute("Select Video_PhotoUrl From [pH_Company_Base] Where Comid='"&Comid&"'")
 If Rs(0) = Null or Rs(0) = "" Then
    CloseRs
    CloseDB
    Response.redirect "Com_Video.asp"
 Else
     '//ɾ��ͼƬ�ļ�
    Set Fso = Server.createobject("Scripting.FileSystemObject")
	If Fso.FileExists(Server.Mappath("../UpLoadFiles/CompanyVideoPhoto/"&Rs(0))) Then
	   Fso.DeleteFile(Server.Mappath("../UpLoadFiles/CompanyVideoPhoto/"&Rs(0)))
	End if
	
	SQL = "Update [pH_Company_Base] Set Video_PhotoUrl=Null Where Comid='"&Comid&"'"
    Conn.Execute(SQL)
 
	CloseRs
    CloseDB
    Response.redirect "Com_Video.asp"
 End if
End Sub

 %>
