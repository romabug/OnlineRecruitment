<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����͹���Ƹ��-������ְ����</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
          <tr>
            <td height="22" class="win2_update_table_top"><span class="win3_update_table_top">ְλ����</span></td>
          </tr>
          <form action="personsearch_OK.asp" method="post" name="form1" id="form1">
            <tr>
              <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#ffffff" bordercolordark="#FF6633">
                  <tr>
                    <td width="113" height="25" align="right" class="win2_update_table_td4">��˾���ƣ�</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <input name="Companyname" id="Companyname" style="FONT-SIZE: 12px; FONT-FAMILY: ����" size="35" 
maxlength="20" />
                    </td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">��λ���ʣ�</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <select name="Properity"  id="Properity" >
                          <option value="" selected="selected">����</option>
                          <option value="1">������ҵ</option>
                          <option value="2">������ҵ</option>
                          <option value="3" >������ҵ</option>
                          <option value="4" >˽Ӫ��ҵ</option>
                          <option value="5">��Ӫ��ҵ</option>
                          <option value="6">�ɷ�����ҵ</option>
                          <option value="7" >������ҵ</option>
                          <option value="8">������ҵ</option>
                          <option value="9">������ҵ</option>
                          <option value="10">��������</option>
                          <option value="11">�������</option>
                          <option value="12" >��ҵ��λ</option>
                          <option value="13" >�����˾(����)</option>
                        </select>
                    </td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">ְλ���ƣ�</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <input id="Jobname" style="FONT-SIZE: 12px; FONT-FAMILY: ����" maxlength="20" 
name="Jobname" />
                        <font color="#FF0000">*</font></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">��ѧרҵ��</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <input id="Spec1" style="FONT-SIZE: 12px; FONT-FAMILY: ����" maxlength="20" 
name="Spec1" /></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">нˮ��<br />
                    </td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <input name="Salary" type="text" id="Salary" style="FONT-SIZE: 12px; FONT-FAMILY: ����" maxlength="20" /></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">ѡ������λ���ͣ�</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <select id="list2" style="FONT-SIZE: 12px; FONT-FAMILY: ����" 
name="list2">
                          <option value="" selected="selected" >����</option>
                          <option value="1" >��ʳ/����/����</option>
                          <option value="2" >�̵�/����/�̳�</option>
                          <option value="3" >����/�Ƶ�/����/����</option>
                          <option value="4" >����ҵ/�ɻ���/����</option>
                          <option value="5" >��Ѷ�Ƽ�/����/ͨѶ</option>
                          <option value="6" >���/ý��/����/���</option>
                          <option value="7" >ˮ/��/��/�յ�/����</option>
                          <option value="8" >����ά��/��������</option>
                          <option value="9" >����/װ��/�ӹ�</option>
                          <option value="10" >��ķ/����/����</option>
                          <option value="11" >��/����/��Ħ</option>
                          <option value="12" >����/ģ��/����ҵ</option>
                          <option value="13" >��չ/����/�ƹ�</option>
                          <option value="14" >����/����ҵ</option>
                          <option value="15" >԰��/��԰ά��</option>
                          <option value="16" >������/ó��</option>
                          <option value="17" >����/����/����</option>
                          <option value="18" >����/����/����</option>
                          <option value="19" >����/��ѵ</option>
                          <option value="20" >����/����/ҽ��</option>
                          <option value="21" >��ѯ/�н�/����</option>
                          <option value="22" >�ۺ���ְ/����</option>
                          <option value="23" >�߼�/�ۺϹ���</option>
                          <option value="24" >������������</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">Ҫ���Ա�</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <select style="FONT-SIZE: 12px; FONT-FAMILY: ����" 
size="1" name="sex">
                          <option value="" selected="selected">���� </option>
                          <option value="1">�� </option>
                          <option 
value="2">Ů</option>
                        </select>
                    </td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">Ҫ��ѧ����</td>
                    <td width="385" bgcolor="#FFFFFF">&nbsp;
                        <select name="Degree" 
size="1" id="Degree" style="FONT-SIZE: 12px; FONT-FAMILY: ����">
                          <option value="0" >��������</option>
                          <option value="1" selected="selected" >����</option>
                          <option value="2" >ְ��</option>
                          <option value="3" >��ר</option>
                          <option value="4" >��ר</option>
                          <option value="5" >����</option>
                          <option value="6" >˶ʿ</option>
                          <option value="7" >��ʿ</option>
                          <option value="" selected="selected">����</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">��Ƹ���</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <select 
name="Jobtype" size="1" id="Jobtype" style="FONT-SIZE: 12px; FONT-FAMILY: ����">
                          <option value="1">ȫְ</option>
                          <option value="0">��ְ</option>
                          <option 
value="" selected="selected">����</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">�������飺</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <input 
onkeypress="if (event.keyCode &lt; 48 || event.keyCode &gt; 57) event.returnValue = false;" 
id="Doneyear" style="FONT-SIZE: 12px; IME-MODE: disabled; FONT-FAMILY: ����" 
maxlength="2" size="3" name="Doneyear" />
                      �� </td>
                  </tr>
                  <tr>
                    <td height="25" align="right" class="win2_update_table_td4">ѡ�񷢲�ʱ�䣺</td>
                    <td bgcolor="#FFFFFF">&nbsp;
                        <select name="publisttime" size="1" id="publisttime" style="FONT-SIZE: 12px; FONT-FAMILY: ����">
                          <option value="7">һ����</option>
                          <option value="15">�������</option>
                          <option 
value="30">һ������</option>
                          <option value="60">��������</option>
                          <option 
value="90">��������</option>
                          <option value="180">������</option>
                          <option value="" selected="selected">����</option>
                      </select></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="30" colspan="2" align="middle"><div align="center">
                        <input type="submit" name="Submit" value="ְλ����" />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="reset" name="Submit" value="����" />
                    </div></td>
                  </tr>
                </table></td>
            </tr>
          </form>
    </table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
Call CloseRs()
Call CloseConn()
%>
