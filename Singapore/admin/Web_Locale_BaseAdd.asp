<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="Web_Session.asp" -->

<% 
Dim Action,Comid,PageNo
Dim CompanyName,Content,Property1,Products,ContactPerson,Phone,Address,InfoFrom,Licence,AddDate,Operation,InviteDate,Memo,Fax,Bus,Owner
'//����Ƿ��վ
Call Check_url()
'//������Ա�Ƿ���Ȩ�޲�����ҳ��
If Instr(1,Session("Web_Power"),"170") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
Comid  = Replace_text(request("Comid"))
PageNo = Replace_text(request("pageno"))

Select Case Action
 Case "edit"
  Call Edit_Submit() '//��ת���༭����
End Select


 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="../CSS/css_offices.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript" src="../js/jsdate.js"></script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�����ҵ</strong></font></td>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="70%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="A5B6CC">
        <tr> 
          <td bgcolor="#FFFFFF">
		  <table width="100%" border="0" cellspacing="1" cellpadding="4">
              <form action="?action=edit" method="post" name="reg">
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">��ҵ���ƣ�</td>
                  <td bgcolor="f5f5f5"><input name="companyname" type="text" id="companyname" size="30"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">��ҵ���ʣ�</td>
                  <td bgcolor="f5f5f5"><select name="property" id="property" style="width:180px;">
                      <option value="1">������ҵ</option>
                      <option value="2">������ҵ</option>
                      <option value="3">������ҵ</option>
                      <option value="4">˽Ӫ��ҵ</option>
                      <option value="5">��Ӫ��ҵ</option>
                      <option value="6">�ɷ�����ҵ</option>
                      <option value="7">������ҵ</option>
                      <option value="8">������ҵ</option>
                      <option value="9">������ҵ</option>
                      <option value="10">��������</option>
                      <option value="11">�������</option>
                      <option value="12">��ҵ��λ</option>
                      <option value="13">�����ҵ</option>
                      <option value="14">����</option>
                    </select></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" align="right">��ҵ���</td>
                  <td bgcolor="f5f5f5"><select name="industry" id="industry" style="width:180px;">
                      <option value="1">����������������</option>
                      <option value="2">�����ҵ����������ݿ⡢ϵͳ���ɣ�</option>
                      <option value="3">�����ҵ��Ӳ���������豸��</option>
                      <option value="4">���ӡ�΢���Ӽ���</option>
                      <option value="5">ͨѶ������ҵ</option>
                      <option value="6">�ҵ�ҵ</option>
                      <option value="7">��������(�ٻ������С�ר����)</option>
                      <option value="8">ó�ס����񡢽�����</option>
                      <option value="9">����</option>
                      <option value="10">��������Դ�����ҵ</option>
                      <option value="11">ʯ�͡�����ҵ</option>
                      <option value="12">���﹤�̡���ҩ������</option>
                      <option value="13">��е���졢�����豸���ع�ҵ</option>
                      <option value="14">������Ħ�г�</option>
                      <option value="15">�����Ǳ��繤�豸</option>
                      <option value="16">��桢���ء����</option>
                      <option value="17">ý�塢Ӱ�����������ų���</option>
                      <option value="18">�������Ļ�����</option>
                      <option value="19">��������Ʒ��ʳƷ�����ϡ����͡���ױƷ���̾ƣ�</option>
                      <option value="20">��֯Ʒҵ�����Ρ�Ь�ࡢ�ҷ���Ʒ��Ƥ�ߣ�</option>
                      <option value="21">��ѯҵ�����ʡ����ʦ�����ʦ�����ɣ�</option>
                      <option value="22">����ҵ��Ͷ�ʡ����ա�֤ȯ�����С�����</option>
                      <option value="23">���������ز�����ҵ����װ��</option>
                      <option value="24">���������֡��Ƶ�</option>
                      <option value="25">���䡢���������</option>
                      <option value="26">����ҵ</option>
                      <option value="27">�칫�豸���Ļ�����������Ʒ���Ҿ���Ʒ</option>
                      <option value="28">ӡˢ����װ����ֽ</option>
                      <option value="29">���������졢�ӹ�</option>
                      <option value="30">��������ѵ������Ժ��</option>
                      <option value="31">ҽ�ơ���������������</option>
                      <option value="32">�˲Ž������н�</option>
                      <option value="33">Э�ᡢ���š�����������ҵ����������</option>
                      <option value="34">ũ���֡�����������ҵ</option>
                      <option value="35">����</option>
                    </select> </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">����������</td>
                  <td> 
                    <!--#include file="../Include/Class_Locus.asp" -->
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td height="25" align="right" bgcolor="f5f5f5">��ҵ��飺</td>
                  <td bgcolor="f5f5f5"><textarea name="content" cols="45" rows="6" id="content"></textarea></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">��ϵ�ˣ�</td>
                  <td bgcolor="f5f5f5"><input name="contactperson" type="text" id="property3" size="16"> 
                  </td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" align="right">��ϵ�绰��</td>
                  <td bgcolor="f5f5f5"><input name="phone" type="text" id="contactperson" size="16"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">������룺</td>
                  <td bgcolor="f5f5f5"><input name="fax" type="text" id="fax" size="16"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">ͨѶ��ַ��</td>
                  <td bgcolor="f5f5f5"><input name="address" type="text" id="address" size="30"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td align="right">�г�·�ߣ�</td>
                  <td bgcolor="f5f5f5"><input name="bus" type="text" id="bus" size="30"></td>
                </tr>
                <tr bgcolor="f5f5f5"> 
                  <td width="100" height="25" align="right" bgcolor="f5f5f5">&nbsp; 
                  </td>
                  <td bgcolor="f5f5f5"><input type="submit" name="Submit" value="�� ��"> 
                  </td>
                </tr>
              </form>
            </table></td>
</tr>
</table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() '�޸�����
 CompanyName			= Replace_text(Request.form("CompanyName"))
 Content                = Replace_text(Request.form("Content"))
 Property1				= Replace_text(Request.form("Property"))
 Industry    			= Replace_text(Request.form("Industry"))
 ContactPerson			= Replace_text(Request.form("ContactPerson"))
 Phone					= Replace_text(Request.form("Phone"))
 Address				= Replace_text(Request.form("Address"))
 Fax					= Replace_text(Request.form("Fax"))
 Bus					= Replace_text(Request.form("Bus"))
 Locus_Area				= Replace_text(Request.form("x_suozaidi"))
 Locus_City				= Replace_text(Request.form("x_suozaidi1"))
 
 If Content <> "" Then Content = Replace(Content,Chr(13),"<br>")
 
 '��������
 SQL = "Insert Into [pH_Locale_Base] (CompanyName,Content,Locus_Area,Locus_City,Property,Industry,ContactPerson,Phone,Address,AddDate,Fax,Bus,Cityid) Values ('"&CompanyName&"','"&Content&"','"&Locus_Area&"','"&Locus_City&"','"&Property1&"',"&Industry&",'"&ContactPerson&"','"&Phone&"','"&Address&"',Getdate(),'"&Fax&"','"&Bus&"',0)"
 Conn.Execute(SQL)
 
 Response.write "<script language=JavaScript>alert('�����ɹ���');location.href='Web_Locale_Base.asp';</script>"
End Sub

Call CloseDB()
 %>

