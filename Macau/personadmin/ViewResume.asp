<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim uid
uid=request.cookies("01387job")("uid")
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387member] where uid='"&uid&"'" ,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��--�����͹�/��������/�͹���Ƹ</title>

<link href="../css/Resume.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.table {
	border-top-width: 0px;
	border-right-width: 1px;
	border-bottom-width: 0px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #FFB877;
	border-right-color: #FFB877;
	border-bottom-color: #FFB877;
	border-left-color: #FFB877;
}
.table1 {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 0px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #FFB877;
	border-right-color: #FFB877;
	border-bottom-color: #FFB877;
	border-left-color: #FFB877;
}
.table2 {
	border-top-width: 0px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #FFB877;
	border-right-color: #FFB877;
	border-bottom-color: #FFB877;
	border-left-color: #FFB877;
}
-->
</style>
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="5" marginwidth="0" marginheight="0">
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="258" height="80"><img src="../images/logo.jpg" width="216" height="70"></td>
    <td width="342"><br>
      <br>
      <br>
      ���˼���<font color="#FF3300" face="Geneva, Arial, Helvetica, sans-serif">NO.<%=rs1("uid")%></font></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>���˻�������</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="445" valign="middle"> <table width="440"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr bgcolor="FFFCF7"> 
          <td width="102" height="26" bgcolor="FFFCF7"> <div align="right"><font color="#696969">��&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td>
          <td width="140" bgcolor="FFFCF7" id="resume"><%=rs1("uname")%></td>
          <td width="98"><div align="right"><font color="#696969">��&nbsp;��</font></div></td>
          <td width="100" id="resume"> 
            <%
				select case rs1("sex")
				case true
				response.write("��")
				case false
				response.write("Ů")
				end select
				%>
          </td>
        </tr>
        <tr> 
          <td height="26"> <div align="right"><font color="#696969">�������ڣ�</font></div></td>
          <td><%=rs1("updatetime")%></td>
          <td><div align="right"><font color="#696969">��&nbsp;�壺</font></div></td>
          <td id="resume"><%=rs1("nation")%></td>
        </tr>
        <tr bgcolor="FFFCF7"> 
          <td height="26"> <div align="right"><font color="#696969">��&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td>
          <td id="resume"> 
            <%
		  select case rs1("province")
		  case 1
		  response.write("����")
		  case 2
		  response.write("���")
		  case 3
		  response.write("�Ϻ�")
		  case 4
		  response.write("����")
		  case 5
		  response.write("�㽭")
		  case 6
		  response.write("�㶫")
		  case 7
		  response.write("����")
		  case 8
		  response.write("����")
		  case 9
		  response.write("����")
		  case 10
		  response.write("����")
		  case 11
		  response.write("ɽ��")
		  case 12
		  response.write("����")
		  case 13
		  response.write("����")
		  case 14
		  response.write("����")
		  case 15
		  response.write("�Ĵ�")
		  case 16
		  response.write("����")
		  case 17
		  response.write("����")
		  case 18
		  response.write("������")
		  case 19
		  response.write("�ӱ�")
		  case 20
		  response.write("����")
		  case 21
		  response.write("����")
		  case 22
		  response.write("����")
		  case 23
		  response.write("ɽ��")
		  case 24
		  response.write("���ɹ�")
		  case 25
		  response.write("����")
		  case 26
		  response.write("����")
		  case 27
		  response.write("����")
		  case 28
		  response.write("�ຣ")
		  case 29
		  response.write("�½�")
		  case 30
		  response.write("����")
		  case 31
		  response.write("����")
		  case 32
		  response.write("̨��")
		  case 33
		  response.write("���")
		  case 34
		  response.write("����")
		  case 35
		  response.write("����")
		  case 36
		  response.write("����")
		  end select
		  %>
            <%=rs1("citys")%></td>
          <td><div align="right"><font color="#696969">��&nbsp;�䣺</font></div></td>
          <td><%=datediff("yyyy",rs1("birthday"),date())%></td>
        </tr>
        <tr> 
          <td height="26"> <div align="right"><font color="#696969">����״����</font></div></td>
          <td id="resume">
		  <%select case rs1("marry")
		  case 1
		  response.Write("δ��")
		  case 2
		  response.Write("�ѻ�")
		  case 3
		  response.Write("����")
		  case 4
		  response.Write("����")
		  end select%></td>
          <td><div align="right"><font color="#696969">��&nbsp;�ߣ�</font></div></td>
          <td><%=rs1("height")%>cm</td>
        </tr>
        <tr> 
          <td height="26" bgcolor="FFFCF7"> <div align="right"><font color="#696969">�����ڵأ�</font></div></td>
          <td colspan="3" bgcolor="FFFCF7" id="resume"><%=rs1("address")%></td>
        </tr>
        <tr> 
          <td height="26"> <div align="right"><font color="#696969">ע�����ڣ�</font></div></td>
          <td id="resume"><%=rs1("regtime")%></td>
          <td><div align="right"><font color="#696969">��¼������</font></div></td>
          <td><%=rs1("logintime")%></td>
        </tr>
      </table></td>
    <td width="160" align="center" valign="middle"><table width="142" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="center"> 
            <%if rs1("pic")<>"" then%>
            <%if rs1("pichide")="ok" then%>
            <img src='../person/image/nopic.gif' width="121" height="166" border='0' style='border:1px solid #000000'> 
            <%else%>
            <a href="../person/upload/<%=rs1("pic")%>" target="_blank"><img src='../person/upload/<%=rs1("pic")%>' width="121" height="160" border='0' style='border:1px solid #FFB877'> 
            <%end if%>
            </a> 
            <%else%>
            <img src='../person/image/nopic.gif' width="121" height="166" border='0' style='border:1px solid #000000'> 
            <%end if%>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>���˽�������</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">��ҵԺУ��</font></div></td>
    <td height="26"><%=rs1("college")%></td>
    <td height="26"><div align="right"><font color="#696969">ѧ����</font></div></td>
    <td height="26"> 
      <%
		              select case rs1("degree")
					  case 0
					  response.Write("��������")
					  case 1
					  response.Write("����")
					  case 2
					  response.Write("ְ��")
					  case 3
					  response.Write("��ר")
					  case 4
					  response.Write("��ר")
					  case 5
					  response.Write("����")
					  case 6
					  response.Write("˶ʿ")
					  case 7
					  response.Write("��ʿ")
					  end select%>
    </td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">����רҵ��</font></div></td>
    <td><%=rs1("spec1")%></td>
    <td><div align="right"><font color="#696969">�ڶ�רҵ��</font></div></td>
    <td><%=rs1("spec2")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="#696969">�����ˮƽ��</font></div></td>
    <td><%=rs1("com_level")%></td>
    <td><div align="right"><font color="#696969">������ò��</font></div></td>
    <td><%=rs1("zzmm")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">��һ���</font></div></td>
    <td width="211"><%=rs1("l_type1")%></td>
    <td width="86"><div align="right"><font color="#696969">�㶫��ˮƽ��</font></div></td>
    <td width="199"><%=rs1("l_level1")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">�ڶ����</font></div></td>
    <td><%=rs1("l_type2")%></td>
    <td><div align="right"><font color="#696969">Ӣ��ˮƽ��</font></div></td>
    <td><%=rs1("l_level2")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">����֤�飺</font></div></td>
    <td colspan="3"><%=rs1("certificate")%></td>
  </tr>
  <tr bgcolor="#FFF7EE"> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="#696969">��ѵ�����������</font></div></td>
    <td colspan="3" bgcolor="FFFCF7"><%=rs1("edu_career")%></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>������ְ����</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="FFFCF7"> 
    <td width="104" height="26"><div align="right"><font color="#696969">ӦƸ����ҵ(һ)��</font></div></td>
    <td width="212"> 
      <%
							select case rs1("maincatelog")
							case 1
							response.Write("��ʳ/����/����")
							case 2
							response.Write("�̵�/����/�̳�")
							case 3
							response.Write("����/�Ƶ�/����/����")
							case 4
							response.Write("����ҵ/�ɻ���/����")
							case 5
							response.Write("��Ѷ�Ƽ�/����/ͨѶ")
							case 6
							response.Write("���/ý��/����/���")
							case 7
							response.Write("ˮ/��/��/�յ�/����")
							case 8
							response.Write("����ά��/��������")
							case 9
							response.Write("����/װ��/�ӹ�")
							case 10
							response.Write("��ķ/����/����")
							case 11
							response.Write("��/����/��Ħ")
							case 12
							response.Write("����/ģ��/����ҵ")
							case 13
							response.Write("��չ/����/�ƹ�")
							case 14
							response.Write("����/����ҵ")
							case 15
							response.Write("԰��/��԰ά��")
							case 16
							response.Write("������/ó��")
							case 17
							response.Write("����/����/����")
							case 18
							response.Write("����/����/����")
							case 19
							response.Write("����/��ѵ")
							case 20
							response.Write("����/����/ҽ��")
							case 21
							response.Write("��ѯ/�н�/����")
							case 22
							response.Write("�ۺ���ְ/����")
							case 23
							response.Write("�߼�/�ۺϹ���")
							case 24
							response.Write("������������")
							end select
							%>
    </td>
    <td width="85"><div align="right"><font color="#696969">����ְλ(һ)��</font></div></td>
    <td width="199"><%=rs1("subcatelog")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">ӦƸ����ҵ(��)��</font></div></td>
    <td> 
      <%
							select case rs1("maincatelog2")
							case 1
							response.Write("��ʳ/����/����")
							case 2
							response.Write("�̵�/����/�̳�")
							case 3
							response.Write("����/�Ƶ�/����/����")
							case 4
							response.Write("����ҵ/�ɻ���/����")
							case 5
							response.Write("��Ѷ�Ƽ�/����/ͨѶ")
							case 6
							response.Write("���/ý��/����/���")
							case 7
							response.Write("ˮ/��/��/�յ�/����")
							case 8
							response.Write("����ά��/��������")
							case 9
							response.Write("����/װ��/�ӹ�")
							case 10
							response.Write("��ķ/����/����")
							case 11
							response.Write("��/����/��Ħ")
							case 12
							response.Write("����/ģ��/����ҵ")
							case 13
							response.Write("��չ/����/�ƹ�")
							case 14
							response.Write("����/����ҵ")
							case 15
							response.Write("԰��/��԰ά��")
							case 16
							response.Write("������/ó��")
							case 17
							response.Write("����/����/����")
							case 18
							response.Write("����/����/����")
							case 19
							response.Write("����/��ѵ")
							case 20
							response.Write("����/����/ҽ��")
							case 21
							response.Write("��ѯ/�н�/����")
							case 22
							response.Write("�ۺ���ְ/����")
							case 23
							response.Write("�߼�/�ۺϹ���")
							case 24
							response.Write("������������")
							end select
							%>
    </td>
    <td><div align="right"><font color="#696969">����ְλ(��)��</font></div></td>
    <td><%=rs1("subcatelog2")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">���ʺϵ�ְλ��</font></div></td>
    <td><%=rs1("jobname")%></td>
    <td><div align="right"><font color="#696969">ȫְ/��ְ��</font></div></td>
    <td> 
      <%
		  select case rs1("jobtype")
		  case 1
		  response.Write("ȫְ")
		  case 2
		  response.Write("��ְ")
		  case 3
		  response.Write("������")
		  end select
		  %>
    </td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">нˮҪ��</font></div></td>
    <td>
	<%select case rs1("salary")
	  case 0
	  response.Write("����")
	  case 1
	  response.Write("3000����")
	  case 2
	  response.Write("3000-4000")
	  case 3
	  response.Write("4000-5000")
	  case 4
	  response.Write("5000-7000")
	  case 5
	  response.Write("7000����")
	  end select%>(Ԫ/��)</td>
    <td><div align="right"><font color="#696969">ס��Ҫ��</font></div></td>
    <td><%=rs1("workhouse")%></td>
  </tr>
  <tr> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="#696969">����ʱ�䣺</font></div></td>
    <td colspan="3" bgcolor="FFFCF7"> 
      <%
		   select case rs1("checkindate")
		   case 1
		   response.write("��ʱ����")
		   case 2
		   response.write("������")
		   case 3
		   response.write("һ����")
		   case 4
		   response.write("һ������")
		   case 5
		   response.write("��������")
		   case 6
		   response.write("����Э��")
		   end select
		  %>
      &nbsp;&nbsp;(���������ǣ�<font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs1("updatetime")%></strong></font>)</td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>���˹�������</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="FFFCF7"> 
    <td width="104" height="26"> <div align="right"><font color="#696969">�������飺</font></div></td>
    <td><%=rs1("doneyear")%></td>
  </tr>
  <tr> 
    <td height="26"> <div align="right"><font color="#696969">����������</font></div></td>
    <td><%=rs1("job_career")%></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>��������</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="FFFCF7"> 
    <td width="104" height="26"> <div align="right"><font color="#696969">�����������ݣ�</font></div></td>
    <td><%=rs1("selfintro")%></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="30"><img src="../img/bar_left.gif" width="30" height="28"></td>
    <td background="../img/bar_bg.gif"><strong>��ϵ��ʽ</strong></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table2">
  <tr bgcolor="FFFCF7"> 
    <td width="104" height="26"><div align="right"><font color="#696969">�绰��</font></div></td>
    <td width="212"><%=rs1("tel")%></td>
    <td width="85"><div align="right"><font color="#696969">�ֻ���</font></div></td>
    <td width="199"><%=rs1("mobile")%></td>
  </tr>
  <tr> 
    <td height="26"><div align="right"><font color="#696969">������룺</font></div></td>
    <td><%=rs1("chatno")%></td>
    <td><div align="right"><font color="#696969">������ҳ��</font></div></td>
    <td><a href="<%=rs1("selfweb")%>" target=_blank><%=rs1("selfweb")%></a></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">�ʱࣺ</font></div></td>
    <td><%=rs1("zipcode")%></td>
    <td><div align="right"><font color="#696969">E-mail��</font></div></td>
    <td><a href="mailto:<%=rs1("email")%>"><%=rs1("email")%></a></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="36" colSpan="2" align="center">������Ϣ�ɰ����͹���Ƹ��(www.macau69.com)�ṩ</td>
    <td width="180" height="36" align="center"><a href="#" onClick="javascript:window.close()"><font color="#000000">�رձ�ҳ</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      <a href="#" onClick="javascript:window.print()"><font color="#FF3300">��ӡ��ҳ</font></a></td>
  </tr>
</table>
</body>
</html>
<%
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
