<!--#include file="../Include/Class_Conn.asp" -->
<!--#include file="../Include/Class_Main.asp" -->
<!--#include file="../Include/Class_Pass.asp" -->
<% 
Dim Username,Password,Comid,Question,Answer,Email
Username = Replace_text(Request.Form("username")) '//�û���
Password = Replace_text(Request.Form("password")) '//����
Randomize timer
znum = cint(8999*Rnd+1000)
Comid = "VR"&gen_key(10)&znum                     '//��ԱID
Question = Replace_text(Request.Form("question")) '//������ʾ
Answer = Replace_text(Request.Form("answer"))     '//��ʾ��
Email = Replace_text(Request.Form("mailbox"))       '//�����ʼ�
Cityid = Replace_text(Request.Form("Cityid"))       '//����վ��

Dim Agree
'//�����û��Ƿ�ͬ���û�Э��
Agree = Replace_text(request.form("agree"))
If Agree = "" Then
  Response.write "<script >alert('"&Cls_WebName&" ��ʾ��\n\n�Բ�����û��ͬ���û�����Э��,������ע��...');history.back(-1);</script>"
  Response.end
End if

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
CloseRs


 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../Css/Style.css" type=text/css rel=stylesheet>
<title><%= Cls_WebName %> -- ��ҵ��Աע��</title>
<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</head>
<script language="JavaScript" src="../js/Company_Register2.js"></script>
<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td>
      <!--#include file="../Header/Company_reg.asp" -->
    </td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td><table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="50%" height="75" valign="bottom"><img src="../Images/reg_01.gif" width="280" height="67"></td>
                <td width="50%" valign="bottom"><img src="../Images/reg2_3.gif" width="380" height="54"></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td> </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><br>
          <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="25"><STRONG 
            class=font14b STYLE1>�ڶ��� ��ϸ����</STRONG>��˵��������<FONT 
            color=#ff0000>*</FONT>���ŵ�Ϊ�����</td>
              </tr>
            </table>
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
              <form action="Register_Ok.asp" name="reg" method="POST" onSubmit="return check_reg();">
                <tr> 
                  <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
                      <tr> 
                        <td valign="top" bgcolor="#FFFFFF"> <TABLE cellSpacing=0 cellPadding=0 width=99% align=center 
            border=0>
                            <TBODY>
                              <TR> 
                                <TD class=font-14 height=3></TD>
                              </TR>
                              <TR> 
                                <TD class=font-14 bgColor=#999999 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��������</strong></FONT></TD>
                              </TR>
                              <TR> 
                                <TD bgColor=#e2e2e2 height=2></TD>
                              </TR>
                            </TBODY>
                          </TABLE>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> ��ҵ���ƣ�</td>
                              <td height="30"> <input name="companyname" type="text" id="companyname" size="50" maxlength="50" style="width:200px;">
                                �磺<%= Cls_WebName %></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" >֤�����룺</td>
                              <td height="30" > <input name="licence" type="text" size="25" maxlength="25" style="width:200px;"> 
                                <font color="#50463d">��ҵ��Ӫҵִ�յ�</font> </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> ������ҵ��</td>
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
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> ��ҵ���ʣ�</td>
                              <td height="30" > <select name="properity" style="width:120px;">
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
                  color=#ff0000>*</FONT></STRONG> �������ڣ�</td>
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
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> ע���ʽ�</td>
                              <td height="30" > <input name="reg_currency" type="text" size="25" maxlength="25" style="width:100px;">
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
                  color=#ff0000>*</FONT></STRONG> Ա��������</td>
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
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> ��ҵ���ڵ�����</td>
                              <td height="30" >
                                <!--#include file="../Include/Class_Locus.asp" -->
                              </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> ��ҵ��飺</td>
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
                                <TD class=font-14 bgColor=#999999 height=21> <FONT style="MARGIN-TOP: 2px; MARGIN-LEFT: 10px" color=#ffffff><strong>��ϵ��ʽ</strong></FONT></TD>
                              </TR>
                              <TR> 
                                <TD bgColor=#e2e2e2 height=2></TD>
                              </TR>
                            </TBODY>
                          </TABLE>
                          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="17%" height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> ��ϵ�ˣ�</td>
                              <td height="30"> <input name="contactperson" type="text" size="30" maxlength="30" style="width:120px;"> 
                                <font color="#50463d">��������ȷ��ϵ�ˣ��Է�����ְ�����˾��ϵ���磺��С���������</font></td>
                            </tr>
                            <tr> 
                              <td width="17%" height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> ��ϵ�绰��</td>
                              <td height="30" ><input name="phone" type="text" id="phone" style="width:120px;" size="30" maxlength="30"> 
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
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> �����ʼ���</td>
                              <td height="30" > <input name="email" type="text" id="email"  style="width:200px;" value="<%= Email %>" size="50"> 
                                <input name="emailkeep" type="checkbox" id="emailkeep" value="1">
                                �����ʼ���ַ </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">��ҵ��վ��</td>
                              <td height="30"> <input name="webhome" type="text" size="50" style="width:200px;" value="http://"></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right" ><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> �������룺</td>
                              <td height="30" > <input name="zipcode" type="text" size="6" maxlength="6" style="width:120px;"> 
                              </td>
                            </tr>
                            <tr> 
                              <td height="30" align="right"><STRONG><FONT 
                  color=#ff0000>*</FONT></STRONG> ͨѶ��ַ��</td>
                              <td height="30"> <input name="address" type="text" size="100" style="width:260px;">
                                �磺�����к������ɸ�·������ </td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="40" align="center"> <input type="hidden" name="username" value="<%= username %>"> 
                    <input type="hidden" name="password" value="<%= password %>"> 
					<input type="hidden" name="cityid" value="<%= Cityid %>">
                    <input type="hidden" name="comid" value="<%= comid %>"> 
					<input type="hidden" name="question" value="<%= question %>"> 
                    <input type="hidden" name="answer" value="<%= answer %>"> 
                    <input type="submit" name="Submit" value=" �� �� ע �� " style="height:30px;"> 
                  </td>
                </tr>
              </form>
            </table></td></tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <!--#include file="../Include/Footer.asp" -->
    </td>
  </tr>
</table>
</body>
</html>
<% 
CloseDB
 %>
