<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim chkNO
chkNO=request("chkNO")
if chkNO="" then
Call ShowError("��ѡ����˻�Ա��")
end if
Call RsName(rs,"select * from [01387member] where uid='"&chkNO&"'" ,1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
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
	font-size: 12px;
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
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr> 
    <td width="2%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="98%" background="../img/bar_bg.gif"><strong>���˻������� | <font face="Geneva, Arial, Helvetica, sans-serif">NO: 
      <%=rs("id")%></font></strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr bgcolor="#ffffff"> 
    <td width="74%" valign="middle"> <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="12">
        <tr bgcolor="FFFCF7"> 
          <td width="17%" height="26" bgcolor="FFFCF7"> <div align="right"><font color="696969">��&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td>
          <td width="35%" bgcolor="FFFCF7" id="resume"><%=rs("uname")%></td>
          <td width="15%"><div align="right"><font color="696969">��&nbsp;��</font></div></td>
          <td width="33%" id="resume"> <%
				select case rs("sex")
				case true
				response.write("��")
				case false
				response.write("Ů")
				end select
				%> </td>
        </tr>
        <tr bgcolor="#ffffff"> 
          <td height="26"> <div align="right"><font color="696969">�������ڣ�</font></div></td>
          <td><%=rs("updatetime")%></td>
          <td><div align="right"><font color="696969">��&nbsp;�壺</font></div></td>
          <td id="resume"><%=rs("nation")%></td>
        </tr>
        <tr bgcolor="FFFCF7"> 
          <td height="26"> <div align="right"><font color="696969">��&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td>
          <td id="resume"> <%
		  select case rs("province")
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
		  %> <%=rs("citys")%></td>
          <td><div align="right"><font color="696969">��&nbsp;�䣺</font></div></td>
          <td><%=datediff("yyyy",rs("birthday"),date())%></td>
        </tr>
        <tr bgcolor="#ffffff"> 
          <td height="26"> <div align="right"><font color="696969">����״����</font></div></td>
          <td id="resume"><%=rs("marry")%></td>
          <td><div align="right"><font color="696969">��&nbsp;�ߣ�</font></div></td>
          <td><%=rs("height")%>cm</td>
        </tr>
        <tr> 
          <td height="26" bgcolor="FFFCF7"> <div align="right"><font color="696969">�����ڵأ�</font></div></td>
          <td colspan="3" bgcolor="FFFCF7" id="resume"><%=rs("address")%></td>
        </tr>
        <tr bgcolor="#ffffff"> 
          <td height="26"> <div align="right"><font color="696969">ע�����ڣ�</font></div></td>
          <td id="resume"><%=rs("regtime")%></td>
          <td><div align="right"><font color="696969">��¼������</font></div></td>
          <td><%=rs("logintime")%></td>
        </tr>
      </table></td>
    <td width="26%" align="center" valign="middle"><table width="142" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="center"> 
            <%if rs("pic")<>"" then%>
            <%if rs("pichide")="ok" then%>
            <img src='../person/image/nopic.gif' width="121" height="166" border='0' style='border:1px solid #000000'> 
            <%else%>
            <a href="../personadmin/upload/<%=rs("pic")%>" target="_blank"><img src='../personadmin/upload/<%=rs("pic")%>' width="121" height="160" border='0' style='border:1px solid #000000'> 
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
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="2%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="98%" background="../img/bar_bg.gif"><strong>���˽�������</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr bgcolor="FFFCF7"> 
    <td width="17%" height="26"><div align="right"><font color="696969">��ҵԺУ��</font></div></td>
    <td height="26"><%=rs("college")%></td>
    <td height="26"><div align="right"><font color="696969">ѧ����</font></div></td>
    <td height="26"> <%
		              select case rs("degree")
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
					  end select%> </td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="696969">����רҵ��</font></div></td>
    <td bgcolor="#ffffff"><%=rs("spec1")%></td>
    <td><div align="right"><font color="696969">�ڶ�רҵ��</font></div></td>
    <td><%=rs("spec2")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="696969">�����ˮƽ��</font></div></td>
    <td><%=rs("com_level")%></td>
    <td><div align="right"><font color="696969">������ò��</font></div></td>
    <td><%=rs("zzmm")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="696969">��һ���</font></div></td>
    <td width="35%"><%=rs("l_type1")%></td>
    <td width="14%"><div align="right"><font color="696969">�㶫��ˮƽ��</font></div></td>
    <td width="34%"><%=rs("l_level1")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="696969">�ڶ����</font></div></td>
    <td><%=rs("l_type2")%></td>
    <td><div align="right"><font color="696969">Ӣ��ˮƽ��</font></div></td>
    <td><%=rs("l_level2")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="696969">����֤�飺</font></div></td>
    <td colspan="3"><%=rs("certificate")%></td>
  </tr>
  <tr bgcolor="#FFF7EE"> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="696969">��ѵ�����������</font></div></td>
    <td colspan="3" bgcolor="FFFCF7"><%=rs("edu_career")%></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="3%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="97%" background="../img/bar_bg.gif"><strong>������ְ����</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr bgcolor="FFFCF7"> 
    <td width="17%" height="26"><div align="right"><font color="#696969">ӦƸ����ҵ(һ)��</font></div></td>
    <td width="34%"> <%
							select case rs("maincatelog")
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
							%> </td>
    <td width="14%"><div align="right"><font color="#696969">����ְλ(һ)��</font></div></td>
    <td width="35%"><%=rs("subcatelog")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="#696969">ӦƸ����ҵ(��)��</font></div></td>
    <td> <%
							select case rs("maincatelog2")
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
							%> </td>
    <td><div align="right"><font color="#696969">����ְλ(��)��</font></div></td>
    <td><%=rs("subcatelog2")%></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">ְλ���ƣ�</font></div></td>
    <td><%=rs("jobname")%></td>
    <td><div align="right"><font color="#696969">ȫְ/��ְ��</font></div></td>
    <td>
	      <%
		  select case rs("jobtype")
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
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="#696969">нˮҪ��</font></div></td>
    <td><%select case rs("salary")
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
    <td><%=rs("workhouse")%></td>
  </tr>
  <tr> 
    <td height="26" bgcolor="FFFCF7"><div align="right"><font color="#696969">����ʱ�䣺</font></div></td>
    <td colspan="3" bgcolor="FFFCF7"> <%
		   select case rs("checkindate")
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
		  %> &nbsp;&nbsp;(���������ǣ�<font face="Geneva, Arial, Helvetica, sans-serif"><strong><%=rs("updatetime")%></strong></font>)</td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="3%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="97%" background="../img/bar_bg.gif"><strong>���˹�������</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr bgcolor="FFFCF7"> 
    <td width="17%" height="26"> <div align="right"><font color="#696969">�������飺</font></div></td>
    <td width="83%"><%=rs("doneyear")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"> <div align="right"><font color="#696969">����������</font></div></td>
    <td><%=rs("job_career")%></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="1%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="99%" background="../img/bar_bg.gif"><strong>��������</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
  <tr bgcolor="FFFCF7"> 
    <td width="131" height="26"> <div align="right"><font color="#003399">�����������ݣ�</font></div></td>
    <td width="644"><%=rs("selfintro")%></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr> 
    <td width="2%"><img src="../images/bar_left.gif" width="30" height="28"></td>
    <td width="98%" background="../img/bar_bg.gif"><strong>��ϵ��ʽ</strong></td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="table2">
  <tr bgcolor="FFFCF7"> 
    <td width="17%" height="26"><div align="right"><font color="#696969">�绰��</font></div></td>
    <td width="35%"><%=rs("tel")%></td>
    <td width="14%"><div align="right"><font color="#696969">�ֻ���</font></div></td>
    <td width="34%"><%=rs("mobile")%></td>
  </tr>
  <tr bgcolor="#ffffff"> 
    <td height="26"><div align="right"><font color="#696969">������룺</font></div></td>
    <td><%=rs("chatno")%></td>
    <td><div align="right"><font color="#696969">������ҳ��</font></div></td>
    <td><a href="<%=rs("selfweb")%>" target=_blank><%=rs("selfweb")%></a></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="26"><div align="right"><font color="#696969">�ʱࣺ</font></div></td>
    <td><%=rs("zipcode")%></td>
    <td><div align="right"><font color="#696969">���䣺</font> </div></td>
    <td><font color="#696969"><%=rs("email")%></font></td>
  </tr>
  <tr bgcolor="FFFCF7"> 
    <td height="36" colspan="4"><div align="center"> 
        <input TYPE="button" VALUE="   �� �� �� һ ҳ  " NAME="Button" style="width:150;height:30" onClick="javascript:history.go(-1)">
      </div></td>
  </tr>
</table>
<%
call footer()
call closers()
call CloseConn()
%>
</body>
</html>