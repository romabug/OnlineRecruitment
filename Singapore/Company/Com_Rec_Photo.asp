<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Rs,Cmd,Tmp,Action
Dim Perid,UserName,UserType,Language_One,Language_Two,Mandarin,Skill_Memo,Computer,PhotoKeep,PhotoUrl
Action = Request.QueryString("action")
If Action <> "" Then 
 Select Case Action
  Case "submit"
   Call Submit()  '//��ת���������ݵĺ���
  Case "keep"
   Call Keep_Submit() '//��ת�����λ��߻ָ�ͼƬ�ĺ���
   Case "delphoto"
   Call Del_Submit() '//��ת��ɾ���ĺ���  
 End Select
End if

'//��ȡ��Ա��½�ı��
Username  = Session("Company")(0)
Comid     = Session("Company")(2)

'//���ô洢����
Set Cmd = Server.Createobject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Com_Dept"
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
'//�磺Tmp(0,0)��ʾ �û�������
CloseRs
Set Cmd = Nothing



 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- �ϴ���Ƶ������ͼƬ</title>
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
          <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25"><img src="../Images/icon.gif" width="11" height="11" align="absmiddle"> 
                  <%= Tmp(0,0) %> </td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
              <tr> 
                <td bgcolor="#FFFFFF"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="2"></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                    <tr> 
                      <td height="25" bgcolor="f5f5f5"> 
                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="50%"><b><font color="#000000">�ϴ���Ƶ����ͼƬ</font></b></td>
                            <td width="50%" align="right">&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td valign="top"><table width="98%" border="0" align="center" cellspacing="0" class="text01">
                          <form name="form" method="post" action="Com_Rec_PhotoUp.asp" enctype="multipart/form-data" >
                            <tr> 
                              <td>���ϴ�����ͼƬ��</td>
                            </tr>
                            <tr> 
                              <td> <input type="hidden" name="filepath" value="../Uploadfiles/CompanyVideoPhoto"> 
                                <input type="hidden" name="act" value="upload"> 
                                <input name="filename" style="font-family: ����; font-size: 12px" type="file" size="38"> 
                              </td>
                            </tr>
                            <tr> 
                              <td> 
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
                            <td><span style="font-family: ����; font-size: 12px">ͼƬӦ�ô���ɴ�СΪ80 
                              x 75 ���� .</span></td>
                          </tr>
                        </table></td>
                      <td width="35%" height="170" align="center" valign="top"> 
                        </td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="2"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form action="?action=submit" name="edit" method="post" onSubmit="return edit_check();">
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td height="40" align="center">&nbsp;</td>
                </tr>
              </form>
            </table></td>
        </tr>
      </table>

      <!--#include file="../Include/Footer.asp" -->
    </td>
  </tr>
</table>

</body>
</html>

