<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����͹���Ƹ��-������ְ����--�����͹�/��������/�͹���Ƹ</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="top.asp"-->
<SCRIPT language=javascript src="inc/basicinfo.js"></SCRIPT>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="win2_update_table">
  <tr>
    <td height="22" class="win2_update_table_top">�������Ϲ���</td>
  </tr><form name="form1" method="post" action="basicinfo_save.asp" onSubmit="return Juge(this)">
  <tr>
    <td style="padding-top:5px;">
   
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr >
          <td height="22" colspan="4"   ><strong>&nbsp;��������</strong></td>
        </tr>
        <tr >
          <td width="15%" height="30" class="win2_update_table_td"><div align="right">������</div></td>
          <td><input name="uname" type="text" class="input" id="uname" value="<%=rs("uname")%>" size="26">
                <font color="#FF0000">*</font></td>
          <td class="win2_update_table_td"><div align="right">�Ա�</div></td>
          <td><input name="sex" type="radio" value="1" <%if rs("sex")=true then%>checked<%end if%>>
            ��
            <input type="radio" name="sex" value="0" <%if rs("sex")=false then%>checked<%end if%>>
            Ů</td>
        </tr>
        <tr>
          <td height="30" class="win2_update_table_td"><div align="right">�������ڣ�</div></td>
          <td width="37%"><input name="u_year" type="text" class="input" id="u_year" value="<%=rs("u_year")%>" size="4" maxlength="4">
            ��
            <select name="u_month" class="input">
                  <option value="0" >ѡ��</option>
                  <option value="1" <%if rs("u_month")=1 then%>selected<%end if%>>01</option>
                  <option value="2" <%if rs("u_month")=2 then%>selected<%end if%>>02</option>
                  <option value="3" <%if rs("u_month")=3 then%>selected<%end if%>>03</option>
                  <option value="4" <%if rs("u_month")=4 then%>selected<%end if%>>04</option>
                  <option value="5" <%if rs("u_month")=5 then%>selected<%end if%>>05</option>
                  <option value="6" <%if rs("u_month")=6 then%>selected<%end if%>>06</option>
                  <option value="7" <%if rs("u_month")=7 then%>selected<%end if%>>07</option>
                  <option value="8" <%if rs("u_month")=8 then%>selected<%end if%>>08</option>
                  <option value="9" <%if rs("u_month")=9 then%>selected<%end if%>>09</option>
                  <option value="10" <%if rs("u_month")=10 then%>selected<%end if%>>10</option>
                  <option value="11" <%if rs("u_month")=10 then%>selected<%end if%>>11</option>
                  <option value="12" <%if rs("u_month")=12 then%>selected<%end if%>>12</option>
                </select>
            ��
            <select name="u_day" class="input">
              <option value="0" >ѡ��</option>
              <option value="1" <%if rs("u_day")=1 then%>selected<%end if%>>01</option>
              <option value="2" <%if rs("u_day")=2 then%>selected<%end if%>>02</option>
              <option value="3" <%if rs("u_day")=3 then%>selected<%end if%>>03</option>
              <option value="4" <%if rs("u_day")=4 then%>selected<%end if%>>04</option>
              <option value="5" <%if rs("u_day")=5 then%>selected<%end if%>>05</option>
              <option value="6" <%if rs("u_day")=6 then%>selected<%end if%>>06</option>
              <option value="7" <%if rs("u_day")=7 then%>selected<%end if%>>07</option>
              <option value="8" <%if rs("u_day")=8 then%>selected<%end if%>>08</option>
              <option value="9" <%if rs("u_day")=9 then%>selected<%end if%>>09</option>
              <option value="10" <%if rs("u_day")=10 then%>selected<%end if%>>10</option>
              <option value="11" <%if rs("u_day")=11 then%>selected<%end if%>>11</option>
              <option value="12" <%if rs("u_day")=12 then%>selected<%end if%>>12</option>
              <option value="13" <%if rs("u_day")=13 then%>selected<%end if%>>13</option>
              <option value="14" <%if rs("u_day")=14 then%>selected<%end if%>>14</option>
              <option value="15" <%if rs("u_day")=15 then%>selected<%end if%>>15</option>
              <option value="16" <%if rs("u_day")=16 then%>selected<%end if%>>16</option>
              <option value="17" <%if rs("u_day")=17 then%>selected<%end if%>>17</option>
              <option value="18" <%if rs("u_day")=18 then%>selected<%end if%>>18</option>
              <option value="19" <%if rs("u_day")=19 then%>selected<%end if%>>19</option>
              <option value="20" <%if rs("u_day")=20 then%>selected<%end if%>>20</option>
              <option value="21" <%if rs("u_day")=21 then%>selected<%end if%>>21</option>
              <option value="22" <%if rs("u_day")=22 then%>selected<%end if%>>22</option>
              <option value="23" <%if rs("u_day")=23 then%>selected<%end if%>>23</option>
              <option value="24" <%if rs("u_day")=24 then%>selected<%end if%>>24</option>
              <option value="25" <%if rs("u_day")=25 then%>selected<%end if%>>25</option>
              <option value="26" <%if rs("u_day")=26 then%>selected<%end if%>>26</option>
              <option value="27" <%if rs("u_day")=27 then%>selected<%end if%>>27</option>
              <option value="28" <%if rs("u_day")=28 then%>selected<%end if%>>28</option>
              <option value="29" <%if rs("u_day")=29 then%>selected<%end if%>>29</option>
              <option value="30" <%if rs("u_day")=30 then%>selected<%end if%>>30</option>
              <option value="31" <%if rs("u_day")=31 then%>selected<%end if%>>31</option>
            </select>
            ��<font color="#FF0000">*</font></td>
          <td width="13%" class="win2_update_table_td"><div align="right">���壺</div></td>
          <td width="35%"><select name="nation" class="input" id="nation">
            <option value="����" <%if rs("nation")="����" then%>selected<%end if%>>����</option>
            <option value="����" <%if rs("nation")="����" then%>selected<%end if%>>����</option>
            <option value="�ɹ���" <%if rs("nation")="�ɹ���" then%>selected<%end if%>>�ɹ���</option>
            <option value="����" <%if rs("nation")="����" then%>selected<%end if%>>����</option>
            <option value="׳��" <%if rs("nation")="׳��" then%>selected<%end if%>>׳��</option>
            <option value="ά�����" <%if rs("nation")="ά�����" then%>selected<%end if%>>ά�����</option>
            <option value="����" <%if rs("nation")="����" then%>selected<%end if%>>����</option>
            <option value="������" <%if rs("nation")="������" then%>selected<%end if%>>������</option>
            <option value="����" <%if rs("nation")="����" then%>selected<%end if%>>����</option>
          </select></td>
        </tr>
        <tr >
          <td height="30" class="win2_update_table_td"><div align="right">֤�����ͣ�</div></td>
          <td><select name="cardtype" class="input">
            <option VALUE="���֤" <%if rs("cardtype")="���֤" then%>selected<%end if%>>���֤</option>
            <option VALUE="��֤" <%if rs("cardtype")="��֤" then%>selected<%end if%>>��֤</option>
            <option VALUE="����֤" <%if rs("cardtype")="����֤" then%>selected<%end if%>>����֤</option>
            <option VALUE="����" <%if rs("cardtype")="����" then%>selected<%end if%>>����</option>
            <option VALUE="����" <%if rs("cardtype")="����" then%>selected<%end if%>>����</option>
          </select></td>
          <td class="win2_update_table_td"><div align="right">֤�����룺</div></td>
          <td><input name="cardno" type="text" class="input" value="<%=rs("cardno")%>" size="26">
                <font color="#FF0000">*</font></td>
        </tr>
        <tr>
          <td height="30" class="win2_update_table_td"><div align="right">����״����</div></td>
          <td><input name="marry" type="radio" value="1" <%if rs("marry")="1" then%>checked<%end if%>>
            δ��
            <input name="marry" type="radio" value="2" <%if rs("marry")="2" then%>checked<%end if%>>
            �ѻ�
            <input name="marry" type="radio" value="3" <%if rs("marry")="3" then%>checked<%end if%>>
            ����
            <input name="marry" type="radio" value="4" <%if rs("marry")="4" then%>checked<%end if%>>
            ����</td>
          <td class="win2_update_table_td"><div align="right">��ߣ�</div></td>
                  <td><font color="#FF0000"> 
                    <input name="height" type="text" class="input" value="<%=rs("height")%>" size="6">
                    </font>����(1.7��=170���� )<font color="#FF0000"> *</font></td>
        </tr>
        <tr>
          <td height="30" class="win2_update_table_td"><div align="right">���᣺</div></td>
          <td colspan="3"><div align="left"> <font color="#000000">
            <select name="province" class="input" id="province" onChange="javascript:selectcitys(this, document.form1.citys)" >
              <option value="0">��ѡ��</option>
              <option value="1" <%if rs("province")=1 then%>selected<%end if%>>����</option>
              <option value="2" <%if rs("province")=2 then%>selected<%end if%>>���</option>
              <option value="3" <%if rs("province")=3 then%>selected<%end if%>>�Ϻ�</option>
              <option value="4" <%if rs("province")=4 then%>selected<%end if%>>����</option>
              <option value="5" <%if rs("province")=5 then%>selected<%end if%>>�㽭</option>
              <option value="6" <%if rs("province")=6 then%>selected<%end if%>>�㶫</option>
              <option value="7" <%if rs("province")=7 then%>selected<%end if%>>����</option>
              <option value="8" <%if rs("province")=8 then%>selected<%end if%>>����</option>
              <option value="9" <%if rs("province")=9 then%>selected<%end if%>>����</option>
              <option value="10" <%if rs("province")=10 then%>selected<%end if%>>����</option>
              <option value="11" <%if rs("province")=11 then%>selected<%end if%>>ɽ��</option>
              <option value="12" <%if rs("province")=12 then%>selected<%end if%>>����</option>
              <option value="13" <%if rs("province")=13 then%>selected<%end if%>>����</option>
              <option value="14" <%if rs("province")=14 then%>selected<%end if%>>����</option>
              <option value="15" <%if rs("province")=15 then%>selected<%end if%>>�Ĵ�</option>
              <option value="16" <%if rs("province")=16 then%>selected<%end if%>>����</option>
              <option value="17" <%if rs("province")=17 then%>selected<%end if%>>����</option>
              <option value="18" <%if rs("province")=18 then%>selected<%end if%>>������</option>
              <option value="19" <%if rs("province")=19 then%>selected<%end if%>>�ӱ�</option>
              <option value="20" <%if rs("province")=20 then%>selected<%end if%>>����</option>
              <option value="21" <%if rs("province")=21 then%>selected<%end if%>>����</option>
              <option value="22" <%if rs("province")=22 then%>selected<%end if%>>����</option>
              <option value="23" <%if rs("province")=23 then%>selected<%end if%>>ɽ��</option>
              <option value="24" <%if rs("province")=24 then%>selected<%end if%>>���ɹ�</option>
              <option value="25" <%if rs("province")=25 then%>selected<%end if%>>����</option>
              <option value="26" <%if rs("province")=26 then%>selected<%end if%>>����</option>
              <option value="27" <%if rs("province")=27 then%>selected<%end if%>>����</option>
              <option value="28" <%if rs("province")=28 then%>selected<%end if%>>�ຣ</option>
              <option value="29" <%if rs("province")=29 then%>selected<%end if%>>�½�</option>
              <option value="30" <%if rs("province")=30 then%>selected<%end if%>>����</option>
              <option value="31" <%if rs("province")=31 then%>selected<%end if%>>����</option>
              <option value="32" <%if rs("province")=32 then%>selected<%end if%>>̨��</option>
              <option value="33" <%if rs("province")=33 then%>selected<%end if%>>���</option>
              <option value="34" <%if rs("province")=34 then%>selected<%end if%>>����</option>
              <option value="35" <%if rs("province")=35 then%>selected<%end if%>>����</option>
              <option value="36" <%if rs("province")=36 then%>selected<%end if%>>����</option>
            </select>
            </font><font color="#FF0000"> </font><font color="#000000"><font color="#FF0000">
              <SELECT name="citys" class="input" id="select">
                <option value="<%=rs("citys")%>"><%=rs("citys")%></option>
              </SELECT>
            </font></font><font color="#FF0000"> </font></div></td>
        </tr>
      </table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td height="26" colspan="4" ><strong>&nbsp;��ϵ��ʽ</strong></td>
        </tr>
        <tr >
          <td width="15%" height="26" class="win2_update_table_td"><div align="right">�绰��</div></td>
          <td width="40%"><input name="tel" type="text" class="input" value="<%=rs("tel")%>" size="20" maxlength="30">
                <font color="#FF0000">*</font></td>
          <td width="11%" class="win2_update_table_td"><div align="right">�ֻ���</div></td>
          <td width="34%"><input name="mobile" type="text" class="input" value="<%=rs("mobile")%>" size="20" maxlength="30"></td>
        </tr>
        <tr>
          <td height="26" class="win2_update_table_td"><div align="right">������룺</div></td>
          <td><input name="chatno" type="text" class="input" value="<%=rs("chatno")%>" size="20" maxlength="30">
            (QQ��ICQ��MSN��)</td>
          <td class="win2_update_table_td"><div align="right">��ҳ��QQ��ᡢBLOG��</div></td>
          <td><input name="selfweb" type="text" class="input" value="<%=rs("selfweb")%>" size="25" maxlength="40"></td>
        </tr>
        <tr >
          <td height="26" class="win2_update_table_td"><div align="right">סַ��</div></td>
          <td><input name="address" type="text" class="input" value="<%=rs("address")%>" size="25">
                <font color="#FF0000">*</font></td>
          <td class="win2_update_table_td"><div align="right">�ʱࣺ</div></td>
          <td><input name="zipcode" type="text" class="input" value="<%=rs("zipcode")%>" size="10" maxlength="6"></td>
        </tr>
      </table>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="60" align="center"><button accesskey="K" type="submit" onclick="return check()" class="win_"><img src="../images/203.gif" width="16" height="16" /> ȷ�Ϸ���</button>
          </td>
        </tr>
      </table>
    
    </td>
  </tr></form>
</table>
<br /></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%call closeconn()%>
