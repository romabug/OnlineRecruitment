<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
MyChkgo=request("ChkNo")
if MyChkgo="" then
Call ShowError("δѡ��")
end if
MyChk=split(MyChkgo,", ")
uid=""
for i=0 to Ubound(MyChk)
uid=uid&"'"&MyChk(i)&"',"
next
uid=left(uid,len(uid)-1)
Call RsName(rs1,"select * from [01387member] where uid in ("&uid&") order by id desc",1,1)
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"' order by id desc" ,conn,1,1
%>
<%
dim MaxPerPage
MaxPerPage=1
dim text,checkpage
text="0123456789"
 Rs1.PageSize=MaxPerPage
for i=1 to len(request("page"))
   checkpage=instr(1,text,mid(request("page"),i,1))
   if checkpage=0 then
      exit for 
   end if
next

If checkpage<>0 then
      If NOT IsEmpty(request("page")) Then
        CurrentPage=Cint(request("page"))
        If CurrentPage < 1 Then CurrentPage = 1
        If CurrentPage > Rs1.PageCount Then CurrentPage = Rs1.PageCount
      Else
        CurrentPage= 1
      End If
      If not Rs1.eof Then Rs1.AbsolutePage = CurrentPage end if
Else
   CurrentPage=1
End if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<br />
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr>
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;���˻�������(<font face="Geneva, Arial, Helvetica, sans-serif">NO.<%=rs1("uid")%></font>)</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr>
    <td width="535" valign="middle"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr >
        <td width="119" height="26" ><div align="right"><font color="#000099">��&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td>
        <td width="209"  id="resume"><%=rs1("uname")%></td>
        <td width="98"><div align="right"><font color="#000099">��&nbsp;&nbsp;&nbsp;&nbsp;��</font></div></td>
        <td width="109" id="resume"><%
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
        <td height="26" align="right"><font color="#000099">��&nbsp;&nbsp;&nbsp;&nbsp;�壺</font></td>
        <td><%=rs1("nation")%></td>
        <td align="right"><font color="#000099">��&nbsp;&nbsp;&nbsp;&nbsp;����</font></td>
        <td id="resume"><%
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
      </tr>
      <tr >
        <td height="26"><div align="right"><font color="#000099">��&nbsp;&nbsp;&nbsp;&nbsp;�䣺</font></div></td>
        <td id="resume"><%=datediff("yyyy",rs1("birthday"),date())%></td>
        <td><div align="right"><font color="#000099">��&nbsp;&nbsp;&nbsp;&nbsp;�ߣ�</font></div></td>
        <td><%=rs1("height")%>cm</td>
      </tr>
      <tr>
        <td height="26"><div align="right"><font color="#000099">����״����</font></div></td>
        <td id="resume"><%select case rs1("marry")
		  case 1
		  response.Write("δ��")
		  case 2
		  response.Write("�ѻ�")
		  case 3
		  response.Write("����")
		  case 4
		  response.Write("����")
		  end select%>
        </td>
        <td align="right"><font color="#000099">�����ڵأ�</font></td>
        <td><%=rs1("address")%></td>
      </tr>
    </table></td>
    <td width="163" align="center" valign="middle"><table width="142" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><%if rs1("pic")<>"" then%>
              <%if rs1("pichide")="ok" then%>
              <img src='../person/image/nopic.gif' width="84" height="112" border='0' style='border:1px solid #000000'>
              <%else%>
              <a href="../person/upload/<%=rs1("pic")%>" target="_blank"> </a><a href="../person/upload/<%=rs1("pic")%>" target="_blank"><img src='../person/upload/<%=rs1("pic")%>' width="84" height="112" border='0' style='border:1px solid #000000'></a><a href="../person/upload/<%=rs1("pic")%>" target="_blank">
              <%end if%>
              </a>
              <%else%>
              <img src='../person/image/nopic.gif' width="84" height="112" border='0' style='border:1px solid #000000'>
              <%end if%>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr>
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;��ְ����</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr >
    <td width="118" height="26" align="right"><font color="#000099">ӦƸ����ҵ(һ)��</font></td>
    <td width="213"><%
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
    <td width="93" align="right"><font color="#000099">����ְλ(һ)��</font></td>
    <td width="274"><%=rs1("subcatelog")%></td>
  </tr>
  <tr>
    <td height="26" align="right"><div align="right"><font color="#000099">ӦƸ����ҵ(��)��</font></div></td>
    <td><%
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
    <td><div align="right"><font color="#000099">����ְλ(��)��</font></div></td>
    <td><%=rs1("subcatelog2")%></td>
  </tr>
  <tr >
    <td height="26" align="right" ><div align="right"><font color="#000099">���ʺϵ�ְλ��</font></div></td>
    <td><%=rs1("jobname")%></td>
    <td ><div align="right"><font color="#000099">ȫְ/��ְ��</font></div></td>
    <td ><%
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
    <td height="26" align="right"><div align="right"><font color="#000099">нˮҪ��</font></div></td>
    <td><%select case rs1("salary")
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
      (Ԫ/��)</td>
    <td><div align="right"><font color="#000099">ס��Ҫ��</font></div></td>
    <td><%=rs1("workhouse")%></td>
  </tr>
  <tr>
    <td height="26" align="right" ><div align="right"><font color="#000099">����ʱ�䣺</font></div></td>
    <td colspan="3" ><%
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
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr>
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;��������</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr >
    <td width="119" height="26"><div align="right"><font color="#000099">�������飺</font></div></td>
    <td width="579"><%=rs1("doneyear")%>��</td>
  </tr>
  <tr>
    <td height="26"><div align="right"><font color="#000099">����������</font></div></td>
    <td height="30" style="word-break:break-all;padding-top:10px;padding-bottom:10px;line-height:160%;"><%=rs1("job_career")%></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr>
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;��������</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr >
    <td width="120" height="26"><div align="right"><font color="#000099">��ҵԺУ��</font></div></td>
    <td height="26"><%=rs1("college")%></td>
    <td height="26"><div align="right"><font color="#000099">ѧ&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td>
    <td height="26"><%
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
    <td height="26"><div align="right"><font color="#000099">����רҵ��</font></div></td>
    <td><%=rs1("spec1")%></td>
    <td><div align="right"><font color="#000099">�ڶ�רҵ��</font></div></td>
    <td><%=rs1("spec2")%></td>
  </tr>
  <tr >
    <td height="26" ><div align="right"><font color="#000099">�����ˮƽ��</font></div></td>
    <td><%=rs1("com_level")%></td>
    <td><div align="right"><font color="#000099">������ò��</font></div></td>
    <td><%=rs1("zzmm")%></td>
  </tr>
  <tr>
    <td height="26"><div align="right"><font color="#000099">��һ���</font></div></td>
    <td width="216"><%=rs1("l_type1")%></td>
    <td width="91"><div align="right"><font color="#000099">�㶫��ˮƽ��</font></div></td>
    <td width="271"><%=rs1("l_level1")%></td>
  </tr>
  <tr >
    <td height="26"><div align="right"><font color="#000099">�ڶ����</font></div></td>
    <td><%=rs1("l_type2")%></td>
    <td><div align="right"><font color="#000099">Ӣ��ˮƽ��</font></div></td>
    <td><%=rs1("l_level2")%></td>
  </tr>
  <tr>
    <td height="26"><div align="right"><font color="#000099">����֤�飺</font></div></td>
    <td colspan="3"><%=rs1("certificate")%></td>
  </tr>
  <tr >
    <td height="26" align="right" ><font color="#000099">��ѵ�����������</font></td>
    <td colspan="3"><table width="496" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="10"></td>
      </tr>
      <tr>
        <td width="496" style="word-break:break-all;line-height:160%;padding-top:10px;padding-bottom:10px;"><%=rs1("edu_career")%></td>
      </tr>
      <tr>
        <td height="10"></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr>
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;��������</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr >
    <td width="119" height="26" ><div align="right"><font color="#000099">�������ۣ�</font></div></td>
    <td width="579" height="60" style="word-break:break-all; line-height:160%; padding-top:10px;padding-bottom:10px;"><%=rs1("selfintro")%></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr>
    <td height="25" bgcolor="#F5F5F5"><strong>&nbsp;&nbsp;��ϵ��ʽ</strong></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0" class="joblook2">
  <tr >
    <td width="120" height="26"><div align="right"><font color="#000099">��&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td>
    <td width="246"><%=rs1("tel")%></td>
    <td width="98"><div align="right"><font color="#000099">��&nbsp;&nbsp;&nbsp;&nbsp;����</font></div></td>
    <td width="234"><%=rs1("mobile")%></td>
  </tr>
  <tr>
    <td height="26"><div align="right"><font color="#000099">������룺</font></div></td>
    <td><%=rs1("chatno")%></td>
    <td><div align="right"><font color="#000099">������ҳ��</font></div></td>
    <td><a href="<%=rs1("selfweb")%>" target=_blank><%=rs1("selfweb")%></a></td>
  </tr>
  <tr >
    <td height="26" class="joblook"><div align="right"><font color="#000099">��&nbsp;&nbsp;&nbsp;&nbsp;�ࣺ</font></div></td>
    <td  class="joblook"><%=rs1("zipcode")%>&nbsp;</td>
    <td  class="joblook"><div align="right"><font color="#000099">E-mail��</font></div></td>
    <td  class="joblook"><a href="mailto:<%=rs1("email")%>"><%=rs1("email")%></a></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="35" align="center">����ѡ�� <font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=rs1.recordcount%></font> �ݼ���&nbsp;&nbsp;��ǰ�� <font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=currentpage%></font> ��&nbsp;&nbsp;</strong> 
          <%If currentpage > 1 Then
      response.write "<a href='ShowCheckPerson.asp?page="+cstr(1)+"&ChkNo="&MyChkgo&"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='ShowCheckPerson.asp?page="+Cstr(currentpage-1)+"&ChkNo="&MyChkgo&"'><font color='#ff0000'>ǰҳ</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>ǰҳ-</font>"      
   End if
   If currentpage < rs1.PageCount Then
      Response.write "<a href='ShowCheckPerson.asp?page="+Cstr(currentPage+1)+"&ChkNo="&MyChkgo&"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='ShowCheckPerson.asp?page="+Cstr(rs1.PageCount)+"&ChkNo="&MyChkgo&"'><font color='#ff0000'>βҳ</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>βҳ</font>&nbsp;&nbsp;"       
   End if%></td>
  </tr>
  <tr>
    <td height="80" align="center"><input TYPE="button" VALUE="�����˲��б�" NAME="Button" style="width:120;height:26" onClick="history.go(-1)">
          <input NAME="Button2" TYPE="button" id="Button2" style="width:120;height:26" onClick="location.href='Apply_InterviewSelf.asp?from=ShowCheckPerson&chkNo=<%=rs1("uid")%>&page=<%=currentpage%>&MyChkgo=<%=MyChkgo%>'" VALUE="������������"></td>
  </tr>
</table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
