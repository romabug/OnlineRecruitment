<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<!--#include file="Web_Session.asp" -->
<% 
Dim Action,Comid,PageNo
Dim TypeId,TypeName,News
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"22") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//���ñ������ݵĺ���

Corid     = Replace_Text(Request.QueryString("Corid"))
PageNo    = Request.QueryString("PageNo")
'//���ô洢����
Set Cmd = Server.CreateObject("ADODB.Command")
Cmd.ActiveConnection = Conn
Cmd.CommandText = "Inr_BasicInfo"
Cmd.CommandType = 4
Cmd.Parameters.Append Cmd.CreateParameter("@Corid",200,1,30)
Cmd.Parameters("@Corid") = Corid
Set Rs = Cmd.Execute
If Rs.Eof Then
 CloseRs
 Set Cmd = Nothing
 CloseDB
 Response.write "û���ҵ���Ա���ϣ�"
 Response.End()
End if

Tmp = Rs.GetRows() '//��������䵽����

'//CorpName,Content,ContactPerson,Phone,Mt,Fax,WebHome,ZipCode,Email,Address,Locus_Area,Locus_City
'//�� Tmp(0,0) ��ʾ����
CloseRs
Set Cmd = Nothing

'//���ܴ���
CorpName                = Tmp(0,0)
Content                 = Tmp(1,0)
ContactPerson           = Tmp(2,0)
Phone                   = Tmp(3,0)
Mt						= Tmp(4,0)
Fax                     = Tmp(5,0)
WebHome                 = Tmp(6,0)
ZipCode                 = Tmp(7,0)
Email                   = Tmp(8,0)
Address                 = Tmp(9,0)
Locus_Area              = Tmp(10,0)
Locus_City              = Tmp(11,0)
CorpType				= Tmp(12,0)
Phone2					= Tmp(13,0)
QQ						= Tmp(14,0)
Msn						= Tmp(15,0)

If Content <> "" Then Content = Replace(Content,"<br>",Chr(13))
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/Intro_Basicinfo.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg">&nbsp;<font color="#FFFFFF">�� <strong>�༭��Ϣ</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="600" border="0" cellspacing="0" cellpadding="0">
        <form action="?action=submit" name="edit" method="post" onSubmit="return form_check();">
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
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;������Ϣ</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �н����ƣ�</td>
                        <td height="25"><input name="corpname" type="text" id="corpname" size="50" maxlength="50" style="width:200px;" value="<%= Corpname %>"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">�н����ʣ�</td>
                        <td height="25"><select name="corptype" id="corptype">
                            <option value="ְҵ����" <% If CorpType = "ְҵ����" Then Response.Write "Selected" %>>ְҵ����</option>
                            <option value="��������" <% If CorpType = "��������" Then Response.Write "Selected" %>>��������</option>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���ڵ�����</td>
                        <td height="25"> 
                          <!--#include file="../Include/Class_Locus2.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �н��飺</td>
                        <td height="25" bgcolor="f9f9f9"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="75%"> <textarea name="content" cols="45" rows="8" id="content"><%= content %></textarea></td>
                              <td><font color="#50463d">����ַ���5000,�뾡������ϸ��д���ϣ���ȷ��������˳��ͨ��������ˣ�</font></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="2"></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
                      <tr> 
                        <td height="25" bgcolor="f5f5f5"><b><font color="#000000">&nbsp;��ϵ��ʽ</font></b></td>
                      </tr>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�ˣ�</td>
                        <td height="25"> <input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;" value="<%= Contactperson %>"> 
                          <font color="#50463d">��������ȷ��ϵ�ˣ��Է�����Լ�ʱ��ϵ</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">�ƶ��绰��</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="mt" type="text" id="mt" style="width:120px;" size="30" maxlength="30" value="<%= Mt %>"></td>
                      </tr>
                      <tr> 
                        <td width="18%" height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�绰��</td>
                        <td height="25"> <input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30" value="<%= Phone %>"> 
                          <font color="#50463d"> [�̶��绰���룬�磺010-82615888] </font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">������룺</td>
                        <td height="25"> <input name="fax" type="text" id="fax" style="width:120px;" size="30" maxlength="30" value="<%= Fax %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9">QQ���룺</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="qq" type="text" id="qq" style="width:120px;" size="30" maxlength="30" value="<%= QQ %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">MSN��ַ��</td>
                        <td height="25"> <input name="msn" type="text" id="msn" style="width:120px;" size="30" maxlength="30" value="<%= MSN %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �����ʼ���</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="email" type="text" id="email"  style="width:200px;" value="<%= Email %>" size="50"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">��վ��ַ��</td>
                        <td height="25"> <input name="webhome" type="text" size="50" style="width:200px;" value="<%= Webhome %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="f9f9f9"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������룺</td>
                        <td height="25" bgcolor="f9f9f9"> <input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"  value="<%= Zipcode %>"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ͨѶ��ַ��</td>
                        <td height="25"> <input name="address" type="text" size="100" style="width:260px;" value="<%= Address %>">
                          �磺�����к������ɸ�·������ </td>
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
            <td height="40" align="center"><input type="hidden" name="corid" value="<%= Corid %>"> 
			<input type="hidden" name="pageno" value="<%= PageNo %>"> 
              <input type="submit" name="Submit" value=" ������Ϣ " style="height:35px;"> 
            </td>
          </tr>
        </form>
      </table></td>
</tr>
</table>
</body>
</html>
<% 

Sub Submit() '������ҵ��������
 
 Corid					 = Replace_Text(Request.Form("Corid"))
 PageNo					 = Replace_Text(Request.Form("PageNo"))
 CorpName                = Replace_Text(Request.Form("CorpName"))
 Content	             = Replace_Text(Request.Form("Content"))
 ContactPerson           = Replace_Text(Request.Form("ContactPerson"))
 Phone                   = Replace_Text(Request.Form("Phone"))
 Mt						 = Replace_Text(Request.Form("mt"))
 Fax                     = Replace_Text(Request.Form("Fax"))
 WebHome                 = Replace_Text(Request.Form("WebHome"))
 ZipCode                 = Replace_Text(Request.Form("ZipCode"))
 Email                   = Replace_Text(Request.Form("Email"))
 Address                 = Replace_Text(Request.Form("Address"))
 Locus_Area              = Replace_Text(Request.Form("x_suozaidi"))
 Locus_City              = Replace_Text(Request.Form("x_suozaidi1"))
 CorpType				 = Replace_Text(Request.Form("CorpType"))
 Phone2					 = Replace_Text(Request.Form("phone2")) 
 QQ						 = Replace_Text(Request.Form("qq"))
 MSN					 = Replace_Text(Request.Form("msn"))

 If Content <> "" Then Content = Replace(Content,Chr(13),"<br>")
 
 SQL = "Update [pH_Intro_Base] Set CorpName='"&CorpName&"',CorpType='"&CorpType&"',Content='"&Content&"',ContactPerson='"&ContactPerson&"',Phone='"&Phone&"',Phone2='"&Phone2&"',Mt='"&Mt&"',Fax='"&Fax&"',QQ='"&QQ&"',MSN='"&Msn&"',WebHome='"&WebHome&"',ZipCode='"&ZipCode&"',Email='"&Email&"',Address='"&Address&"',Locus_Area='"&Locus_Area&"',Locus_City='"&Locus_City&"',LastUpdate_Time='"&Now()&"' Where Corid='"&Corid&"'"
 Conn.Execute(SQL)
 
 Response.Write "<script>alert('�༭���');location.href='"&PageNo&"';</script>"
End Sub

'//�ر����ݿ�����
CloseDB
 %>

