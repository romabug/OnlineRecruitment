<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<%
Call Remote()
if session("username")="" or session("uid")="" or session("pwd1")="" then
response.Redirect("reg_first.asp")
response.End()
end if
%><%'=session("username")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>�������ע���Ա</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/01387.css" rel="stylesheet" type="text/css" />
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<SCRIPT language=javascript src="inc/job.js"></SCRIPT>
<!--#include file="../inc/top_1.asp"-->


<table width="776" height="117" border="0" align="center">
  <tr> 
    <td width="35%" height="5"><div align="center"><font color="#00468D" size="2"><strong> 
        </strong></font></div></td>
    <td width="26%" height="2"><div align="center"><strong></strong></div></td>
    <td><div align="center"><font size="2"><strong></strong></font></div></td>
  </tr>
  <tr> 
    <td height="86" colspan="3"><div align="left">
        <table width="100%" border="0">
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="97%"><table width="100%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
                <tr> 
                  <td align="left" bgcolor="#FFFFFF"><p><font color="#CCCCCC">&nbsp;&nbsp;&nbsp;��1������д�ʺ���Ϣ(�����)</font> 
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#CCCCCC"><strong><font color="#003399">��2��:��д�͹�����</font></strong> 
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��3��:ע��ɹ�����½ϵͳͶ�ݼ���</font></p>
                    <p>��<font color="#FF0000">���±������20��������д�������ύ����������дʱ��̫�����ύʧ��</font>����ƾ�û�������<a href="http://www.macau69.cn/personadmin/login.asp"><font color="#003399">��½���˼�������ƽ̨</font></a>�������Ƽ�����<br />
                      �����±�־"<strong><font color="#FF0000">*</font></strong>"��Ϊ������Ŀ 
                      <br />
                      ���������÷���������д<br />
                    </p></td>
                </tr>
              </table></td>
          </tr>
        </table>
      </div></td>
  </tr>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
<form name="form1" method="post" action="reg_second_go_save.asp" onSubmit="return Juge(this)">
  <tr> 
    <td width="786" height="30">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
            <td height="26" align="left" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;������Ϣ 
              </strong></td>
        </tr>
      </table> 
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="30"><div align="right">������</div></td>
            <td><input name="uname" type="text" class="input" id="uname" size="26"> 
            <font color="#FF0000">*</font></td>
            <td><div align="right">�Ա�</div></td>
            <td><input name="sex" type="radio" value="1" checked>
              �� 
              <input type="radio" name="sex" value="0">
              Ů</td>
          </tr>
          <tr> 
            <td height="30"><div align="right">�������ڣ�</div></td>
            <td width="39%"><select name="u_year" class="input">
                <option value="" >ѡ��</option>
                <option value="1940" >1940</option>
                <option value="1941" >1941</option>
                <option value="1942" >1942</option>
                <option value="1943" >1943</option>
                <option value="1944" >1944</option>
                <option value="1945" >1945</option>
                <option value="1946" >1946</option>
                <option value="1947" >1947</option>
                <option value="1948" >1948</option>
                <option value="1949" >1949</option>
                <option value="1950" >1950</option>
                <option value="1951" >1951</option>
                <option value="1952" >1952</option>
                <option value="1953" >1953</option>
                <option value="1954" >1954</option>
                <option value="1955" >1955</option>
                <option value="1956" >1956</option>
                <option value="1957" >1957</option>
                <option value="1958" >1958</option>
                <option value="1959" >1959</option>
                <option value="1960" >1960</option>
                <option value="1961" >1961</option>
                <option value="1962" >1962</option>
                <option value="1963" >1963</option>
                <option value="1964" >1964</option>
                <option value="1965" >1965</option>
                <option value="1966" >1966</option>
                <option value="1967" >1967</option>
                <option value="1968" >1968</option>
                <option value="1969" >1969</option>
                <option value="1970" >1970</option>
                <option value="1971" >1971</option>
                <option value="1972" >1972</option>
                <option value="1973" >1973</option>
                <option value="1974" >1974</option>
                <option value="1975" >1975</option>
                <option value="1976" >1976</option>
                <option value="1977" >1977</option>
                <option value="1978" >1978</option>
                <option value="1979" >1979</option>
                <option value="1980" >1980</option>
                <option value="1981" >1981</option>
                <option value="1982" >1982</option>
                <option value="1983" >1983</option>
                <option value="1984" >1984</option>
                <option value="1985" >1985</option>
                <option value="1986" >1986</option>
                <option value="1987" >1987</option>
                <option value="1988" >1988</option>
                <option value="1989" >1989</option>
                <option value="1990" >1990</option>
                <option value="1991" >1991</option>
                <option value="1992" >1992</option>
                <option value="1993" >1993</option>
                <option value="1994" >1994</option>
                <option value="1995" >1995</option>
                <option value="1996" >1996</option>
                <option value="1997" >1997</option>
                <option value="1998" >1998</option>
                <option value="1999" >1999</option>
                <option value="2000" >2000</option>
              </select>
              �� 
              <select name="u_month" class="input">
                <option value="" >ѡ��</option>
                <option value="1" >01</option>
                <option value="2" >02</option>
                <option value="3" >03</option>
                <option value="4" >04</option>
                <option value="5" >05</option>
                <option value="6" >06</option>
                <option value="7" >07</option>
                <option value="8" >08</option>
                <option value="9" >09</option>
                <option value="10" >10</option>
                <option value="11" >11</option>
                <option value="12" >12</option>
              </select>
              �� 
              <select name="u_day" class="input">
                <option value="" >ѡ��</option>
                <option value="1" >01</option>
                <option value="2" >02</option>
                <option value="3" >03</option>
                <option value="4" >04</option>
                <option value="5" >05</option>
                <option value="6" >06</option>
                <option value="7" >07</option>
                <option value="8" >08</option>
                <option value="9" >09</option>
                <option value="10" >10</option>
                <option value="11" >11</option>
                <option value="12" >12</option>
                <option value="13" >13</option>
                <option value="14" >14</option>
                <option value="15" >15</option>
                <option value="16" >16</option>
                <option value="17" >17</option>
                <option value="18" >18</option>
                <option value="19" >19</option>
                <option value="20" >20</option>
                <option value="21" >21</option>
                <option value="22" >22</option>
                <option value="23" >23</option>
                <option value="24" >24</option>
                <option value="25" >25</option>
                <option value="26" >26</option>
                <option value="27" >27</option>
                <option value="28" >28</option>
                <option value="29" >29</option>
                <option value="30" >30</option>
                <option value="31" >31</option>
              </select>
              ��<font color="#FF0000">*</font></td>
            <td width="11%"><div align="right">���壺</div></td>
            <td width="35%"><select name="nation" class="input" id="nation">
                <option value="����">����</option>
                <option value="����">����</option>
                <option value="�ɹ���">�ɹ���</option>
                <option value="����">����</option>
                <option value="׳��">׳��</option>
                <option value="ά�����">ά�����</option>
                <option value="����">����</option>
                <option value="������">������</option>
                <option value="����">����</option>
              </select></td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="30"><div align="right">֤�����ͣ�</div></td>
            <td><select name="cardtype" class="input">
                <option VALUE="���֤" >���֤</option>
                <option VALUE="��֤" >��֤</option>
                <option VALUE="����֤" >����֤</option>
                <option VALUE="����" >����</option>
                <option VALUE="����" >����</option>
              </select></td>
            <td><div align="right">֤�����룺</div></td>
            <td> <input name="cardno" type="text" class="input" size="26">
              <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="30"><div align="right">����״����</div></td>
            <td><input name="marry" type="radio" value="1" checked>
              δ�� 
              <input name="marry" type="radio" value="2">
              �ѻ� 
              <input name="marry" type="radio" value="3">
              ���� 
              <input name="marry" type="radio" value="4">
              ����</td>
            <td><div align="right">��ߣ�</div></td>
            <td> <font color="#FF0000"> 
              <input name="height" type="text" class="input" size="6">
              </font>����(1.7�� = 170 ����)<font color="#FF0000"> *</font></td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="30"><div align="right">���᣺</div></td>
            <td colspan="3"> <div align="left">
                <select name="province" class="input" id="province" onChange="javascript:selectcitys(this, document.form1.citys)" >
                  <option value="" selected >��ѡ��</option>
                  <option value="1" >����</option>
                  <option value="2" >���</option> 
                  <option value="3" >�Ϻ�</option> 
                  <option value="4" >����</option> 
                  <option value="5" >�㽭</option>  
                  <option value="6" >�㶫</option>
                  <option value="7" >����</option>  
                  <option value="8" >����</option>
                  <option value="9" >����</option> 
                  <option value="10" >����</option>  
                  <option value="11" >ɽ��</option>
                  <option value="12" >����</option>  
                  <option value="13" >����</option> 
                  <option value="14" >����</option>  
                  <option value="15" >�Ĵ�</option>
                  <option value="16" >����</option>  
                  <option value="17" >����</option>
                  <option value="18" >������</option>  
                  <option value="19" >�ӱ�</option>
                  <option value="20" >����</option> 
                  <option value="21" >����</option>
                  <option value="22" >����</option> 
                  <option value="23" >ɽ��</option>
                  <option value="24" >���ɹ�</option>
                  <option value="25" >����</option> 
                  <option value="26" >����</option>  
                  <option value="27" >����</option>
                  <option value="28" >�ຣ</option>  
                  <option value="29" >�½�</option>
                  <option value="30" >����</option>  
                  <option value="31" >����</option>
                  <option value="32" >̨��</option>  
                  <option value="33" >���</option>
                  <option value="34" >����</option> 
                  <option value="35" >����</option>
                  <option value="36">����</option>
                </select>
                ( ʡ��ֱϽ�С�������)<font color="#FF0000"> 
                <SELECT name="citys" class="input" id="citys">
                </SELECT>
                </font>(�С�������)</div></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;��������</strong></td>
        </tr>
      </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr bgcolor="#fbfbfb"> 
          <td width="16%" height="26"><div align="right">���ѧ����</div></td>
          <td><select name="degree" class="input" id="degree">
		        <option value="0" >��������</option>
                <option value="1" selected >����</option>
                <option value="2" >ְ��</option>
                <option value="3" >��ר</option>
                <option value="4" >��ר</option>
                <option value="5" >����</option>
                <option value="6" >˶ʿ</option>
                <option value="7" >��ʿ</option>
              </select></td>
          <td><div align="right">��ҵԺУ��</div></td>
          <td><input name="college" type="text" class="input" id="college" size="26">
            </td>
        </tr>
        <tr> 
          <td height="26"><div align="right">����רҵ��</div></td>
          <td><input name="spec1" type="text" class="input" id="spec1" size="26">
            </td>
          <td><div align="right">�ڶ�רҵ��</div></td>
          <td><input name="spec2" type="text" class="input" id="spec2" size="26"></td>
        </tr>
        <tr bgcolor="#fbfbfb"> 
          <td height="26"><div align="right">�����ˮƽ��</div></td>
          <td><select name="com_level" class="input">
                            <option value="���������һ��" >���������һ��</option>
                            <option value="�칫���������" >�칫���������</option>
                            <option value="����ʹ�ò������" >����ʹ�ò������</option>
                            <option value="�����շ��ʼ����Ű�" >�����շ��ʼ����Ű�</option>
                            <option value="���|����|�칫|Ӳ��" >��Ϥ���������</option>
                            <option value="��ͨ�������" selected>��ͨ�������</option>
                            <option value="��ͨ����Ӳ��" >��ͨ����Ӳ��</option>
                            <option value="��ͨ���Ӳ��" >��ͨ���Ӳ��</option>
                            <option value="�������̵���" >�������̵���</option>
                            <option value="����INTERNET���" >����INTERNET���</option>
                            <option value="��ͨINTERNET���" >��ͨINTERNET���</option>
                            <option value="��ʵ�ʵ�Ӧ������" >��ʵ�ʵ�Ӧ������</option>
                          </select></td>
          <td><div align="right">������ò��</div></td>
          <td><select name="zzmm" class="input" id="zzmm">
                <option value="Ⱥ��" >Ⱥ��</option>
                <option value="�й���Ա" >�й���Ա</option>
                <option value="������Ա" >������Ա</option>
                <option value="��������" >��������</option>
                <option value="����" >����</option>
              </select></td>
        </tr>
        <tr> 
          <td height="26"><div align="right">��һ���</div></td>
          <td width="34%"><input name="l_type1" type="text" class="input" size="26"></td>
          <td width="15%"><div align="right">����ˮƽ��</div></td>
          <td width="35%"><select name="l_level1" class="input" id="l_level1">
                            <option value="����" >����</option>
                            <option value="һ��" selected>һ��</option>
                            <option value="����" >����</option>
                            <option value="����" >����</option>
                          </select></td>
        </tr>
        <tr bgcolor="#fbfbfb"> 
          <td height="26"><div align="right">�ڶ����</div></td>
          <td><input name="l_type2" type="text" class="input" id="l_type2" size="26"></td>
          <td><div align="right">Ӣ��ˮƽ��</div></td>
          <td><select name="l_level2" class="input" id="l_level2">
                <option value="����" >����</option>
                <option value="һ��" selected>һ��</option>
                <option value="����" >����</option>
                <option value="����" >����</option>
              </select></td>
        </tr>
        <tr> 
          <td height="26"><div align="right">����֤�飺</div></td>
          <td colspan="3"><input name="certificate" type="text" class="input" id="certificate" size="55">
              (�磺IT��֤����ʦ֤�����֤���ȵ�)</td>
        </tr>
        <tr bgcolor="#fbfbfb"> 
          <td height="26"><div align="right">��ѵ�������������ܣ�</div></td>
          <td colspan="3"><textarea name="edu_career" cols="66" rows="5" class="input" id="edu_career">(���磺X��X�¡�X��X��    ĳѧУ/��ѵ��������     רҵ/��Ŀ���ơ� ���ĳ֤�飩 </textarea>
              <font color="#FF0000">*</font>��1000�����ڣ�</td>
        </tr>
      </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;��ְ����</strong></td>
        </tr>
      </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="26"><div align="right">ӦƸ����ҵ(һ)��</div></td>
            <td width="35%"><select name="maincatelog" class="input" id="maincatelog" onChange="javascript:selectjob(this, document.form1.subcatelog)" >
                <option value="" selected >��ѡ��</option>
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
              </select> <font color="#FF0000">*</font></td>
            <td width="15%"><div align="right">����ְλ(һ)��</div></td>
            <td width="35%"><SELECT name="subcatelog" class="input" id="subcatelog">
              </SELECT> <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="26"><div align="right">ӦƸ����ҵ(��)��</div></td>
            <td><select name="maincatelog2" class="input" id="maincatelog2" onChange="javascript:selectjob(this, document.form1.subcatelog2)" >
                <option value="0" selected >��ѡ��</option>
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
            <td><div align="right">����ְλ(��)��</div></td>
            <td><SELECT name="subcatelog2" class="input" id="subcatelog2">
              </SELECT></td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="26"><div align="right">���ʺϵ�ְλ��</div></td>
            <td><input name="jobname" type="text" class="input" id="jobname">
              <font color="#FF0000">*</font>(����д���)</td>
            <td><div align="right">ȫְ/��ְ��</div></td>
            <td><select name="jobtype" class="input" id="jobtype">
                <option value=1>ȫְ</option>
                <option value=2>��ְ</option>
                <option value=3>������</option>
              </select></td>
          </tr>
          <tr> 
            <td height="26"><div align="right">нˮҪ��</div></td>
            <td><select name="salary" class="input" id="salary">
                    <option value="0" selected >����</option>
                    <option value="1" >3000����</option>
                    <option value="2" >3000-4000</option>
                    <option value="3" >4000-5000</option>
                    <option value="4" >5000-7000</option>
                    <option value="5" >7000����</option>
              </select>
              (Ԫ/��)</td>
            <td><div align="right">ס��Ҫ��</div></td>
            <td><select name="workhouse" class="input" id="workhouse">
                <option value="����Э��" >����Э��</option>
                <option value="��˾�ṩ" >��˾�ṩ</option>
                <option value="���н��" >���н��</option>
              </select></td>
          </tr>
          <tr> 
            <td height="26"><div align="right">����ʱ�䣺</div></td>
            <td colspan="3"><select name="checkindate" class="input" id="checkindate">
                <option value="">��ѡ��</option>
                <option value="1">��ʱ����</option>
                <option value="2">������</option>
                <option value="3">һ����</option>
                <option value="4">һ������</option>
                <option value="5">��������</option>
                <option value="6">����Э��</option>
              </select> <font color="#FF0000">*</font></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;�������ۡ��Լ�˵��</strong></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="26"><div align="right">�������Լ�˵����</div></td>
            <td width="85%"><textarea name="selfintro" cols="66" rows="5" class="input" id="selfintro">�����磺�س������ܡ��������ۡ������Ƽ��ȣ������ҷ��ӣ� </textarea>
              <font color="#FF0000">*</font>��500�����ڣ�</td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;��������</strong></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="15%" height="26"><div align="right">�������飺</div></td>
            <td width="85%"><input name="doneyear" type="text" class="input" id="doneyear" size="5">
              ��<font color="#FF0000">*</font>(Ӧ���ҵ����д<font color="#FF0000">0</font>)</td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="26"><div align="right">�����������ܣ�</div></td>
            <td><textarea name="job_career" cols="66" rows="6" class="input" id="job_career">(���磺X��X�¡�X��X��     ĳʵϰ/������λ      ĳ����ְλ       ����ĳ�����</textarea>
              <font color="#FF0000">*</font> ��1000�����ڣ�</td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;��ϵ��ʽ</strong></td>
          </tr>
        </table>
        <div align="center"><br />
          <font color="#FF0000">�ر����ѣ�</font>���Լ���ġ�����Ƚ����ŵģ���һ��Ҫ��д���˵���������ַ���磺������ᣬQQ�������BLOG�ȡ�<br />
          ��û�����������Լ�ȥע�����룩�������˵�λ��ȫ����˽��㣬�԰�����ְ�����ܴ�<br />
        </div>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="26"><div align="right">�绰��</div></td>
            <td width="39%"><input name="tel" type="text" class="input" id="jobname3">
              <font color="#FF0000">*</font></td>
            <td width="11%"><div align="right">�ֻ���</div></td>
            <td width="35%"><input name="mobile" type="text" class="input" id="tel"></td>
          </tr>
          <tr> 
            <td height="26"><div align="right">������룺</div></td>
            <td><input name="chatno" type="text" class="input" id="tel2" size="20">
              (QQ��ICQ��MSN��)</td>
            <td><div align="right">�����������/��ҳ��</div></td>
            <td><input name="selfweb" type="text" class="input" id="tel3">
              ��:QQ��ᡢBLOG</td>
          </tr>
          <tr bgcolor="#fbfbfb"> 
            <td height="26"><div align="right">סַ��</div></td>
            <td><input name="address" type="text" class="input" id="tel4" size="36">
              <font color="#FF0000">*</font></td>
            <td><div align="right">�ʱࣺ</div></td>
            <td><input name="zipcode" type="text" class="input" id="tel5"></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="26" background="../images/bo_03.gif"><strong>&nbsp;&nbsp;��������</strong></td>
          </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr bgcolor="#fbfbfb"> 
            <td width="15%" height="26"><div align="right">�������ã�</div></td>
            <td><input name="resumestatus" type="radio" value="open" checked>
              �������� 
              <input name="resumestatus" type="radio" value="hide">
              ��ȫ����</td>
          </tr>
        </table>
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td><div align="center">
                <input name="Submit" type="submit"  value="��д���  �ύ����">
              </div></td>
          </tr>
        </table>
      </td>
  </tr></form>
</table>
<br>
<br>
<!--#include file="bottom.asp"-->
</body>
</html>
