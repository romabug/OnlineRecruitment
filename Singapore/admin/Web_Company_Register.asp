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
If Instr(1,Session("Web_Power"),"118") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request("action"))
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
<script language="JavaScript">
	 function checkAccount(username)
    {
      var re, r;
    
      re = /\S/;
      r = username.match(re);
      if (!r)
      {
        alert("�������û�����");
        return false;
      }
      else
      {
        window.open("../Company/AccountCheck.asp?action=cusername&value="+username,"")
      }
    }
   function checkmailbox(username)
    {
      var re, r;
    
      re = /\S/;
      r = username.match(re);
      if (!r)
      {
        alert("�������ַ��");
        return false;
      }
      else
      {
        window.open("../Company/AccountCheck.asp?action=cmailbox&value="+username,"")
      }
    }

   function is_zw(str)
  {
	exp=/[0-9a-zA-Z_]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
  }
 
 function is_number(str)
{
	exp=/[^0-9()-]/g;
	if(str.search(exp) != -1)
	{
		return false;
	}
	return true;
}

 function check_reg(){
 if (document.reg.username.value==""){
 alert("�û�������Ϊ�գ������ע��...");
 document.reg.username.focus();
 return false;
 }
  if (document.reg.username.value.length<4 || document.reg.username.value.length>20){
 alert("�û���������4-20λ���ַ��������ע��...");
 document.reg.username.focus();
 return false;
 }
 if (is_zw(document.reg.username.value)){
  alert("�û����������������֣������ע��...");
  document.reg.username.focus();
  return false;
 }
 if (document.reg.password.value==""){
 alert("���벻���ǿ�ֵ�������ע��...");
 document.reg.password.focus();
 return false;
 }

 if (document.reg.password.value.length<6 ){
 alert("���벻�ܵ���6λ�ķ��ţ������ע��...");
 document.reg.password.focus();
 return false;
 }
 
 if (document.reg.password2.value==""){
 alert("ȷ�����벻���ǿ�ֵ�������ע��...");
 document.reg.password2.focus();
 return false;
 }
 
 if (document.reg.password2.value!=document.reg.password.value){
 alert("ȷ�����������벻��ͬ�������ע��...");
 document.reg.password2.focus();
 return false;
 }
 if (document.reg.question.value==""){
 alert("�����һ��������ʾ���ⲻ��Ϊ�գ������ע��...");
 document.reg.question.focus();
 return false;
 }
 if (document.reg.answer.value==""){
 alert("�����һ����������𰸲���Ϊ�գ������ע��...");
 document.reg.answer.focus();
 return false;
 }
  
 if (document.reg.mailbox.value==""){
 alert("�û�������������룡�����ע��...");
 document.reg.mailbox.focus();
 return false;
 }
 if(document.reg.mailbox.value.indexOf("@")==-1 || document.reg.mailbox.value.indexOf(".")==-1){ 
 alert("�û��������ʽ����ȷ�������ע��...");
 document.reg.mailbox.focus();
 return false;
	}
	
  if (document.reg.companyname.value==""){
 alert("��ҵ���Ʋ����ǿ�ֵ�������ע��...");
 document.reg.companyname.focus();
 return false;
 }

   if (document.reg.set_year.value==""){
 alert("��ҵ����ʱ�䲻���ǿ�ֵ�������ע��...");
 document.reg.set_year.focus();
 return false;
 }
 if (document.reg.set_year.value.match(/\D/)){
 alert("��ҵ������ݱ��������֣������ע��...");
 document.reg.set_year.focus();
 return false;
 }
 if (document.reg.reg_currency.value==""){
 alert("��ҵע���ʽ����ǿ�ֵ�������ע��...");
 document.reg.reg_currency.focus();
 return false;
 }
  if (document.reg.reg_currency.value.match(/\D/)){
 alert("��ҵע���ʽ���������֣������ע��...");
 document.reg.reg_currency.focus();
 return false;
 }

 if (document.reg.company_memo.value==""){
 alert("��ҵ��鲻���ǿ�ֵ�������ע��...");
 document.reg.company_memo.focus();
 return false;
 }
  if (document.reg.contactperson.value==""){
 alert("��ϵ�˲����ǿ�ֵ�������ע��...");
 document.reg.contactperson.focus();
 return false;
 }
 if (document.reg.phone.value==""){
 alert("��ϵ�绰�����ǿ�ֵ�������ע��...");
 document.reg.phone.focus();
 return false;
 }
 if (!is_number(document.reg.phone.value)){
 alert("��ϵ�绰ֻ��������0-9��-�������ע��...");
 document.reg.phone.focus();
 return false;
 }
 if (!is_number(document.reg.companyfax.value)){
 alert("����ֻ��������0-9��-�������ע��...");
 document.reg.companyfax.focus();
 return false;
 }
 if (document.reg.email.value==""){
 alert("����������룡�����ע��...");
 document.reg.email.focus();
 return false;
 }

 if(document.reg.email.value.indexOf("@")==-1 || document.reg.email.value.indexOf(".")==-1){ 
 alert("�����ʽ����ȷ�������ע��...");
 document.reg.email.focus();
 return false;
	}

 if (document.reg.zipcode.value==""){
 alert("��������������룡�����ע��...");
 document.reg.zipcode.focus();
 return false;
 } 
 if (document.reg.zipcode.value.match(/\D/)){
 alert("����������������֣������ע��...");
 document.reg.zipcode.focus();
 return false;
 }
 
 if (document.reg.address.value==""){
 alert("ͨѶ��ַ�������룡�����ע��...");
 document.reg.address.focus();
 return false;
 }	

 }


</script>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>������ҵ��Ա</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"><table width="90%" border="0" align="left" cellpadding="0" cellspacing="0">
        <form action="?action=edit" name="reg" method="POST" onSubmit="return check_reg();">
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
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>�ʺ���Ϣ</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
                      <tr> 
                        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                                �û����ƣ�</td>
                              <td width="220" height="30"> <input name="username" type="text" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> 
                                <input type="button" name="Submit22" value="����ʺ�"  onClick="checkAccount(document.reg.username.value)">
                                </font><font color="#999999"> </font></font></font></font></font><font color="#999999">(Ӣ����ĸ�����ֻ��»��ߣ�4~20���ַ�)</font><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font></font></font></font></font></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                                �û����룺</td>
                              <td width="220" height="30" bgcolor="#fff7f0"> <input name="password" type="password" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30" bgcolor="#fff7f0"><font color="#CC0000"><font color="#999999">(Ӣ����ĸ�����ֻ��»��ߣ�6λ���ϵ��ַ�</font></font>)</td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                                ȷ�����룺</td>
                              <td width="220" height="30"> <input name="password2" type="password" size="20" maxlength="20" style="width:120px;"></td>
                              <td height="30"><font color="#999999">(��������������)</font></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                                ������ʾ��</td>
                              <td width="220" height="30" bgcolor="#fff7f0"><span style="font-family: ����; font-size: 12px"><font color="#000000"> 
                                <input name="question" class="fieldtext" id="question" size="26" maxLength="50">
                                </font></span></td>
                              <td height="30" bgcolor="#fff7f0"><font color="#999999">(�磺����ϲ��ʲô��ɫ��)</font> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                                ����𰸣�</td>
                              <td height="30"><span style="font-family: ����; font-size: 12px"><font color="#000000"> 
                                <input name="answer" class="fieldtext" id="answer" size="26" maxLength="50">
                                </font></span></td>
                              <td height="30"><font color="#999999">(�磺��ɫ)</font> 
                              </td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                                �����ʼ���</td>
                              <td height="30" bgcolor="#fff7f0"> <input name="mailbox" type="text" id="mailbox" size="26"></td>
                              <td height="30" bgcolor="#fff7f0"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                                </font><font color="#435049"> 
                                <input name="Submit3" type="button" id="Submit3" value="�������" onClick="checkmailbox(document.reg.mailbox.value)">
                                </font><font color="#999999"> </font></font></font></font><font color="#999999">(��׼ȷ��д����E-MAIL��ַ)</font></td>
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
                          <TD class=font-14 bgColor=#ff7800 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��������</strong></FONT></TD>
                        </TR>
                        <TR> 
                          <TD bgColor=#e2e2e2 height=2></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ҵ���ƣ�</td>
                        <td height="30"> <input name="companyname" type="text" id="companyname" size="50" maxlength="50" style="width:200px;">
                          �磺<%= Cls_WebName %></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0">֤�����룺</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="licence" type="text" size="25" maxlength="25" style="width:200px;"> 
                          <font color="#50463d">��ҵ��Ӫҵִ�յ�</font> </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ������ҵ��</td>
                        <td height="30"> <select name="industry" id="industry" style="width:200px;">
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
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ҵ���ʣ�</td>
                        <td height="30" bgcolor="#fff7f0"> <select name="properity" style="width:120px;">
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
                  color=#ff6600>*</FONT></STRONG> ע���ʽ�</td>
                        <td height="30" bgcolor="#fff7f0"> <input name="reg_currency" type="text" size="25" maxlength="25" style="width:100px;">
                          ��Ԫ 
                          <select name="currencytype" id="currencytype" style="width:80px;">
                            <option value="1">�����</option>
                            <option value="2">��Ԫ</option>
                            <option value="3">ŷԪ</option>
                            <option value="4">Ӣ��</option>
                            <option value="5">�۱�</option>
                            <option value="6">̨��</option>
                          </select> </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> Ա��������</td>
                        <td height="30"> <select name="workers" id="workers" style="width:100px;">
                            <OPTION value=9>10������</OPTION>
                            <OPTION value=49>10��50��</OPTION>
                            <OPTION value=199>50��200��</OPTION>
                            <OPTION value=499>200��500��</OPTION>
                            <OPTION value=999>500��1000��</OPTION>
                            <OPTION value=1000>1000������</OPTION>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ҵ���ڵ�����</td>
                        <td height="30" bgcolor="#fff7f0"> 
                          <!--#include file="../Include/Class_Locus.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ҵ��飺</td>
                        <td height="30"> <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="70%"><textarea name="company_memo" cols="50" rows="8" id="company_memo"></textarea></td>
                              <td><font color="#50463d">����ַ���5000,�뾡������ϸ��д���ϣ���ȷ����˾����˳��ͨ��������ˣ���������˾��������+��Ʒ�����+��Ӫҵ����</font></td>
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
                          <font color="#50463d">��������ȷ��ϵ�ˣ��Է�����ְ�����˾��ϵ���磺��С���������</font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ��ϵ�绰��</td>
                        <td height="30" bgcolor="#fff7f0"><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30"> 
                          <input name="phonekeep" type="checkbox" id="phonekeep" value="1"> 
                          <font color="#333333">���ε绰</font><font color="#50463d"> 
                          [�̶��绰���룬�磺010-82615888] </font> </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right">������룺</td>
                        <td height="30"><input name="companyfax" type="text" id="companyfax" style="width:120px;" size="30" maxlength="30"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="30" align="right" bgcolor="#fff7f0">��ҵ��վ��</td>
                        <td height="30" bgcolor="#fff7f0"> 
                          <input name="webhome" type="text" size="50" style="width:200px;" value="http://"></td>
                      </tr>
                      <tr> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> �������룺</td>
                        <td height="30"> 
                          <input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"> 
                        </td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td height="30" align="right"><STRONG><FONT 
                  color=#ff6600>*</FONT></STRONG> ͨѶ��ַ��</td>
                        <td height="30"> 
                          <input name="address" type="text" size="100" style="width:260px;">
                          �磺�����к������ɸ�·������ </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="40" align="center"> 
              <input type="submit" name="Submit" value=" �� �� �� Ա " style="height:30px;"> 
            </td>
          </tr>
        </form>
      </table> </td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() 
Dim Username,Password,Comid,Question,Answer,Email
Username = Replace_text(Request.Form("username")) '//�û���
Password = Replace_text(Request.Form("password")) '//����
Password = Md5(Password)
Randomize timer
znum = cint(8999*Rnd+1000)
Comid = "VR"&gen_key(10)&znum                     '//��ԱID
Question = Replace_text(Request.Form("question")) '//������ʾ
Answer = Replace_text(Request.Form("answer"))     '//��ʾ��
Email = Replace_text(Request.Form("mailbox"))       '//�����ʼ�



Set Rs = Server.createobject("ADODB.recordset")
Rs.open "Select username,Email,comid From [pH_Company_Base] Where username='"&username&"' or Email='"&Email&"' or comid='"&comid&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("username")=username or rs("comid")=comid then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ�������ʺ��Ѿ�ʹ����,������ѡ���ʺŲ�����ע��...');history.back(-1);</script>"
		response.end
    end if
    if rs("Email") = Email then
        CloseRs
        CloseDb
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ���ϵͳ����ͬ��������,������ѡ�����䲢����ע��...');history.back(-1);</script>"
	  response.end
    end if

end if 
'//�ύ����
Question                   = Replace_Text(Request.Form("Question"))
Answer                     = Replace_Text(Request.Form("Answer"))
CompanyName                = Replace_Text(Request.Form("CompanyName"))
Licence                    = Replace_Text(Request.Form("Licence"))
Industry                   = Replace_Text(Request.Form("Industry"))
Properity                  = Replace_Text(Request.Form("Properity"))
Set_year                   = Replace_Text(Request.Form("Set_year"))
Set_month                  = Replace_Text(Request.Form("Set_month"))
Set_day                    = Replace_Text(Request.Form("Set_day"))
Workers                    = Replace_Text(Request.Form("Workers"))
Reg_Currency               = Replace_Text(Request.Form("Reg_Currency"))
CurrencyType               = Replace_Text(Request.Form("CurrencyType"))
Company_Memo               = Replace_Text(Request.Form("Company_Memo"))
ContactPerson              = Replace_Text(Request.Form("ContactPerson"))
Phone                      = Replace_Text(Request.Form("Phone"))
PhoneKeep                  = Replace_Text(Request.Form("PhoneKeep"))
CompanyFax                 = Replace_Text(Request.Form("CompanyFax"))
EmailKeep                  = Replace_Text(Request.Form("EmailKeep"))
Locus_Area                 = Replace_Text(Request.Form("x_suozaidi"))
Locus_City                 = Replace_Text(Request.Form("x_suozaidi1"))
Address                    = Replace_Text(Request.Form("Address"))
ZipCode                    = Replace_Text(Request.Form("ZipCode"))
WebHome                    = Replace_Text(Request.Form("WebHome"))

If PhoneKeep = "" Then PhoneKeep = 0
If EmailKeep = "" Then EmailKeep = 0
If Comnpany_Memo <> "" Then Comnpany_Memo = Replace(Comnpany_Memo,Chr(13),"<br>")
'//�������ݵ����ݿ�[pH_Company_Base]��
SQL = "Insert Into [pH_Company_Base] (Comid,Username,Password,CompanyName,Question,Answer,Licence,Industry,Properity,Set_Year,Set_Month,Set_Day,Workers,Reg_Currency,CurrencyType,Company_Memo,ContactPerson,Phone,PhoneKeep,CompanyFax,Email,EmailKeep,Locus_Area,Locus_City,Address,ZipCode,WebHome,RegDate,LastIp,LoginCount,LastDate,LastUpdate_Time,LogoKeep,Nc_Vip_Flag,ViewClicks,PublishCount,Flag,Nc_Video,Video_Flag,Websub) Values ('"&Comid&"','"&Username&"','"&Password&"','"&CompanyName&"','"&Question&"','"&Answer&"','"&Licence&"',"&Industry&","&Properity&","&Set_year&","&Set_month&","&Set_day&","&Workers&","&Reg_Currency&","&CurrencyType&",'"&Company_Memo&"','"&ContactPerson&"','"&Phone&"',"&	PhoneKeep&",'"&CompanyFax&"','"&Email&"',"&EmailKeep&",'"&Locus_Area&"','"&Locus_City&"','"&Address&"','"&ZipCode&"','"&WebHome&"',getdate(),'"&LastIp&"',1,getdate(),getdate(),0,0,0,0,1,0,0,'"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Company_Base]��

 '�������
 Response.write "<script language=JavaScript>alert('������ɣ�');location.href='Web_Company_All.asp';</script>"
End Sub

Call CloseDB()
 %>

