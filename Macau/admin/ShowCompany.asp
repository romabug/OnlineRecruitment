<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
dim chkNO
chkNO=request("chkNO")
if chkNO="" then
Call ShowError("��ѡ��һ����ҵ��")
end if
Call RsName(rs,"select * from [01387company] where cid='"&ChkNo&"'" ,1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<script language="JavaScript">
function writeTrade()
{
	with(document)
	{
		write("<option value='1' <%if rs("trade")=1 then%>selected<%end if%>>����������������</option>");
		write("<option value='2' <%if rs("trade")=2 then%>selected<%end if%>>�����ҵ����������ݿ⡢ϵͳ���ɣ�</option>");
		write("<option value='3' <%if rs("trade")=3 then%>selected<%end if%>>�����ҵ��Ӳ���������豸��</option>");
		write("<option value='4' <%if rs("trade")=4 then%>selected<%end if%>>���ӡ�΢���Ӽ���</option>");
		write("<option value='5' <%if rs("trade")=5 then%>selected<%end if%>>ͨѶ������ҵ</option>");
		write("<option value='6' <%if rs("trade")=6 then%>selected<%end if%>>�ҵ�ҵ</option>");
		write("<option value='7' <%if rs("trade")=7 then%>selected<%end if%>>��������(�ٻ������С��������ġ�ר���ꡭ)</option>");
		write("<option value='8' <%if rs("trade")=8 then%>selected<%end if%>>ó�ס����񡢽�����</option>");
		write("<option value='9' <%if rs("trade")=9 then%>selected<%end if%>>����</option>");
		write("<option value='10' <%if rs("trade")=10 then%>selected<%end if%>>��������Դ�����ҵ</option>");
		write("<option value='11' <%if rs("trade")=11 then%>selected<%end if%>>ʯ�͡�����ҵ</option>");
		write("<option value='12' <%if rs("trade")=12 then%>selected<%end if%>>���﹤�̡���ҩ������</option>");
		write("<option value='13' <%if rs("trade")=13 then%>selected<%end if%>>��е���졢�����豸���ع�ҵ</option>");
		write("<option value='14' <%if rs("trade")=14 then%>selected<%end if%>>������Ħ�г�</option>");
		write("<option value='15' <%if rs("trade")=15 then%>selected<%end if%>>�����Ǳ��繤�豸</option>");
		write("<option value='16' <%if rs("trade")=16 then%>selected<%end if%>>��桢���ء����</option>");
		write("<option value='17' <%if rs("trade")=17 then%>selected<%end if%>>�������Ļ�������ý�塢Ӱ�����������ų���</option>");
		write("<option value='18' <%if rs("trade")=18 then%>selected<%end if%>>��������Ʒ��ʳƷ�����ϡ����͡���ױƷ���̾ơ���</option>");
		write("<option value='19' <%if rs("trade")=19 then%>selected<%end if%>>��֯Ʒҵ�����Ρ�Ь�ࡢ�ҷ���Ʒ��Ƥ�ߡ���</option>");
		write("<option value='20' <%if rs("trade")=20 then%>selected<%end if%>>��ѯҵ�����ʡ����ʦ�����ʦ�����ɣ�</option>");
		write("<option value='21' <%if rs("trade")=21 then%>selected<%end if%>>����ҵ��Ͷ�ʡ����ա�֤ȯ�����С�����</option>");
		write("<option value='22' <%if rs("trade")=22 then%>selected<%end if%>>���������ز�����ҵ����װ��</option>");
		write("<option value='23' <%if rs("trade")=23 then%>selected<%end if%>>���䡢���������</option>");
		write("<option value='24' <%if rs("trade")=24 then%>selected<%end if%>>����ҵ�����������֡��Ƶ�</option>");
		write("<option value='25' <%if rs("trade")=25 then%>selected<%end if%>>�칫�豸���Ļ�����������Ʒ���Ҿ���Ʒ</option>");
		write("<option value='26' <%if rs("trade")=26 then%>selected<%end if%>>ӡˢ����װ����ֽ</option>");
		write("<option value='27' <%if rs("trade")=27 then%>selected<%end if%>>���������졢�ӹ�</option>");
		write("<option value='28' <%if rs("trade")=28 then%>selected<%end if%>>��������ѵ������Ժ��</option>");
		write("<option value='29' <%if rs("trade")=29 then%>selected<%end if%>>ҽ�ơ���������������</option>");
		write("<option value='30' <%if rs("trade")=30 then%>selected<%end if%>>�˲Ž������н�</option>");
		write("<option value='31' <%if rs("trade")=31 then%>selected<%end if%>>Э�ᡢ���š�����������ҵ����������</option>");
		write("<option value='32' <%if rs("trade")=32 then%>selected<%end if%>>ũ���֡�����������ҵ</option>");
		write("<option value='33' <%if rs("trade")=33 then%>selected<%end if%>>����</option>");					//����
		write("<option value='34' <%if rs("trade")=34 then%>selected<%end if%>>����</option>");
	}	
}
function writeNature()
{
	with(document)
	{
		write("<option value='1' <%if rs("properity")=1 then%>selected<%end if%>>������ҵ</option>");
		write("<option value='2' <%if rs("properity")=2 then%>selected<%end if%>>������ҵ</option>");
		write("<option value='3' <%if rs("properity")=3 then%>selected<%end if%>>������ҵ</option>");
		write("<option value='4' <%if rs("properity")=4 then%>selected<%end if%>>˽Ӫ��ҵ</option>");
		write("<option value='5' <%if rs("properity")=5 then%>selected<%end if%>>��Ӫ��ҵ</option>");
		write("<option value='6' <%if rs("properity")=6 then%>selected<%end if%>>�ɷ�����ҵ</option>");
		write("<option value='7' <%if rs("properity")=7 then%>selected<%end if%>>������ҵ</option>");
		write("<option value='8' <%if rs("properity")=8 then%>selected<%end if%>>������ҵ</option>");
		write("<option value='9' <%if rs("properity")=9 then%>selected<%end if%>>������ҵ</option>");
		write("<option value='10' <%if rs("properity")=10 then%>selected<%end if%>>��������</option>");
		write("<option value='11' <%if rs("properity")=11 then%>selected<%end if%>>�������</option>");
		write("<option value='12' <%if rs("properity")=12 then%>selected<%end if%>>��ҵ��λ</option>");
		write("<option value='13' <%if rs("properity")=13 then%>selected<%end if%>>�����˾(����)</option>");
		write("<option value='14' <%if rs("properity")=14 then%>selected<%end if%>>����</option>");
	}	
}
g_citys=new Array(36);
g_citys[1] =  new Array("������","����");
g_citys[2] =  new Array("�����","����");
g_citys[3] =  new Array("�Ϻ���","����");
g_citys[4] =  new Array("������","����");
g_citys[5] =  new Array("������","������","������","������","����","������","������","������","������","������","��ˮ��","̨����","��ɽ��","����");
g_citys[6] =  new Array("������","������","��ݸ��","��ɽ��","��ɽ��","�麣��","������","��ͷ��","տ����","������","ï����","������","÷����","����");
g_citys[7] =  new Array("�Ͼ���","������","������","������","������","����","���Ƹ���","������","̩����","������","�γ���","����");
g_citys[8] =  new Array("������","������","Ȫ����","������","������","��ƽ��","������","������","������","����");
g_citys[9] =  new Array("��ɳ��","��̶��","������","������","�żҽ���","������","������","������","������","¦����","������","������","������","������","����");
g_citys[10] = new Array("�人��","�˲���","������","��ʯ��","������","�Ƹ���","����");
g_citys[11] = new Array("������","�ൺ��","��̨��","�Ͳ���","Ϋ����","������","������","������","����");
g_citys[12] = new Array("������","��˳��","������","��Ϫ��","Ӫ����","������","��ɽ��","������","������","������","����");
g_citys[13] = new Array("������","ͨ����","�Ӽ���","��ƽ��","��̨��","��Դ��","�ػ���","����");
g_citys[14] = new Array("������","������","������","��Ϫ��","������","������","��ɽ��","������","��ɽ��","����");
g_citys[15] = new Array("�ɶ���","�˱���","������","�ڽ���","��֦����","������","������","������","�ϳ���","������","������","�Թ���","����");
g_citys[16] = new Array("�Ϸ���","�ߺ���","��ɽ��","������","ͭ����","������","������","������","������","��ɽ��","������","������","������","������","������","������","����");
g_citys[17] = new Array("�ϲ���","��������","�Ž���","ӥ̶��","�˴���","������","Ƽ����","������","������","����ɽ��","������","������","����");
g_citys[18] = new Array("��������","��ľ˹��","ĵ������","������","���������","�ض���","˫Ѽɽ��","������","����");
g_citys[19] = new Array("ʯ��ׯ��","������","������","�żҿ���","�ػʵ���","������","��̨��","��ɽ��","�ȷ���","��ˮ��","ɳ����","������","�е���","����");
g_citys[20] = new Array("������","������","������","ͭ����","�Ӱ���","����");
g_citys[21] = new Array("������","������","����","ͨʲ��","����");
g_citys[22] = new Array("֣����","������","������","�ױ���","������","�����","פ�����","������","������","ƽ��ɽ��","������","������","����");
g_citys[23] = new Array("̫ԭ��","��ͬ��","������","�ٷ���","��Ȫ��","������","����");
g_citys[24] = new Array("���ͺ���","��ͷ��","����");
g_citys[25] = new Array("������","������","������","������","������","����");
g_citys[26] = new Array("������","������","ͭ����","��ˮ��","����ˮ��","��˳��","����");
g_citys[27] = new Array("������","��ͭϿ��","������","����");
g_citys[28] = new Array("������","���ľ��","�������","����");
g_citys[29] = new Array("��³ľ����","ʯ������","����������","��³����","��ʲ��","����");
g_citys[30] = new Array("������","�տ�����","����");
g_citys[31] = new Array("������","������","������","����");
g_citys[32] = new Array("̨����","̨����","��¡��","̨����","����");
g_citys[33] = new Array("���");
g_citys[34] = new Array("����");
g_citys[35] = new Array("����");
g_citys[36] = new Array("����");

function selectcitys(selPro, Citys) {
	p = parseInt(selPro.value);
	if(p <= 0 || p > 36) return;
	for(i = Citys.length - 1; i >= 0; i--) {
		Citys.options[i] = null;
	}
	for(i = 0; i < g_citys[p].length; i++) {
		Citys.options[Citys.length] = new Option(g_citys[p][i], g_citys[p][i]);
	}
}
</script>

<!--���µ�½ʱ��ĺ���-->
<% Function  gengxin()

conn.execute("update [01387company] set lastlogin='"&now()&"',logintime=logintime+1 where username='"&username&"'")

end Function
%>


<form name="form1" method="post" action="EditCompany.asp">
  <table width="99%" border="0" align="center" cellPadding="3" cellSpacing="1" bordercolor="#111111" bgcolor="#FFFFFF" class="table" style="border-collapse: collapse">
    <tr> 
      <td height="25" colspan="2"  background="image/admin_bg_1.gif"><div align="center"><strong><font color="#FFFFFF">&nbsp; 
          ��ҵ��ϸ��Ϣ ( �ܹ��յ� <font color="#FFFF00"> 
          <%	Call RsName(rs22,"select count(*) from [01387applylist] where cid='"&ChkNo&"' "  ,1,1) %>
          <%=rs22(0)%></font> ������ ) <a href="CompanyJobList.asp?cid=<%=chkNO%>">�鿴ְλ</a></font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">��˾���ƣ� </font></div></td>
      <td height="20" align="middle"><div align="left"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <input name="companyname" type="text" class="input" id="companyname" size="28" value="<%=rs("companyname")%>">
          <strong><font face="Geneva, Arial, Helvetica, sans-serif">&nbsp;&nbsp;</font></strong><font color="#333333" face="Geneva, Arial, Helvetica, sans-serif">&nbsp;����ʱ��</font><font color="#333333" face="Geneva, Arial, Helvetica, sans-serif"></font><strong><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <input name="lastlogin" type="text" class="input" id="lastlogin" size="10" value="<%=rs("lastlogin")%>">
          </font><font color="#FFFFFF">&nbsp;&nbsp;</font></strong> </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5">
      <td height="26"> <div align="right"><font color="#003399">������վ/Ӫҵִ�գ�</font></div></td>
      <td height="20" align="middle"><div align="left">
          <input name="licence" type="text" class="input" id="licence" value="<%=rs("licence")%>" size="28" maxlength="80">
        <a href="<%=rs("licence")%>" target="_blank">�����Ե���վ����</a>
		</div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="23%" height="26"> <div align="right"><font color="#003399">������ҵ��</font></div></td>
      <td width="77%" height="20" align="middle"><div align="left"> <font face="Geneva, Arial, Helvetica, sans-serif"> 
          <select name="trade" size="1" class="input" id="trade" style="width: 240px; font-size: 12px; font-family: ����">
            <script language="JavaScript">writeTrade()</script>
          </select>
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">��˾���ʣ�</font></div></td>
      <td width="77%" height="20" align="middle"> <div align="left"> <font face="Geneva, Arial, Helvetica, sans-serif"> 
          <select name="properity" class="input" id="properity">
            <script language="JavaScript">writeNature()</script>
          </select>
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">�������ڣ� </font></div></td>
      <td width="77%" height="20" align="middle"><div align="left"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <input name="u_year" type="text" class="input" id="u_year" value="<%=rs("u_year")%>" size="5">
          �� 
          <select name="u_month" class="input">
            <option value="" >ѡ��</option>
            <option value="1" <%if rs("u_month")=1 then%>selected<%end if%>>01</option>
            <option value="2" <%if rs("u_month")=2 then%>selected<%end if%> >02</option>
            <option value="3" <%if rs("u_month")=3 then%>selected<%end if%> >03</option>
            <option value="4" <%if rs("u_month")=4 then%>selected<%end if%> >04</option>
            <option value="5" <%if rs("u_month")=5 then%>selected<%end if%> >05</option>
            <option value="6" <%if rs("u_month")=6 then%>selected<%end if%> >06</option>
            <option value="7" <%if rs("u_month")=7 then%>selected<%end if%> >07</option>
            <option value="8" <%if rs("u_month")=8 then%>selected<%end if%> >08</option>
            <option value="9" <%if rs("u_month")=9 then%>selected<%end if%> >09</option>
            <option value="10" <%if rs("u_month")=10 then%>selected<%end if%> >10</option>
            <option value="11" <%if rs("u_month")=11 then%>selected<%end if%> >11</option>
            <option value="12" <%if rs("u_month")=12 then%>selected<%end if%> >12</option>
          </select>
          �� 
          <select name="u_day" class="input">
            <option value="" >ѡ��</option>
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
          ��<font color="#FF0000"></font> </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">ע���ʽ� </font></div></td>
      <td height="20" align="middle"> <div align="left"> 
          <input name="fund" type="text" class="input" id="fund" value="<%=rs("fund")%>" size="10">
          ��Ԫ</div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">Ա�������� </font></div></td>
      <td height="20"> <div align="left"> 
          <input type="radio" value="����50��" name="employee" <%if rs("employee")="����50��" then%>checked<%end if%>>
          ����<b>50</b>�� 
          <input type="radio" value="50-200��" name="employee" <%if rs("employee")="50-200��" then%>checked<%end if%>>
          <b>50-200</b>�� 
          <input type="radio" value="200-500��" name="employee" <%if rs("employee")="200-500��" then%>checked<%end if%>>
          <b>200-500</b>�� 
          <input type="radio" value="500-1000��" name="employee" <%if rs("employee")="500-1000��" then%>checked<%end if%>>
          <b>500-1000</b>�� 
          <input type="radio" value="1000������" name="employee" <%if rs("employee")="1000������" then%>checked<%end if%>>
          <b>1000</b>������ <font color="#FF0000">*</font><font color="#624B35"></font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap><div align="right"><font color="#003399">���˴���</font></div></td>
      <td height="20" align="middle"><div align="left"> 
          <input name="legal" type="text" class="input" id="legal" value="<%=rs("legal")%>" size="28" maxlength="80">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">��˾��飺 </font></div></td>
      <td height="20" align="middle" style="word-break:break-all"><div align="left"> 
          <textarea name="intro" cols="80" rows="8" class="input" id="intro"><%=replace(replace(rs("intro"),"&nbsp;",chr(32)),"<br>",chr(13))%></textarea>
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">�� ϵ �ˣ� </font></div></td>
      <td height="18" align="middle"> <div align="left"> 
          <input name="contact" type="text" class="input" id="contact" value="<%=rs("contact")%>" size="28" maxlength="50">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">��ϵ�绰�� </font></div></td>
      <td height="22" align="middle"> <div align="left"> 
          <input name="tel" type="text" class="input" id="tel" value="<%=rs("tel")%>" size="28" maxlength="50">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="right"><font color="#003399">�� �� �棺 </font></div></td>
      <td height="22" align="middle"> <div align="left"> 
          <input name="fax" type="text" class="input" id="fax" value="<%=rs("fax")%>" size="28" maxlength="50">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">�� �� ����</font></div></td>
      <td height="22" align="middle"> <div align="left"> 
          <input name="mobile" type="text" class="input" id="mobile" value="<%=rs("mobile")%>" size="28" maxlength="50">
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="25"> <div align="right"><font color="#003399">�����ʼ��� </font></div></td>
      <td align="middle" valign="top">
	  <div align="left"> <input name="email" type="text" class="input" id="email" value="<%=rs("email")%>" size="28" maxlength="50">
        <font face="Geneva, Arial, Helvetica, sans-serif"><a href="mailto:<%=rs("email")%>"><%=rs("email")%></a></font> </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"> <div align="right"><font color="#003399">��˾��ҳ�� </font></div></td>
      <td height="1" align="middle"> <div align="left"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <input name="website" type="text" class="input" id="website" value="<%=rs("website")%>" size="28" maxlength="50">
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">ͨѶ��ַ�� </font></div></td>
      <td height="19" align="middle"> <div align="left"> <font face="Geneva, Arial, Helvetica, sans-serif"> 
          </font><font color="#000000"> 
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
          ( ʡ����)<font color="#FF0000"> 
          <SELECT name="citys" class="input" id="citys">
            <option value="<%=rs("citys")%>"><%=rs("citys")%></option>
          </SELECT>
          </font>(�С���) 
          <input name="address" type="text" class="input" value="<%=rs("address")%>" size="20" maxlength="50"/>
          </font></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" nowrap> <div align="right"><font color="#003399">�� �� �ࣺ 
          </font></div></td>
      <td height="10" align="middle"> <div align="left"> 
          <input name="zipcode" type="text" class="input" id="zipcode" value="<%=rs("zipcode")%>" size="8" maxlength="6"/>
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="40" colspan="2"> <div align="center"> 
          <input type="button" name="Button" value="������һҳ" onClick="javascript:history.go(-1)" style="width=100;height=30;font-size=12px">
          <input name="cid" type="hidden" id="cid" value="<%=request("chkNO")%>">
          <input name="page" type="hidden" id="page" value="<%=request("page")%>">
		  <%if Cint(request.cookies("01387job")("userpower"))>1 then%>
          <input type="submit" name="Button22" value="�༭��ҵ����" style="height=30;font-size=12px">
          <input type="button" name="Button2" value="����ҵ������Ƹְλ" onClick="window.location.href='CompanyJobList.asp?cid=<%=chkNO%>'" style="width=150;height=30;font-size=12px">
          <%end if%>
		</div></td>
    </tr>
  </table>
</form>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call closers()
call CloseConn()
%>
</body>
</html>