<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="../inc/Function.asp"-->
<%
Function LenTemp(temp,length)
	if len(temp)>=length then
		lenTemp=left(temp,length) & ".."
	else
		lenTemp=temp
	end if
End Function
jid=request.QueryString("jid")
Call RsName(rs,"select A.id,A.jid,A.cid,A.jobname,B.companyname,A.neednum,A.maincatelog,A.subcatelog,A.jobtype,A.sex,A.needage,A.degree,A.salary,A.publishtime,A.overtime,A.jobtime,A.jobplace,A.doneyear,A.lookcount,A.demand,A.interview,B.contact,B.tel,B.fax,B.province,B.citys,B.address,B.zipcode,B.mobile,B.email,B.website,A.zhufang,A.fangfa,A.jobcity from [01387joblist] A inner join [01387company] B on A.cid=B.cid where A.jid='"&jid&"' order by A.id desc",1,1)
if rs.eof and rs.bof then
Call ShowError("��������")
end if
Call RsName(rs1,"select jid,jobname,neednum from [01387joblist] where cid='"&rs(2)&"'  and canshow='ok' order by id desc",1,1)
conn.execute("update [01387joblist] set lookcount=lookcount+1 where jid='"&jid&"'")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��--<%=rs(3)%>--�����͹�/��������/�͹���Ƹ</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ���ṩ������ѯ,������ѵ,���������һ��������">
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա">

<link href="../css/01387.css" rel="stylesheet" type="text/css" />
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript" type="text/JavaScript">
	function go_url(url,height,width)
	{
		var rtvalue = showModalDialog(url,window,"dialogWidth:"+ width +"px;dialogHeight:"+ height +"px;center:yes;help:no;resizable:no;status:no");
	}

</script>
<body>
<!--#include file="../inc/top_showjob.asp"-->
<table width="776" height="88" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/qjoblook_bg.gif">
  <tbody>
    <tr>
      <td width="776" height="48" valign="bottom" style="padding-left:25px;"><font color="#ffffff" size="4" face="����">&nbsp;<%=rs(4)%></font></td>
    </tr>
    <tr>
      <td height="26"  style="padding-left:260px; padding-top:3px;"><img src="../images/sj.gif"  /> <a href="ShowCompany.asp?cid=<%=rs(2)%>" class="qjob14" target="_self">��˾���</a>  &nbsp;&nbsp;<img src="../images/sj.gif"  /> <a href="ShowAllJob.asp?cid=<%=rs(2)%>" class="qjob14">������Ƹְλ</a>   &nbsp;&nbsp;<img src="../images/sj.gif" /> <a href="ShowCompany.asp?cid=<%=rs(2)%>" class="qjob14">��ϵ��ʽ</a></td>
    </tr>
    <tr>
      <td height="10"></td>
    </tr>
  </tbody>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="193" height="430" valign="top" bgcolor="#E9F1F7" class="ta"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30" align="center"><a href="ShowAllJob.asp?cid=<%=rs(2)%>"><img src="../images/jobst.gif" width="193" height="31" border="0" /></a></td>
      </tr>
      <tr>
        <td align="right"><table width="90%" border="0" cellspacing="0" cellpadding="0">
            <%do while not rs1.eof%>
            <tr>
              <td height="26" align="left"><a href="ShowJob.asp?jid=<%=rs1(0)%>" title="<%=rs1(1)%>"><%=LenTemp(rs1(1),10)%></a>&nbsp;<font color="#555555">(<font face="Geneva, Arial, Helvetica, sans-serif"><%=rs1(2)%></font>��)</font></td>
            </tr>
            <%
			  rs1.movenext
			  loop
			  %>
        </table></td>
      </tr>
    </table></td>
    <td width="1" background="../images/dian.gif"></td>
    <td width="617" align="center" valign="top" bgcolor="#F8F8F8"><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
        <tr> 
          <td>            <table width="569" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="569" height="24" align="left" background="../images/job_bg.gif" class="showjob"><%=rs(3)%><%=rs(5)%>��</td>
            </tr>
            <tr>
              <td height="8" align="left" ><img src="../images/shojob2.gif" width="569" height="8" /></td>
            </tr>
          </table>
            <TABLE width=569 border=0 align="center" cellPadding=0 cellSpacing=0 borderColorDark=#ffffff>
              <TBODY>
                <TR > 
                  <TD width=93 height="25" align="center"><font color="#003399">��λ���</font></TD>
                  <TD width=218 align="left">&nbsp;<%
							select case rs(6)
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
                  &gt; <%=rs(7)%></TD>
                  <TD width=88 align="center"><font color="#003399">�������</font></TD>
                  <TD width=170 align="left">&nbsp;<%if rs(8)=1 then response.write("ȫְ") else response.write("��ְ")%>                  </TD>
                </TR>
                <TR> 
                  <TD height="25" align="center"><font color="#003399">Ҫ���Ա�</font></TD>
                  <TD align="left">&nbsp;<%
								  select case rs(9)
								  case 3
								  response.write("��Ҫ��")
								  case 1
								  response.write("��")
								  case 2
								  response.write("Ů")
								  end select
								  %></TD>
                  <TD align="center"><font color="#003399">����Ҫ��</font></TD>
                  <TD align="left">&nbsp;<%if rs(10)="" then response.Write("��Ҫ��") else response.write(rs(10))%></TD>
                </TR>
                <TR > 
                  <TD height="25" align="center"><font color="#003399">ѧ��Ҫ��</font></TD>
                  <TD align="left">&nbsp;<%
								  select case rs(11)
								  case 0
								  response.write("��������")
								  case 1
								  response.write("����")
								  case 2
								  response.write("ְ��")
								  case 3
								  response.write("��ר")
								  case 4
								  response.write("��ר")
								  case 5
								  response.write("����")
								  case 6
								  response.write("˶ʿ")
								  case 7
								  response.write("��ʿ")
								  end select
								  %>������</TD>
                  <TD align="center"><font color="#003399">���ʴ�����</font></TD>
                  <TD align="left">&nbsp;<%if rs(12)=0 then response.Write("����")else response.Write(rs(12)&"Ԫ/��")%></TD>
                </TR>
                <TR > 
                  <TD height="25" align="center"><font color="#003399">�������飺</font></TD>
                  <TD align="left">&nbsp;<font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(17)%>��</font></TD>
                  <TD align="center"><font color="#003399">���������</font></TD>
                  <TD align="left">&nbsp;<font  face="Geneva, Arial, Helvetica, sans-serif"><%=rs(18)+1%></font></TD>
                </TR>
				<TR > 
                  <TD height="25" align="center"><font color="#003399">ס��Ҫ��</font></TD>
                  <TD align="left">&nbsp;<%select case rs("zhufang")
				  case "0"
				  response.Write "����Э��"
				  case "1"
				  response.Write "�ṩס��"
				  case "2"
				  response.Write "���н��"
				  end select
				  %></TD>
                  <TD align="center"><font color="#003399">����������</font></TD>
                  <TD align="left"><%=rs("jobcity")%></TD>
                </TR>
                <TR > 
                  <TD height="25" align="center"><font color="#003399">�������ڣ�</font></TD>
                  <TD align="left"><font face="Geneva, Arial, Helvetica, sans-serif">&nbsp;<%=rs(13)%></font></TD>
                  <TD align="center"><font color="#003399">��ֹ���ڣ�</font></TD>
                  <TD align="left">&nbsp;<font face="Geneva, Arial, Helvetica, sans-serif"><strong><%if rs(14)="2049-1-1" then response.Write("������Ч")else response.Write(rs(14))%>
                  </strong></font></TD>
                </TR>
				<TR > 
                  <TD height="25" align="center"><font color="#003399">����Ҫ��</font></TD>
                  <TD height="24" align="left">&nbsp;<%=rs(20)%></TD>
                  <TD height="24" align="center"><font color="#003399">��ϵ������</font></TD>
                  <TD height="24" align="left"><%select case rs("fangfa")
				  case "1"
				  response.Write "�绰��ϵ"
				  case "2"
				  response.Write "ͨ������"
				  case "3"
				  response.Write "��λ����"
				  end select
				  %></TD>
				</TR><TR > 
                  <TD height="10" colspan="4" align="center">&nbsp;</TD>
                  </TR>
                <TR > 
                  <TD colspan="4"><table width="569" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="569" height="29" align="left" background="../images/jobte.gif" class="showjob">&nbsp;</td>
                    </tr>
                  </table>
                    <table width="100%" border="0" cellspacing="6" cellpadding="5">
                      <tr> 
                        <td align="left"  style="line-height:160%;word-wrap: break-word; word-break: break-all;">
						  <%=rs(19)%></td>
                      </tr>
                    </table></TD>
                </TR>
                <TR> 
                  <TD colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="197" height="40">&nbsp;</td>
                        <td width="127"><a href="javascript:;" onClick="go_url('sendapply.asp?jid=<%=rs(1)%>&cid=<%=rs(2)%>',200,426);"><img src="../images/But.gif" border="0"></a></td>
                        <td width="125"><a href="FavoAdd.asp?jid=<%=rs(1)%>&cid=<%=rs(2)%>" target="_blank"><img src="../images/szj.gif" width="116" height="24" border="0"></a></td>
                        <td width="120"><a href="Commend.asp?jid=<%=rs(1)%>" target="_blank"><img src="../images/fend.gif" border="0"></a></td>
                      </tr>
                    </table>
                    <table width="569" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="569" height="28" align="left" background="../images/cont.gif" class="showjob">&nbsp;</td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="6" cellpadding="5">
                      <tr>
                        <td align="left" class="1" style="line-height:180%;">�� ϵ �ˣ�&nbsp;<%=rs(21)%><br />
                          ��&nbsp;&nbsp;&nbsp; ����&nbsp;<span style="line-height:20px"><%=rs(22)%></span><br />
                        ��&nbsp;&nbsp;&nbsp; �棺&nbsp;<span style="line-height:20px"><%=rs(23)%></span><br />
                        ��&nbsp;&nbsp;&nbsp; ����&nbsp;<span style="line-height:20px"><%=rs(18)%></span><br />
                        ͨѶ��ַ��&nbsp;<span style="line-height:20px"><%
		  select case rs(24)
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
                        <%=rs(25)&rs(26)%> </span><br />
                        �������룺<span style="line-height:20px"><span class="1" style="line-height:180%;">&nbsp;</span><%=rs(27)%></span><br />
                        �����ʼ���&nbsp;<a href="mailto:<%=rs(29)%>"><%=rs(29)%></a><br />
                        ��˾��վ��&nbsp;<a href="<%=rs(30)%>" target="_blank"><%=rs(30)%></a></td>
                      </tr>
                    </table>                  </TD>
                </TR>
              </TBODY>
          </TABLE></td>
        </tr>
        
      </table>    </td>
  </tr>
</table>
<table width="776" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="5" bgcolor="#E9F1F7"></td>
  </tr>
</table>
<!--#include file="bottom.asp"-->
<%
call closers()
rs1.close
set rs1=nothing
call closeconn()
%>
</body>
</html>
