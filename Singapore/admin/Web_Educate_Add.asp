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
If Instr(1,Session("Web_Power"),"143") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If

Action = Request.QueryString("action")
If Action = "submit" Then Call Submit() '//���ñ������ݵĺ���

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/educate_Register2.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�����ѵ����</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
        <form action="?action=submit" name="reg" method="POST" onSubmit="return check_reg();">
          <tr> 
            <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#f1b5a1">
                <tr> 
                  <td valign="top" bgcolor="#FFFFFF"> <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                      <TBODY>
                        <TR> 
                          <TD class=font-14 height=3></TD>
                        </TR>
                        <TR> 
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��Ա�ʺ�</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                          �û����ƣ�</td>
                        <td width="220" height="30" bgcolor="#fff7f0"> <input name="username" type="text" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30" bgcolor="#fff7f0"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          </font><font color="#435049"> </font><font color="#999999"> 
                          </font></font></font></font></font><font color="#999999">(Ӣ����ĸ�����ֻ��»��ߣ�4~20���ַ�)</font><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          </font></font></font></font></font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          �û����룺</td>
                        <td width="220" height="30"> <input name="password" type="password" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30"><font color="#CC0000"><font color="#999999">(Ӣ����ĸ�����ֻ��»��ߣ�6λ���ϵ��ַ�</font></font>)</td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          �����ʼ���</td>
                        <td height="30"> <input name="mailbox" type="text" id="mailbox" size="26"></td>
                        <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          </font><font color="#435049"> </font><font color="#999999"> 
                          </font></font></font></font><font color="#999999">(��׼ȷ��д����E-MAIL��ַ)</font></td>
                      </tr>
                    </table>
                    <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                      <TBODY>
                        <TR> 
                          <TD class=font-14 height=3></TD>
                        </TR>
                        <TR> 
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��������</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ƣ�</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="schoolname" type="text" id="schoolname2" size="50" maxlength="50" style="width:200px;">
                          �磺<%= Cls_WebName&"��ѵ����" %></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������ڣ�</td>
                        <td height="30"> <input name="set_year" type="text" size="4" maxlength="4">
                          �� 
                          <select name="set_month">
                            <%for i=1 to 12%>
                            <option  value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          �� 
                          <select name="set_day">
                            <%for i=1 to 31%>
                            <option value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          �� </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ѵ����</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="properity" type="checkbox" id="properity2" value="��ҵ��ѵ">
                          ��ҵ��ѵ 
                          <input name="properity" type="checkbox" id="properity2" value="�ʸ���֤">
                          �ʸ���֤ 
                          <input name="properity" type="checkbox" id="properity2" value="IT��ѵ">
                          IT��ѵ 
                          <input name="properity" type="checkbox" id="properity2" value="������ѵ">
                          ������ѵ 
                          <input name="properity" type="checkbox" id="properity2" value="ѧ������">
                          ѧ������ 
                          <input name="properity" type="checkbox" id="properity2" value="������">
                          ������ </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ���ڵ�����</td>
                        <td height="30"> 
                          <!--#include file="../Include/Class_Locus.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ѵ������飺</td>
                        <td height="30" bgcolor="#fff7f0"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="school_memo" cols="50" rows="10" id="textarea"></textarea></td>
                              <td><font color="#50463d">����ַ���5000,�뾡������ϸ��д���ϣ���ȷ�����������˳��ͨ��������ˣ�������������������+�γ������;</font></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                      <TBODY>
                        <TR> 
                          <TD class=font-14 height=3></TD>
                        </TR>
                        <TR> 
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��ϵ��ʽ</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�ˣ�</td>
                        <td height="30"> <input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;"> 
                          <font color="#50463d">��������ȷ��ϵ�ˣ��Է�����Լ�ʱ��ϵ���磺��С���������</font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�绰��</td>
                        <td height="30" bgcolor="#fff7f0"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30"> 
                          <font color="#50463d"> [�̶��绰���룬�磺010-82615888] </font> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right">������룺</td>
                        <td height="30"><input name="fax" type="text" id="fax" style="width:120px;" size="30" maxlength="30"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �����ʼ���</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="email" type="text" id="email"  style="width:200px;" value="<%= Email %>" size="50"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right">��վ��ַ��</td>
                        <td height="30"> <input name="webhome" type="text" size="50" style="width:200px;" value="http://"></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������룺</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ͨѶ��ַ��</td>
                        <td height="30"> <input name="address" type="text" size="100" style="width:260px;">
                          �磺�����к������ɸ�·������ </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="40" align="center"> 
              <input type="submit" name="Submit" value=" �� �� " style="height:30px;"> 
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
UserName                     = Replace_Text(Request.Form("username"))
Password                     = Replace_Text(Request.Form("password"))
Password                     = Md5(Password)
Email                        = Replace_Text(Request.Form("email"))

Randomize timer
Znum = Cint(8999*Rnd+1000)
Schid = Cls_WebKey&gen_key(10)&Znum  '//��ԱID

LastIp = Request.Servervariables("Remote_Addr")

Set Rs = Server.createobject("ADODB.recordset")
Rs.open "Select username,Email,Schid From [pH_Educate_Base] Where username='"&username&"' or Email='"&Email&"' or Schid='"&Schid&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("username")=username or rs("Schid")=Schid then
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ�������ʺ��Ѿ�ʹ����,������ѡ���ʺŲ�����ע��...');history.back(-1);</script>"
		response.end
    end if
    if rs("Email") = Email then
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ���ϵͳ����ͬ��������,������ѡ�����䲢����ע��...');history.back(-1);</script>"
	  response.end
    end if

end if 


'//�ύ����
SchoolName                 = Replace_Text(Request.Form("SchoolName"))
Properity                  = Replace_Text(Request.Form("Properity"))
Set_Year                   = Replace_Text(Request.Form("Set_Year"))
Set_Month                  = Replace_Text(Request.Form("Set_Month"))
Set_Day                    = Replace_Text(Request.Form("Set_Day"))
School_Memo                = Replace_Text(Request.Form("School_Memo"))
ContactPerson              = Replace_Text(Request.Form("ContactPerson"))
Phone                      = Replace_Text(Request.Form("Phone"))
Fax                        = Replace_Text(Request.Form("Fax"))
Locus_Area                 = Replace_Text(Request.Form("x_suozaidi"))
Locus_City                 = Replace_Text(Request.Form("x_suozaidi1"))
Address                    = Replace_Text(Request.Form("Address"))
ZipCode                    = Replace_Text(Request.Form("ZipCode"))
WebHome                    = Replace_Text(Request.Form("WebHome"))


If School_Memo <> "" Then School_Memo = Replace(School_Memo,Chr(13),"<br>")

'//�������ݵ����ݿ�[pH_Educate_Base]��
SQL = "Insert Into [pH_Educate_Base] (Schid,Username,Password,SchoolName,Properity,Set_Year,Set_Month,Set_Day,School_Memo,ContactPerson,Phone,Fax,WebHome,ZipCode,Email,Address,Locus_Area,Locus_City,RegDate,LastIp,LastDate,LastUpdate_Time,LoginCount,Flag,VipFlag,VipLevel,ViewClicks,Lessons,Teachers,Websub) Values ('"&Schid&"','"&Username&"','"&Password&"','"&SchoolName&"','"&Properity&"',"&Set_Year&","&Set_Month&","&Set_Day&",'"&School_Memo&"','"&ContactPerson&"','"&Phone&"','"&Fax&"','"&WebHome&"','"&ZipCode&"','"&Email&"','"&Address&"','"&Locus_Area&"','"&Locus_City&"',getdate(),'"&LastIp&"',getdate(),getdate(),1,1,0,0,0,0,0,'www')"
Conn.Execute(SQL)  '//[pH_School_Base]��


 Response.Write "<script>alert('�������');location.href='Web_Educate_All.asp';</script>"
 Response.End()
End Sub


'//�ر����ݿ�����
CloseDB

 %>

