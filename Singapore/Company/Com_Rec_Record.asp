<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Public/Company_Cookies.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<% 
Dim Rs,Cmd,Tmp,Action
Dim Perid,UserName,UserType,RealName,JobContent


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
FlvName = Tmp(5,0)

'�жϸû�Ա�Ƿ��Ѿ�¼��
If FlvName <> "" Then
 Response.write "<script>alert('��¼���¼���֮ǰ������ɾ����¼�Ƶļ���');window.close();</script>"
 Response.End()
End if

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��Ƹ���� -- ����¼��</title>
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
          <td width="5">&nbsp;</td>
          <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="25"><img src="../Images/icon.gif" width="11" height="11" align="absmiddle"> 
                  <%= Tmp(0,0) %> </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <Form action="?action=del" method="post" name="theForm" onSubmit="return theForm_check()">
                <tr> 
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td bgcolor="#FFFFFF"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td height="2"></td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                            <tr> 
                              <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;������Ƶ¼��</font></b> 
                              </td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1">
                            <tr bgcolor="f9f9f9"> 
                              <td height="25" align="center" bgcolor="#FFFFFF"> 
                                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="620" height="400">
                                  <param name="movie" value="../Include/Class_record_Com.swf">
                                  <param name="quality" value="high">
                                  <embed src="../Include/Class_record_Com.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="620" height="400"></embed></object>
                              </td>
                            </tr>
                          </table>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td height="2"></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="40" align="left"><table width="620" border="0" align="center" cellpadding="2" cellspacing="0">
                      <tr> 
                        <td>����˵����</td>
                      </tr>
                      <tr> 
                        <td>1.ȷ��������Ƶ/��Ƶ�豸�Ƿ���;<br>
                          2.����ɫ¼�ư�ť,��ʼ¼��;<br>
                          3.¼���������&quot;������Ƶ&quot;,������һ��..������¼�Ƶ���Ƶ���ᶪʧ;<br>
                          4.��Ӧ��֤��¼�Ƶ������������Ϸ���ͬʱ���ַ����˵�Ф��Ȩ������Ȩ��֪ʶ��Ȩ���κκϷ�Ȩ��;<br>
                          5.<%= Cls_Webname %>�����Ϊ��¼�Ƶ����ݲ��ʵ�����Ȩɾ�������޸�.</td>
                      </tr>
                    </table> </td>
                </tr>
              </Form>
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
