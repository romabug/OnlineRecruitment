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
If Instr(1,Session("Web_Power"),"125") <= 0 Then 
  Call CloseDB()
  Response.write "�Բ���!��û�з��ʸ�ҳ���Ȩ��..."
  Response.End()
End If
Action = Replace_text(request.QueryString("action"))
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
      function checkaccount(username)
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
        window.open("../Person/Accountcheck.asp?action=cusername&value="+username,"")
      }
    }
   function checkuseremail(username)
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
        window.open("../Person/Accountcheck.asp?action=cuseremail&value="+username,"")
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
 if (document.reg.password.value==document.reg.username.value ){
 alert("���벻�����û�����ͬ�������ע��...");
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
  alert("������ʾ����������룡�����ע��...");
  document.reg.question.focus();
  return false;
 }
  if (document.reg.answer.value==""){
  alert("��ʾ�𰸱������룡�����ע��...");
  document.reg.answer.focus();
  return false;
 }
 
 if (document.reg.useremail.value==""){
 alert("�û�������������룡�����ע��...");
 document.reg.useremail.focus();
 return false;
 }
 if(document.reg.useremail.value.indexOf("@")==-1 || document.reg.useremail.value.indexOf(".")==-1){ 
 alert("�û��������ʽ����ȷ�������ע��...");
 document.reg.useremail.focus();
 return false;
	}
	
 if (document.reg.realname.value==""){
 alert("�û���ʵ��������Ϊ��ֵ�������ע��...");
 document.reg.realname.focus();
 return false;
 }
 if (!is_zw(document.reg.realname.value)){
 alert("�û���ʵ�����������������֣������ע��...");
 document.reg.realname.focus();
 return false;
 }
  if (document.reg.realname.value.length<2 || document.reg.realname.value.length>10){
 alert("�û���ʵ����������2-10������������ɣ������ע��...");
 document.reg.realname.focus();
 return false;
 }
 
 if (document.reg.birthyear.value==""){
 alert("������ݲ���Ϊ��ֵ�������ע��...");
 document.reg.birthyear.focus();
 return false;
 }
 if (document.reg.birthyear.value.match(/\D/)){
 alert("������ݱ����ǺϷ������֣������ע��...");
 document.reg.birthyear.focus();
 return false;
 }
 
  if (document.reg.stature.value==""){
 alert("������߲���Ϊ��ֵ�������ע��...");
 document.reg.stature.focus();
 return false;
 }
 if (document.reg.stature.value.match(/\D/)){
 alert("������߱����ǺϷ������֣������ע��...");
 document.reg.stature.focus();
 return false;
 }

  if (document.reg.tizhong.value==""){
 alert("�������ز���Ϊ��ֵ�������ע��...");
 document.reg.tizhong.focus();
 return false;
 }
 if (document.reg.tizhong.value.match(/\D/)){
 alert("�������ر����ǺϷ������֣������ע��...");
 document.reg.tizhong.focus();
 return false;
 }
 
 if (document.reg.codeid.value==""){
 alert("����֤�����벻��Ϊ��ֵ�������ע��...");
 document.reg.codeid.focus();
 return false;
 }
 if (document.reg.codeid.value.length<15){
 alert("����֤�������ʽ����ȷ�������ע��...");
 document.reg.codeid.focus();
 return false;
 }
 
 if (document.reg.lastschool.value==""){
 alert("����д���ı�ҵԺУ�������ע��...");
 document.reg.lastschool.focus();
 return false;
 }
    if (document.reg.byear.value==""){
 alert("����д���ı�ҵ��ݣ������ע��...");
 document.reg.byear.focus();
 return false;
 }
  if (document.reg.byear.value.match(/\D/)){
 alert("��ҵ��ݱ����ǺϷ������֣������ע��...");
 document.reg.byear.focus();
 return false;
 }
   if (document.reg.speciality.value==""){
 alert("����д����רҵ���ƣ������ע��...");
 document.reg.speciality.focus();
 return false;
 } 
    if (document.reg.personphone.value==""){
 alert("������ϵ�绰����Ϊ��ֵ�������ע��...");
 document.reg.personphone.focus();
 return false;
 }
 if (!is_number(document.reg.personphone.value)){
 alert("��ϵ�绰ֻ�ܺ���0-9��-�������ע��...");
 document.reg.personphone.focus();
 return false;
 } 
  if (!is_number(document.reg.mt.value)){
 alert("�ƶ��绰ֻ�ܺ���0-9��-�������ע��...");
 document.reg.mt.focus();
 return false;
 } 
 if (document.reg.zipcode.value==""){
 alert("�������벻��Ϊ�գ������ע��...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.zipcode.value.match(/\D/)){
 alert("������������ǺϷ������֣������ע��...");
 document.reg.zipcode.focus();
 return false;
 }
 if (document.reg.address.value==""){
 alert("ͨѶ��ַ����Ϊ�գ������ע��...");
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
    <td height="25" background="Images/top11_bg.jpg" style="padding-top:3px;">&nbsp;<font color="#FFFFFF">�� <strong>�������˻�Ա</strong></font></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr> 
    <td align="left"> <table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
        <form action="Web_Person_RegSave.asp" name="reg" method="POST" onSubmit="return check_reg();">
          <tr> 
            <td align="center"><table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#f1b5a1">
                <tr> 
                  <td valign="top" bgcolor="#FFFFFF"> <table cellspacing=0 cellpadding=0 width=99% align=center 
            border=0>
                      <tbody>
                        <tr> 
                          <td class=font-14 height=3></td>
                        </tr>
                        <tr> 
                          <td class=font-14 bgcolor=#ff7800 height=21> <font style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>�ʺ���Ϣ</strong></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor=#e2e2e2 height=2></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          �û����ͣ�</td>
                        <td width="220" height="30"> <SELECT name="jobtype" style="width:120px;">
                                  <OPTION value=1 selected>��ְ��Ա</OPTION>
                                  <OPTION value=2>��ҵ��Ա</OPTION>
								  <OPTION value=3>Ӧ���ҵ��</OPTION>
								  <OPTION value=4>��Уѧ��</OPTION>
                                </SELECT></td>
                        <td height="30">&nbsp;</td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td width="17%" height="30" align="right" bgcolor="#fff7f0"><font color="#FF0000">*</font> 
                          �û����ƣ�</td>
                        <td width="220" height="30"> <input name="username" type="text" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          <input type="button" name="Submit22" value="����ʺ�"  onClick="checkaccount(document.reg.username.value)">
                          </font></font></font></font></font><font color="#999999">(Ӣ����ĸ�����ֻ��»��ߣ�4~20���ַ�)</font><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          </font></font></font></font></font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          �û����룺</td>
                        <td width="220" height="30"> <input name="password" type="password" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30"><font color="#CC0000"><font color="#999999">(Ӣ����ĸ�����ֻ��»��ߣ�6λ���ϵ��ַ�</font></font>)</td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          ȷ�����룺</td>
                        <td width="220" height="30"> <input name="password2" type="password" size="20" maxlength="20" style="width:120px;"></td>
                        <td height="30"><font color="#999999">(��������������)</font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          ������ʾ��</td>
                        <td width="220" height="30"><span style="font-family: ����; font-size: 12px"><font color="#000000"> 
                          <input name="question" class="fieldtext" id="question2" size="26" maxLength="50">
                          </font></span></td>
                        <td height="30"><font color="#999999">(�磺����ϲ��ʲô��ɫ��)</font> 
                        </td>
                      </tr>
                      <tr bgcolor="#fff7f0"> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          ����𰸣�</td>
                        <td height="30"><span style="font-family: ����; font-size: 12px"><font color="#000000"> 
                          <input name="answer" class="fieldtext" id="answer2" size="26" maxLength="50">
                          </font></span></td>
                        <td height="30"><font color="#999999">(�磺��ɫ)</font> </td>
                      </tr>
                      <tr> 
                        <td width="17%" height="30" align="right"><font color="#FF0000">*</font> 
                          �����ʼ���</td>
                        <td height="30"> <input name="useremail" type="text" size="26"></td>
                        <td height="30"><font color="#CC0000"><font color="#CC0000"><font color="#CC0000"><font color="#999999"> 
                          <input name="Submit2" type="button" id="Submit22" value="�������"  onClick="checkuseremail(document.reg.useremail.value)">
                          </font></font></font></font><font color="#999999">(��׼ȷ��д����E-MAIL��ַ)</font></td>
                      </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=99% align=center 
            border=0>
                      <tbody>
                        <tr> 
                          <td class=font-14 height=3></td>
                        </tr>
                        <tr> 
                          <td class=font-14 bgcolor=#ff7800 height=21> <font style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��������</strong></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor=#e2e2e2 height=2></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> �� ����</td>
                        <td height="25"><input name="realname" type="text" id="realname" size="20" maxlength="20" style="width:120px;"></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> �� ��</td>
                        <td height="25" bgcolor="#fff7f0"> <input type="radio" name="sex" value="1" checked>
                          �� 
                          <input type="radio" name="sex" value="0">
                          Ů</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">�� �壺</td>
                        <td height="25"> <select id=nation name=nation style="width:120px;">
                            <option value=���� selected>����</option>
                            <option value=�ɹ���>�ɹ���</option>
                            <option value=����>����</option>
                            <option value=����>����</option>
                            <option value=����>����</option>
                            <option value=ά�����>ά�����</option>
                            <option value=׳��>׳��</option>
                            <option value=����>����</option>
                            <option value=����>����</option>
                            <option value=������>������</option>
                            <option value=������>������</option>
                            <option value=����>����</option>
                            <option value=����>����</option>
                            <option value=����>����</option>
                            <option value=������>������</option>
                            <option value=������>������</option>
                            <option value=��������>��������</option>
                            <option value=����>����</option>
                            <option value=����>����</option>
                            <option value=������>������</option>
                            <option value=����>����</option>
                            <option value=���>���</option>
                            <option value=��ɽ��>��ɽ��</option>
                            <option value=������>������</option>
                            <option value=ˮ��>ˮ��</option>
                            <option value=������>������</option>
                            <option value=������>������</option>
                            <option value=������>������</option>
                            <option value=�¶�������>�¶�������</option>
                            <option value=����>����</option>
                            <option value=���Ӷ���>���Ӷ���</option>
                            <option value=������>������</option>
                            <option value=Ǽ��>Ǽ��</option>
                            <option value=������>������</option>
                            <option value=������>������</option>
                            <option value=ë����>ë����</option>
                            <option value=������>������</option>
                            <option value=������>������</option>
                            <option value=������>������</option>
                            <option value=������>������</option>
                            <option value=��������>��������</option>
                            <option value=ŭ��>ŭ��</option>
                            <option value=���ȱ����>���ȱ����</option>
                            <option value=����˹��>����˹��</option>
                            <option value=���¿���>���¿���</option>
                            <option value=�°���>�°���</option>
                            <option value=������>������</option>
                            <option value=ԣ����>ԣ����</option>
                            <option value=����>����</option>
                            <option value=��������>��������</option>
                            <option value=������>������</option>
                            <option value=���״���>���״���</option>
                            <option value=������>������</option>
                            <option value=�Ű���>�Ű���</option>
                            <option value=�����>�����</option>
                            <option value=��ŵ��>��ŵ��</option>
                            <option value=����>����</option>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> �������ڣ�</td>
                        <td height="25" bgcolor="#fff7f0"> <input name="birthyear" type="text" id="birthyear" size="4" maxlength="4">
                          �� 
                          <select name=birthmonth>
                            <%for i=1 to 12%>
                            <option <%if i=1 then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          �� 
                          <select name=birthday>
                            <%for i=1 to 31%>
                            <option <%if i=1 then%>selected<%end if%> value="<%=i%>"><%=i%></option>
                            <%next%>
                          </select>
                          ��</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> ����״����</td>
                        <td height="25"> <select name="marry" size="1" id="marry" style="width:60px;">
                            <option value="0">����</option>
                            <option value="1" selected>δ��</option>
                            <option value="2">�ѻ�</option>
                            <option value="3">����</option>
                          </select> </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> �� �ߣ�</td>
                        <td height="25" bgcolor="#fff7f0"> <input name="stature" type="text" size="4" maxlength="4" style="width:60px;">
                          CM<font color="#50463d">[�磺172CM]</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> �� �أ�</td>
                        <td height="25"> <input name="tizhong" type="text" size="4" maxlength="4" style="width:60px;">
                          KG</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> ֤�����룺</td>
                        <td height="25" bgcolor="#fff7f0"><select name="codetype" id="codetype" style="width:60px;">
                            <option  value="0">���֤</option>
                            <option  value="1">����</option>
                            <option  value="2">����֤</option>
                            <option  value="3">ѧ��֤</option>
                            <option  value="4">����</option>
                          </select> <input name="codeid" type="text"  size="25" maxlength="25" style="width:150px;"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> �������ڵأ�</td>
                        <td height="25"> 
                          <!--#include file="../include/Class_Door.asp" -->
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> �ֹ����ص㣺</td>
                        <td height="25" bgcolor="#fff7f0"> 
                          <!--#include file="../include/Class_Locus.asp" -->
                        </td>
                      </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=99% align=center 
            border=0>
                      <tbody>
                        <tr> 
                          <td class=font-14 height=3></td>
                        </tr>
                        <tr> 
                          <td class=font-14 bgcolor=#ff7800 height=21> <font style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��������</strong></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor=#e2e2e2 height=2></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> ��ҵԺУ��</td>
                        <td height="25"><input name="lastschool" type="text" id="lastschool" size="30" maxlength="30" style="width:160px;"> 
                          <font color="#50463d">�磺������ѧ</font> </td>
                      </tr>
                      <tr> 
                        <td width="17%" height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> ���ѧ����</td>
                        <td height="25" bgcolor="#fff7f0"> <select name="edus" id="edus" style="width:60px;">
                            <option value="10">Сѧ</option>
                            <option value="20">����</option>
                            <option value="30">����</option>
                            <option value="40">��ר</option>
                            <option value="50">ר��</option>
                            <option value="60" selected>����</option>
                            <option value="70">˶ʿ</option>
                            <option value="80">��ʿ</option>
                            <option value="90">��ʿ��</option>
                          </select></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> ��ҵ��ݣ�</td>
                        <td height="25"><input name="byear" type="text"  size="4" maxlength="4" style="width:60px;">
                          ��</td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> רҵ���</td>
                        <td height="25" bgcolor="#fff7f0"> <select name=zyclass id="zyclass" style="width:120px;">
                            <option value=������� selected >������� 
                            <option value=������ >������ 
                            <option value=�������� >�������� 
                            <option value=�������� >�������� 
                            <option value=�������� >�������� 
                            <option value=����>���� 
                            <option value=��е������ >��е������ 
                            <option value=�����Ǳ��� >�����Ǳ��� 
                            <option value=�ȹ��� >�ȹ��� 
                            <option value=�����Զ��� >�����Զ��� 
                            <option value=���Ӽ���>���Ӽ��� 
                            <option value=��ҵ�Զ��� >��ҵ�Զ��� 
                            <option value=ͨ���� >ͨ���� 
                            <option value=������>������ 
                            <option value=������ >������ 
                            <option value=�Ṥ/��ʳ/ʳƷ�� >�Ṥ/��ʳ/ʳƷ�� 
                            <option value=��֯�� >��֯�� 
                            <option value=������ >������ 
                            <option value=ˮ����>ˮ���� 
                            <option value=�����>����� 
                            <option value=������>������ 
                            <option value=ԭ������>ԭ������ 
                            <option value=Ӧ����Ƽ���ѧ�� >Ӧ����Ƽ���ѧ�� 
                            <option value=������ >������ 
                            <option value=��ҵ�� >��ҵ�� 
                            <option value=ұ����>ұ���� 
                            <option value=������ >������ 
                            <option value=������>������ 
                            <option value=�ƾ���>�ƾ��� 
                            <option value=������>������ 
                            <option value=�Ŀ��� >�Ŀ��� 
                            <option value=�й�������ѧ >�й�������ѧ 
                            <option value=������ >������ 
                            <option value=��ʷ�� >��ʷ�� 
                            <option value=������>������ 
                            <option value=��ѧ�� >��ѧ�� 
                            <option value=ͼ���ѧ >ͼ���ѧ 
                            <option value=�Ŀ�������רҵ>�Ŀ�������רҵ 
                            <option value=�����>����� 
                            <option value=��ѧ�� >��ѧ�� 
                            <option value=����ѧ�� >����ѧ�� 
                            <option value=��ѧ�� >��ѧ�� 
                            <option value=��ѧ��>��ѧ�� 
                            <option value=��ѧ�� >��ѧ�� 
                            <option value=����ѧ��>����ѧ�� 
                            <option value=����ѧ�� >����ѧ�� 
                            <option value=����ѧ��>����ѧ�� 
                            <option value=���������רҵ>���������רҵ 
                            <option value=ҽҩ�� >ҽҩ�� 
                            <option value=ʦ��>ʦ�� 
                            <option value=ũ����>ũ���� 
                            <option value=�ֿ��� >�ֿ��� 
                            <option value=������ >������ 
                            <option value=����>���� 
                            <option value=������>������ 
                            <option value=����������>���������� 
                            <option value=��ҵ������ >��ҵ������ 
                            <option value=Ϸ���赸��>Ϸ���赸�� 
                            <option value=��Ӱ����>��Ӱ���� 
                            <option value=������>������</option>
                            <option value=����>����</option>
                          </select> </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> רҵ���ƣ�</td>
                        <td height="25"><input name="speciality" type="text" size="30" maxlength="30" style="width:120px;"></td>
                      </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=99% align=center 
            border=0>
                      <tbody>
                        <tr> 
                          <td class=font-14 height=3></td>
                        </tr>
                        <tr> 
                          <td class=font-14 bgcolor=#ff7800 height=21> <font style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��ϵ��ʽ</strong></font></td>
                        </tr>
                        <tr> 
                          <td bgcolor=#e2e2e2 height=2></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td width="17%" height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> �� ����</td>
                        <td height="25"><input name="personphone" type="text" size="30" maxlength="30" style="width:120px;"> 
                          <font color="#50463d">�̶��绰����[�磺010-82615888] </font></td>
                      </tr>
                      <tr> 
                        <td width="17%" height="25" align="right" bgcolor="#fff7f0">�� 
                          ����</td>
                        <td height="25" bgcolor="#fff7f0"> <input name="mt" type="text" size="30" maxlength="30" style="width:120px;"> 
                          <font color="#50463d">�ƶ�</font><font color="#50463d">�绰����[�磺139-88888888] 
                          </font> </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right">������룺</td>
                        <td height="25"> <input name="msnqq" type="text" size="30" maxlength="30" style="width:120px;"> 
                          <font color="#50463d">MSN/QQ/OICQ����</font></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0">������վ��</td>
                        <td height="25" bgcolor="#fff7f0"> 
                          <input name="webhome" type="text" id="webhome" style="width:200px;" value="http://" size="50"></td>
                      </tr>
                      <tr> 
                        <td height="25" align="right"><strong><font 
                  color=#ff6600>*</font></strong> �������룺</td>
                        <td height="25"> 
                          <input name="zipcode" type="text" id="zipcode" style="width:120px;" size="6" maxlength="6"> 
                        </td>
                      </tr>
                      <tr> 
                        <td height="25" align="right" bgcolor="#fff7f0"><strong><font 
                  color=#ff6600>*</font></strong> ͨѶ��ַ��</td>
                        <td height="25" bgcolor="#fff7f0"> 
                          <input name="address" type="text" id="address" style="width:260px;" size="100">
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
      </table></td>
</tr>
</table>
</body>
</html>
<% 
Sub Edit_Submit() 
Username = Replace_text(Request.Form("username")) '//�û���
Password = Replace_text(Request.Form("password")) '//����
Password = Md5(Password)
Randomize timer
Znum = Cint(8999*Rnd+1000)
Perid = Cls_WebKey&gen_key(10)&Znum               '//��ԱID
Useremail=replace_text(request.form("useremail")) '//�ʼ�
Question = replace_text(request.form("question")) '//������ʾ
Answer = replace_text(request.form("answer"))     '//��ʾ��
JobType = replace_text(request.form("jobtype"))     '//��Ա����

Set Rs = Server.Createobject("ADODB.recordset")
'//����Ƿ���ͬ���ʺ�
Rs.Open "Select UserName,UserEmail,Perid From [pH_Person_Base] Where Username='"&username&"' or Useremail='"&useremail&"'  or Perid='"&Perid&"'",Conn,1,1

If Not Rs.Eof Then
    '//ͬ�����ʺ�
	If Rs("Username") = UserName or Rs("Perid") = Perid Then
	    CloseRs
		CloseDB
		Response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ�������ʺ��Ѿ�ʹ����,������ѡ���ʺŲ�����ע��...');history.back(-1);</script>"
		Response.end
    End if
	'//ͬ�����ʼ�
    If Rs("Useremail") = Useremail Then
	    CloseRs
	    CloseDB
		Response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ���ϵͳ����ͬ��������,������ѡ�����䲢����ע��...');history.back(-1);</script>"
	    Response.end
    End if

End if 
Rs.Close

'//�����̳�Ļ�Ա��
rs.open "select id,User_name,Email from [User] where user_name='"&username&"' or email='"&useremail&"'",conn,1,1
if not rs.eof or not rs.bof then
	if  rs("user_name")=username then
	    CloseRs
	    CloseDB
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ�������ʺ��Ѿ�ʹ����,������ѡ���ʺŲ�����ע��...');history.back(-1);</script>"
		response.end
    end if
    if rs("email")=useremail then
	    CloseRs
	    CloseDB
		response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ���ϵͳ����ͬ��������,������ѡ�����䲢����ע��...');history.back(-1);</script>"
	  response.end
    end if

end if 
'//�������ݵ����ݿ�[pH_Person_Base]��[pH_Person_Info]��
SQL = "Insert Into [pH_Person_Base] (Perid,Username,Password,UserEmail,Journal,RegDate,LastIp,LastDate,LastUpdate_Time,LoginCount,Question,Answer,Websub) Values ('"&Perid&"','"&Username&"','"&Password&"','"&UserEmail&"',1,getdate(),'"&LastIp&"',getdate(),getdate(),1,'"&Question&"','"&Answer&"','"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Person_Base]��

SQL = "Insert Into [pH_Person_Info] (Perid,UserName,RealName,Sex,Nation,Edus,Marry,Age,LastSchool,ZyClass,Speciality,Door_Area,Door_City,Locus_Area,Locus_City,Stature,Tizhong,Byear,BirthYear,BirthMonth,BirthDay,PersonPhone,MsnQQ,WebHome,InterView,ProvideHouse,Post,ViewClicks,ContactKeep,ResumeKeep,PhotoKeep,ResumeMode,Codeid,CodeType,Mt,ZipCode,Address,PerType,JobType,TopAll,Nc_Video,Video_Flag,Video_BestFlag,Websub) Values ('"&Perid&"','"&Username&"','"&Realname&"',"&Sex&",'"&Nation&"',"&Edus&","&Marry&","&Age&",'"&LastSchool&"','"&ZyClass&"','"&Speciality&"','"&Door_Area&"','"&Door_City&"','"&Locus_Area&"','"&Locus_City&"',"&Stature&","&TiZhong&","&Byear&","&BirthYear&","&BirthMonth&","&BirthDay&",'"&PersonPhone&"','"&MsnQQ&"','"&WebHome&"',0,0,0,0,0,0,0,1,'"&Codeid&"',"&CodeType&",'"&Mt&"','"&ZipCode&"','"&Address&"',1,"&JobType&",0,0,0,0,'"&Cls_Websub&"')"
Conn.Execute(SQL)  '//[pH_Person_Info]��

'//����̳��Ա������Ӽ�¼
SQL = "Insert Into [User] (User_name,User_Pass,Login_Last_Date,Login_Last_Ip,Login_Count,Creat_Date,Up_Date,Pass_Matter,Pass_Key,Email,MsnQQ,Address,myWeb,TelPhone,RelName) Values ('"&Username&"','"&Replace_text(request.form("password"))&"',getdate(),'"&LastIp&"',1,getdate(),getdate(),'"&Question&"','"&Answer&"','"&UserEmail&"','"&MsnQQ&"','"&Address&"','"&WebHome&"','"&PersonPhone&"','"&Realname&"')"
Conn.Execute(SQL)

 '�������
 Response.write "<script language=JavaScript>alert('������ɣ�');location.href='Web_Person_All.asp';</script>"
 Response.End()
End Sub

Call CloseDB()
 %>

