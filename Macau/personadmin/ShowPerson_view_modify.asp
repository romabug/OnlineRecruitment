<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
sid=request.QueryString("sid")
Call RsName(rs1,"select * from [01387member] where id='"&sid&"'",1,1)
if rs1.recordcount=0 then
Call ShowError("�޴���Ϣ��")
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��----�����͹�/��������/�͹���Ƹ</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css" />
<link href="../css/01387.css" rel="stylesheet" type="text/css">

</head>
<script language="JavaScript" type="text/JavaScript">
<!--

	function call_window(url)
	{
		showModelessDialog(url,window,"dialogWidth:530px;dialogHeight:250px;center:yes;help:no;resizable:no;status:no");
	}
//-->
</script>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="720" height="80" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="210" height="80"><img src="../images/logo.gif" width="188" height="62"></td>
    <td width="490" colspan="2" valign="bottom" style="line-height:160%;"><table width="100%" border="0" align="right">
        <tr bgcolor="#F0F0FB"> 
          <td height="37" colspan="2" align="left"><strong class="showjob"><font color="#000000" > 
            <%if request.cookies("01387job")("companyusername")<>"" and  request.cookies("01387job")("cid")<>"" and request.cookies("01387job")("cidpower")<>"" and session("01387jobcid")<>"" then%>
            <%=rs1("uname")%> 
            <%else%>
            <%=left(trim(rs1("uname")),1)%> 
            <%
				select case rs1("sex")
				case true
				response.write("����")
				case false
				response.write("С��")
				end select%>
            <%end if%>
            �ĸ��˼���</font></strong></td>
        </tr>
        <tr> 
          <td align="right">&nbsp;</td>
          <td width="22%">&nbsp;</td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>

<hr align="center" width="720" size="6">
<table width="720" border="0" align="center">
  <tr> 
    <td width="210"><span style="font-size: 12.0pt; font-family: ����">���<strong><font face="Geneva, Arial, Helvetica, sans-serif">��</font></strong><strong><%=rs1("id")%></strong></span></td>
    <td><div align="right"><font color="#FF0000">����ʾΪ</font><a   title=����ת��  href=""       name=StranLink><font color="#FF0000">���w����</font></a><font color="#FF0000">��</font></div></td>
  </tr>
</table>
<br>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr> 
    <td height="25"><strong>
	<!--  ����ʼ-->
	

<head>
<style>
<!--
table.MsoTableGrid
	{border:1.0pt solid windowtext;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.0pt;
	font-family:"Times New Roman";
	}
 p.MsoNormal
	{mso-style-parent:"";
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Times New Roman";
	margin-left:0cm; margin-right:0cm; margin-top:0cm}
-->
</style>


<table class="MsoTableGrid" border="1" cellspacing="0" cellpadding="0" width="720" style="width: 540.0pt; border-collapse: collapse; border: medium none; " id="table1">
	<tr>
		  <td width="720" colspan="5" valign="top" style="width: 540.0pt; border: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6"> 
            <p class="MsoNormal"><span style="font-size: 12.0pt; font-family: ����"> 
              ���˻������� <strong> </strong> </span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <span lang="EN-US" style="font-size:12.0pt"> 
            <%if request.cookies("01387job")("companyusername")<>"" and  request.cookies("01387job")("cid")<>"" and request.cookies("01387job")("cidpower")<>"" and session("01387jobcid")<>"" then%>
            <%=rs1("uname")%> 
            <%else%>
            <%=left(trim(rs1("uname")),1)%> 
            <%
				select case rs1("sex")
				case true
				response.write("����")
				case false
				response.write("С��")
				end select%>
            <%end if%>
            </span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">�Ա�</span></td>
		  <td width="144" valign="top" style="width: 108.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;
              <%
				select case rs1("sex")
				case true
				response.write("��")
				case false
				response.write("Ů")
				end select
				%>
              </span></td>
		  <td width="120" rowspan="5" align="center" valign="middle" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
         
            <table width="142" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="center"> 
                  <%if rs1("pic")<>"" then%>
                  <%if rs1("pichide")="ok" then%>
                  <img src='../images/nophoto.jpg' border='0' > 
                  <%else%>
                  <a href="../personadmin/upload/<%=rs1("pic")%>" target="_blank"> 
                  </a><a href="../personadmin/upload/<%=rs1("pic")%>" target="_blank"><img src='../personadmin/upload/<%=rs1("pic")%>' width="84" height="112" border='0' style='border:1px solid #000000'></a><a href="../personadmin/upload/<%=rs1("pic")%>" target="_blank"> 
                  <%end if%>
                  </a> 
                  <%else%>
                  <img src='../images/nophoto.jpg' border='0' > 
                  <%end if%>
                </td>
              </tr>
            </table></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("nation")%></span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����</span></td>
		  <td width="144" valign="top" style="width: 108.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;
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
              <%=rs1("citys")%></span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=datediff("yyyy",rs1("birthday"),date())%></span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����</span></td>
		  <td width="144" valign="top" style="width: 108.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("height")%> ����</span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align: center">
		<span style="font-size: 12.0pt; font-family: ����">����</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;
              <%select case rs1("marry")
		  case 1
		  response.Write("δ��")
		  case 2
		  response.Write("�ѻ�")
		  case 3
		  response.Write("����")
		  case 4
		  response.Write("����")
		  end select%>
              </span></td>
		<td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">�����ڵ�ַ</span></td>
		  <td width="492" colspan="3" valign="top" style="width: 369.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("address")%><br>
              <br>
              ��</span></td>
	</tr>
	<tr>
		<td width="720" colspan="5" valign="top" style="width: 540.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6">
		<p class="MsoNormal"><span style="font-size: 12.0pt; font-family: ����">
		��ְ����</span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">ӦƸ��ҵ</span><span style="font-size:
  12.0pt;font-family:����">��</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;
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
							response.Write("����/����/��Ħ")
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
              </span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����ְλ</span><span style="font-size:
  12.0pt;font-family:����">��</span></td>
		  <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("subcatelog")%></span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">ӦƸ��ҵ</span><span style="font-size:
  12.0pt;font-family:����">��</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;
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
							response.Write("����/����/��Ħ")
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
              </span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����ְλ</span><span style="font-size:
  12.0pt;font-family:����">��</span></td>
		  <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("subcatelog2")%></span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">���ʺ�ְλ</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("jobname")%></span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">ȫְ</span><span lang="EN-US" style="font-size:12.0pt">/</span><span style="font-size: 12.0pt; font-family: ����">��ְ</span></td>
		  <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;
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
              </span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����нˮ</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;
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
	  end select%>
              <span style="font-family: ����">(����Բ/��)</span> </span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">ס��Ҫ��</span></td>
		  <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("workhouse")%></span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����ʱ��</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;
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
              </span></td>
		<td width="384" colspan="3" valign="top" style="width: 288.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
	</tr>
	<tr>
		<td width="720" colspan="5" valign="top" style="width: 540.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6">
		<p class="MsoNormal"><span style="font-size: 12.0pt; font-family: ����">
		��������</span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align: center; text-indent: 6.0pt">
		<span style="font-size: 12.0pt; font-family: ����">��������</span></td>
		  <td width="612" colspan="4" valign="top" style="width: 459.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("doneyear")%> ��</span></td>
	</tr>
	<tr style="height: 48.25pt">
		<td width="108" valign="top" style="width: 81.0pt; height: 48.25pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></p>
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
		  <td width="612" colspan="4" valign="top" style="width: 459.0pt; height: 48.25pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("job_career")%></span></td>
	</tr>
	<tr>
		<td width="720" colspan="5" valign="top" style="width: 540.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6">
		<p class="MsoNormal"><span style="font-size: 12.0pt; font-family: ����">
		��������</span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align: center">
		<span style="font-size: 12.0pt; font-family: ����">��ҵԺУ</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("college")%></span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">ѧ��</span></td>
		  <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;
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
              </span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����רҵ</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("spec1")%></span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">�ڶ�רҵ</span></td>
		  <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("spec2")%></span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">�����ˮƽ</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("com_level")%></span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">������ò</span></td>
		  <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("zzmm")%></span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">��һ����</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("l_type1")%></span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����ˮƽ</span></td>
		  <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("l_level1")%></span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">�ڶ�����</span></td>
		  <td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("l_type2")%></span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">Ӣ��ˮƽ</span></td>
		  <td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("l_level2")%></span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">����֤��</span></td>
		  <td width="612" colspan="4" valign="top" style="width: 459.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("certificate")%></span></td>
	</tr>
	<tr style="height: 48.25pt">
		<td width="108" valign="top" style="width: 81.0pt; height: 48.25pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">
		<span style="font-size: 12.0pt; font-family: ����">��������</span><span lang="EN-US" style="font-size:12.0pt">/</span><span style="font-size: 12.0pt; font-family: ����">��ѵ����</span></td>
		  <td width="612" colspan="4" valign="top" style="width: 459.0pt; height: 48.25pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("edu_career")%></span></td>
	</tr>
	<tr>
		<td width="720" colspan="5" valign="top" style="width: 540.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; background: #E6E6E6">
		<p class="MsoNormal"><span style="font-size: 12.0pt; font-family: ����">
		�������ۡ��Լ�˵��</span></td>
	</tr>
	<tr style="height: 48.25pt">
		<td width="108" valign="top" style="width: 81.0pt; height: 48.25pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></p>
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
		  <td width="612" colspan="4" valign="top" style="width: 459.0pt; height: 48.25pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm"> 
            <p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;<%=rs1("selfintro")%></span></td>
	</tr>
	<tr>
		  <td width="720" colspan="5" valign="top" style="width: 540.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm; > 
            <p class="MsoNormal"><span style="font-size: 12.0pt; font-family: ����"> 
              <%if request.cookies("01387job")("companyusername")<>"" and  request.cookies("01387job")("cid")<>"" and request.cookies("01387job")("cidpower")<>"" and session("01387jobcid")<>"" then%>
              </span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">&nbsp; </td>
		<td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">&nbsp; </td>
		<td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">&nbsp; </td>
		<td width="228" valign="top" style="width: 171.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
		<td width="120" valign="top" style="width: 90.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">&nbsp; </td>
		<td width="264" colspan="2" valign="top" style="width: 198.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
	</tr>
	<tr>
		<td width="108" valign="top" style="width: 81.0pt; border-left: 1.0pt solid windowtext; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal" align="center" style="text-align:center">&nbsp; </td>
		<td width="612" colspan="4" valign="top" style="width: 459.0pt; border-left: medium none; border-right: 1.0pt solid windowtext; border-top: medium none; border-bottom: 1.0pt solid windowtext; padding-left: 5.4pt; padding-right: 5.4pt; padding-top: 0cm; padding-bottom: 0cm">
		<p class="MsoNormal"><span lang="EN-US" style="font-size:12.0pt">&nbsp;</span></td>
	</tr>
</table>

	
	</strong></td>
  </tr>
</table>
<%if request.cookies("01387job")("cidpower")>=2 then%>

<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr > 
    <td height="16" colspan="4"><div align="center"> 
        <p><br>
          ��ͨ��Աֻ�ܿ���<strong><font color="#FF0000">���յ���ӦƸ������</font></strong>����ϵ��ʽ,Ҫ��ȫ����������ϵ��վ��</p>
        <p>����·��������˲��ղؼС��ɷ������������</p>
      </div></td>
  </tr>
</table>
<table width="700" height="32" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"> 
      <!--     <button accesskey="K" type="submit" onClick="call_window('../Company/Apply_InterviewSelf.asp?uid=<%=rs1("id")%>',250,430);" class="win_"><img src="../images/90.gif" width="18" height="15" /> ��������</button>&nbsp;    -->
      <hr align="center" size="1">
      <br>
      <button accesskey="l" type="submit" onclick=Javascript:location='../company/favoadd_2.asp?uid=<%=trim(rs1("uid"))%>' class="win_">�����˲��ղؼ�</button>&nbsp;   
                 <button accesskey="K" type="submit" onClick="window.print()" class="win_">��ӡ����</button></td>
  </tr>
</table>
<%else%>
<div align="center"> <font color="#FF0000">��ʽ��Ա���Բ鿴��ϵ��ʽ��</font> </div>
<%end if%>
<%else%>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr> 
    <td height="28" align="center" class="news10" >������Ա���ɲ鿴�ü�������ϵ��ʽ����<A href="../Company/Login.asp">[��¼]</A>��������Ա���ģ�δע������ 
      <A href="../Company/reg_one.asp" target="_blank">[ע��]</A>��</td>
  </tr>
</table>



  <%end if%></table></table>
  <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"> <p align="left"><font color="#666666"><br>
        <font color="#999999">�������ڣ�<%=rs1("updatetime")%> &nbsp;&nbsp;&nbsp;ע�����ڣ�<%=rs1("regtime")%></font></font></p>
      </td>
  </tr>
</table>
  
  
<br>
<br>
<br>
<table width="100%" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center" bgcolor="#E6E6E6"><p>&nbsp;</p>
      <p>Copyright(C)2006-2008 �����͹���Ƹ����Ϣ���У�δ��������׼ת�أ�</p>
      <p>&nbsp;</p></td>
  </tr>
</table>
</body>
<script src="../js/big5.js" language="JavaScript"></script>
</html>
<%
rs1.close
set rs1=nothing
call closeconn()
%>