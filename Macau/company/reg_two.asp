<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../personadmin/inc/random.asp"-->
<!--#include file="../personadmin/inc/md5.asp"-->
<%
if not (instr(1,Request.ServerVariables("http_Referer"),Request.ServerVariables ("SERVER_NAME"),1)=8) then
  response.Redirect("reg_one.asp")
  response.End()
end if 
session("username")=request.Form("username")
session("pwd1")=request.form("pwd1")
session("password")=md5(request.Form("pwd1"))
'session("question")=request.Form("question")
'session("answer")=request.Form("answer")
session("email")=request.Form("email")
session("cid")=gen_key(7)
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from [01387company] where cid='"&session("cid")&"'"
rs.open sql,conn,1,1
if rs.recordcount>=1 then
session("cid")=gen_key(7)
rs.close
set rs=nothing
end if
if session("username")="" or session("password")=""   then
response.Redirect("reg_one.asp")
response.End()
end if
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from [01387company] where username='"&session("username")&"'"
rs.open sql,conn,1,1
if rs.recordcount>=1 then
response.write"<SCRIPT language=JavaScript>alert('�û��ʺ��Ѿ����ڣ�������ѡ��');"
response.write"javascript:history.go(-1)</SCRIPT>"
response.End()
rs.close
set rs=nothing
end if
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ע����ҵ��Ա</title>
<link href="../css/01387.css" rel="stylesheet" type="text/css" />
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="../inc/top_1.asp"-->
<script language="JavaScript" src="inc/check2.js"></script>  
<table width="766" height="8" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" bgcolor="#FFFFFF" id="AutoNumber35" style="border-collapse: collapse">
  <tr> 
   <td width="776" height="8"></td>
  </tr>
</table>
  <center>
  <table width="776" border="0" cellpadding="0" cellspacing="0" bordercolor="#111111" bgcolor="#FFFFFF" style="border-collapse: collapse">
<form name="form1" action="reg_two_save.asp" method="post" onSubmit="return Juge(this)">      <tr> 
        <td width="96%"> <div align="right"> <font color="#009900" face="Verdana" style="font-size: 14px" > 
            <strong> </strong></font><font color="#000000" face="Verdana" style="font-size: 12px" >
            </font></div>
          <table width="100%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
            <tr> 
              <td height="115" align="left" bgcolor="#FFFFFF"> <font color="#000000" face="Verdana" style="font-size: 12px" >������������Ҫ����д��˾���ϣ���&quot;</font><font color="#FF0000">*</font>&quot;��Ϊ����� 
                <p style="line-height:160%;"><font color="#999999">��1������д�ʺ���Ϣ������ɣ�</font><br />
                  <font color="#00468D"><strong>��2��:��д��������</strong></font><font color="#999999"><br />
                  ��3��:ע��ɹ�����½ϵͳ������Ƹ��Ϣ</font></p></td>
            </tr>
          </table>
          �� 
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999">
            <tr>
              <td bgcolor="#FFFFFF"><table width="100%" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="21" align="left" bgcolor="#999999"><font color="#FFFFFF" face="Verdana" style="font-size: 14px" >
                      <p style="margin-left:10px;margin-top:3px;font-size: 14px"> <strong> <b>������Ϣ</b> </strong> </p>
                    </font> </td>
                  </tr>
                  <tr>
                    <td height="2" bgcolor="#E2E2E2"></td>
                  </tr>
                </table>
                  <br />
                  <table width="100%" height="393" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
                    <tr bgcolor="#F6F9FD">
                      <td height="25" align="right" nowrap="nowrap" bgcolor="#F6F9FD"> ��˾���ƣ� </td>
                      <td height="20" align="middle" bgcolor="#F6F9FD"><p align="left">
                          <input name="companyname" type="text" class="input" size="38" maxlength="200" />
                      </p></td>
                      <td width="315" height="20" align="left" bgcolor="#F6F9FD"><font color="#FF0000">*</font><font color="#666666">&nbsp;</font><font color="#666666">(��׼ȷ��д��˾���ơ�һ��ע��ɹ�����˾���Ʋ����޸ģ��Է�����ְ��Ѹ����������˾���ϡ�) </font> </td>
                    </tr>
                    <tr>
                      <td align="right" width="107" bgcolor="#ffffff" height="25"> Ӫҵִ�գ� </td>
                      <td width="308" height="20" align="middle" bgcolor="#ffffff"><p align="left">
                          <input name="licence" type="text" class="input" id="licence" size="38" maxlength="80" />
                      </p></td>
                      
                    <td width="315" height="20" align="left" bgcolor="#ffffff"><font color="#666666">��ѡ����д</font></td>
                    </tr>
                    <tr bgcolor="#F6F9FD">
                      <td height="25" align="right"><span style="FONT-SIZE: 12px; FONT-FAMILY: ����"> ������ҵ�� </span> </td>
                      <td width="308" height="20" align="middle"><p align="left">
                          <select name="trade" size="1" class="input" id="trade" style="width: 240px; font-size: 12px; font-family: ����">
                            <script language="JavaScript" type="text/javascript">writeTrade()</script>
                          </select>
                      </p></td>
                      <td width="315" height="20" align="left"><font color="#FF0000">*</font><font color="#666666">&nbsp;</font>��</td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#ffffff" height="25"> ��˾���ʣ� </td>
                      <td width="308" height="20" align="middle" bgcolor="#ffffff"><p align="left">
                          <select name="properity" class="input" id="properity">
                            <script language="JavaScript" type="text/javascript">writeNature()</script>
                          </select>
                      </p></td>
                      <td width="315" height="20" align="left" bgcolor="#ffffff"><font color="#FF0000">*</font><font color="#666666">&nbsp;</font></td>
                    </tr>
                    <tr bgcolor="#F6F9FD">
                      <td height="25" align="right" nowrap="nowrap"> �������ڣ� </td>
                      <td width="308" height="20" align="middle"><p align="left">
                          <input name="u_year" type="text" class="input" id="u_year" size="5" />
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
                      ��<font color="#FF0000"></font></p></td>
                      <td width="315" height="20" align="left"><font color="#FF0000">*</font><font color="#666666">&nbsp;</font></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#ffffff" height="25"> ע���ʽ� </td>
                      <td height="20" colspan="2" align="middle" bgcolor="#ffffff"><p align="left">
                          <input name="fund" type="text" class="input" id="fund" size="10" />
                        ��Ԫ</p></td>
                    </tr>
                    <tr bgcolor="#F6F9FD">
                      <td height="25" align="right" nowrap="nowrap"> Ա�������� </td>
                      <td height="20" colspan="2"><p align="left">
                          <input type="radio" checked="checked" value="����50��" name="employee" />
                        ����<b>50</b>��
                        <input name="employee" type="radio" value="50-200��" checked="checked" />
                        <b>50-200</b>��
                        <input type="radio" value="200-500��" name="employee" />
                        <b>200-500</b>��
                        <input type="radio" value="500-1000��" name="employee" />
                        <b>500-1000</b>��
                        <input type="radio" value="1000������" name="employee" />
                        <b>1000</b>������ <font color="#FF0000">*</font><font color="#666666"></font></p></td>
                    </tr>
                    <tr>
                      <td height="25" align="right" nowrap="nowrap" bgcolor="#ffffff">���˴���</td>
                      <td height="20" align="middle" bgcolor="#ffffff"><div align="left">
                          <input name="legal" type="text" class="input" id="legal" size="30" maxlength="80" />
                      </div></td>
                      
                    <td height="20" align="left" bgcolor="#ffffff"><font color="#666666">(��˾���ˣ�������)&nbsp;</font></td>
                    </tr>
                    <tr bgcolor="#F6F9FD">
                      <td height="25" align="right" nowrap="nowrap"> ��˾��飺 </td>
                      <td height="20" colspan="2" align="middle"><div align="left"><span style="FONT-SIZE: 12px; FONT-FAMILY: ����"><font color="#FF0000">*</font><font color="#666666">( 
                        ����ַ���5000,�뾡������ϸ��д���ϡ�</font></span>) ��</div></td>
                    </tr>
                    <tr>
                      <td width="107" height="20" align="left">��</td>
                      <td height="20" colspan="2" align="left" valign="top"><textarea name="intro" cols="64" rows="8" class="input" id="intro"></textarea>
                          <span style="FONT-SIZE: 12px; FONT-FAMILY: ����"> </span></td>
                    </tr>
                  </table>
                <br />
                  <table width="100%" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="21" align="left" bgcolor="#999999"><font color="#FFFFFF" face="Verdana" style="font-size: 14px" >
                        <p style="margin-left:10px;margin-top:3px;font-size: 14px"> <strong><b>��ϵ��ʽ</b></strong> </p>
                      </font> </td>
                    </tr>
                    <tr>
                      <td height="2" bgcolor="#E2E2E2"></td>
                    </tr>
                  </table>
                <br />
                  <table width="100%" height="114" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
                    <tr>
                      <td width="105" height="25" align="right"> �� ϵ �ˣ� </td>
                      <td width="387" height="18" align="middle"><p align="left">
                          <input name="contact" type="text" class="input" id="contact" size="28" maxlength="50" />
                      </p></td>
                      <td width="238" align="left"><div align="left"><font color="#FF0000">*</font><font color="#666666">( 
                        ��������ȷ��ϵ�ˣ��Է�����ְ�����˾��ϵ�����磺��С��������� ) </font> </div></td>
                    </tr>
                    <tr bgcolor="#F6F9FD">
                      <td height="25" align="right"> ��ϵ�绰�� </td>
                      <td height="22" align="middle" bgcolor="#F6F9FD"><p align="left">
                          <input name="tel" type="text" class="input" id="tel" size="28" maxlength="50" />
                      </p></td>
                      <td width="238" align="left" bgcolor="#F6F9FD"><div align="left"> <font color="#FF0000">*</font></div></td>
                    </tr>
                    <tr>
                      <td align="right" height="25">�� �� �棺 </td>
                      <td align="middle" height="22"><div align="left">
                          <input name="fax" type="text" class="input" id="fax" size="28" maxlength="50" />
                      </div></td>
                      <td width="238" align="left">��</td>
                    </tr>
                    <tr bgcolor="#F6F9FD">
                      <td align="right" height="25"> �� �� ����</td>
                      <td height="22" align="middle" bgcolor="#F6F9FD"><p align="left">
                          <input name="mobile" type="text" class="input" id="mobile" size="28" maxlength="50" />
                      </p></td>
                      <td width="238" align="left" bgcolor="#F6F9FD"><font color="#666666">(��Ƹ��ϵ��)</font></td>
                    </tr>
                    <tr>
                      <td align="right" height="25">��˾��ҳ��</td>
                      <td align="middle" bgcolor="#FFFFFF" height="1"><p align="left">
                          <input name="website" type="text" class="input" id="website" value="Http://" size="38" maxlength="50" />
                      </p></td>
                      <td align="middle" bgcolor="#FFFFFF">��</td>
                    </tr>
                    <tr bgcolor="#F6F9FD">
                      <td height="25" align="right" nowrap="nowrap"> ͨѶ��ַ�� </td>
                      <td height="19" colspan="2" align="middle" bgcolor="#F6F9FD"><p align="left"> <font color="#000000">
                          <select name="province" id="province" onchange="javascript:selectcitys(this, document.form1.citys)" >
                            <option value="" selected="selected" >��ѡ��</option>
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
                        ( ʡ����)<font color="#FF0000">
                          <select name="citys" id="citys">
                          </select>
                          </font>(�С���)
                        <input name="address" type="text" class="input" size="30" maxlength="50"/>
                      </font><font color="#FF0000">*</font><font color="#000000"> </font> </p></td>
                    </tr>
                    <tr bgcolor="#FFFFFF">
                      <td height="25" align="right" nowrap="nowrap"> ��&nbsp;&nbsp;&nbsp; �ࣺ </td>
                      <td height="10" align="middle" bgcolor="#FFFFFF"><p align="left">
                          <input name="zipCode" type="text" class="input" size="8" maxlength="6"/>
                      </p></td>
                      <td width="238" align="middle" bgcolor="#FFFFFF">&nbsp;</td>
                    </tr>
                  </table>
                <br />
                  <table width="100%" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="21" align="left" bgcolor="#999999"><font color="#FFFFFF" face="Verdana" style="font-size: 14px" >
                        <p style="margin-left:10px;margin-top:3px;font-size: 14px"> <strong> <b>�� ��</b> </strong> </p>
                      </font> </td>
                    </tr>
                    <tr>
                      <td height="2" bgcolor="#E2E2E2"></td>
                    </tr>
                  </table>
                
                  <table width="100%" height="80" border="0" align="center" cellpadding="4" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
                    <tr>
                      
                    <td height="24" align="left" bgcolor="#F6F9FD"> ���ǴӺδ���֪�����͹���Ƹ����<font color="#666666">(��ѡ������һ������) 
                      </font></td>
                    </tr>
                    <tr>
                      <td height="25" align="left"><font color="#000000"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input name="knowfrom" type="checkbox" value="��������" checked="checked" />
                        ��������
                        <input type="checkbox" value="��վ����" name="knowfrom" />
                        ��վ����
                        <input type="checkbox" value="������" name="knowfrom" />
                        ������
                        <input type="checkbox" value="������־" name="knowfrom" />
                        ������־
                        <input type="checkbox" value="��ְ�" name="knowfrom" />
                        ��ְ�
                        <input type="checkbox" value="�����ʼ�" name="knowfrom" />
                      �����ʼ� </font></td>
                    </tr>
                    <tr>
                      <td height="25" align="left"><font color="#000000"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" value="���ѽ��� " name="knowfrom" />
                        ���ѽ���
                        <input type="checkbox" value="����ɵ�" name="knowfrom" />
                        ����ɵ�
                        <input type="checkbox" value="�㲥��̨" name="knowfrom" />
                        �㲥��̨
                        <input type="checkbox" value="�������" name="knowfrom" />
                        �������
                        <input type="checkbox" value="��������" name="knowfrom" />
                        ��������
                        <input type="checkbox" value="����" name="knowfrom" />
                      ���� </font></td>
                    </tr>
                  </table>
               
              </td>
            </tr>
          </table>
          <p align="center"> �� 
            <button accesskey="K" type="submit" class="win_"><img src="../images/203.gif" width="16" height="16" /> �ύע��</button>
            &nbsp; &nbsp;&nbsp; 
            <input type="reset" value=" ������� " name="Reset"  style="HEIGHT: 30px; width:120px; font-family: ����; font-size: 14px">
            <br />
            <br />
            <br />
          </p></td>
      </tr></form>
    </table>
  </center>
<table width="766" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" bgcolor="#FFFFFF">
  <tr><td></td></tr>
      </table>
<!--#include file="bottom.asp"-->
</body>
</html>
<%conn.close
set conn=nothing%>
