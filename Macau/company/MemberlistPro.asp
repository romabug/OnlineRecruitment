<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select companyname,regtime from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"' order by id desc" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select uid,degree,birthday,sex,subcatelog,lastlogin,uname,doneyear,province,id from [01387member] where resumestatus='open' and promember=1  and canshow='ok' order by lastlogin desc,id desc" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp" -->
<!--#include file="inc/page20.inc"-->
<script language=jscript>
function CheckOthers(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            if (e.checked==false)
            {
                e.checked = true;
            }
            else
            {
                e.checked = false;
            }
    }
}

function CheckAll(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            e.checked = true;
    }
}
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnShow")
	    {form1.action="ShowCheckPerson.asp";form1.submit();}
	else
		{form1.action="Favoadd.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;"><!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
        <br />
        <table width="600" border="0" cellpadding="0" cellspacing="0" class="jobp_table">
          <tr>
            <td  class='jobp_table_top'>�߼��˲��б�</td>
          </tr>
          <tr>
            <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <form action="" method="post" name="form1" id="form1">
                  <tr align="center">
                    <td width="94" height="24" class="jobp">����<font color="#FF0000">&nbsp;</font></td>
                    <td width="68" class="jobp">ѧ��</td>
                    <td width="41" class="jobp">����</td>
                    <td width="44" class="jobp">�Ա�</td>
                    <td width="62" class="jobp">����</td>
                    <td width="67" class="jobp">��������</td>
                    <td width="115" class="jobp">��һ����ְλ</td>
                    <td width="103" class="jobp">��½ʱ��</td>
                    <td width="42" class="jobp">����</td>
                  </tr>
                  <%if rs1.eof and rs1.bof then%>
                  <tr bgcolor="#FFFFFF">
                    <td height="50" colspan="9"><div align="center"><font class="p11"><strong>�����͹���Ƹ������ʱû����Ϣ��</strong></font></div></td>
                  </tr>
                  <%end if%>
                  <%
					  i=1
					  do while not rs1.eof
					  if i mod 2 = 0 then
					  bg="bgcolor=#ffffff" 
					  '����Ǳ���ͼƬ,�� 
					  'bg="background=""image/*.*"""
					  else
					  bg="bgcolor=#F6F9FD"
					  end if
					  %>
                  <tr <%=bg%>>
                    <td height="24"><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif">
					
					<a href="../Person/viewresume.asp?sid=<%=rs1("id")%>" target="_blank"><%=rs1(6)%></a></font></div></td>
                    <td height="24" align="center"><%
					  select case rs1(1)
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
					  end select
					  %></td>
                    <td align="center"><%=datediff("yyyy",rs1(2),date())%></td>
                    <td align="center"><%
						select case rs1(3)
						case true
						response.write("��")
						case false
						response.write("Ů")
						end select
						%></td>
                    <td align="center"><%
		  select case rs1(8)
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
		  %></td>
                    <td align="center"><%=rs1(7)%>��</td>
                    <td align="center"><%=rs1(4)%></td>
                    <td><div align="center"><%=datevalue(rs1(5))%></div></td>
                    <td><div align="center">
                        <input name="chkNo" type="checkbox" value="<%=rs1(0)%>" />
                    </div></td>
                  </tr>
                  <%
					  i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop
					  %>
                  <tr>
                    <td height="30" colspan="9" bgcolor="#FFFFFF"><div align="right">
                        <input type="button" name="Button3" value="ȫѡ" style="font-size=12" onClick="CheckAll(this.form)" />
                        <input type="button" name="Button2" value="��ѡ" style="font-size=12" onClick="CheckOthers(this.form);" />
                        <input type="button" name="btnApply" value="�����˲��ղؼ�" style="font-size=12" onClick="doSubmit(document.form1,this)" />
           <!--   <input name="btnShow" type="button" id="btnShow" style="font-size=12" onClick="doSubmit(document.form1,this)" value="��ʾ��ѡ" />   -->
                    </div></td>
                  </tr>
                </form>
            </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="5"></td>
                  </tr>
                </table>
              <table width="100%" height="18" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#D5EDFE" bgcolor="#f0f0f0" class="f12">
                  <form method="post" action='MemberlistPro.asp'>
                    <tr>
                      <td height="30" align="right" bordercolor="#f0f0f0" bgcolor="#FFFFFF">����
                        <%
   If currentpage > 1 Then
      response.write "<a href='MemberlistPro.asp?page="+cstr(1)+"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='MemberlistPro.asp?page="+Cstr(currentpage-1)+"'><font color='#ff0000'>ǰҳ</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>ǰҳ-</font>"      
   End if
   
   If currentpage < Rs1.PageCount Then
      Response.write "<a href='MemberlistPro.asp?page="+Cstr(currentPage+1)+"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='MemberlistPro.asp?page="+Cstr(Rs1.PageCount)+"'><font color='#ff0000'>βҳ</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>βҳ</font>&nbsp;&nbsp;"       
   End if
   Response.write "<font color='#333333'>ҳ��:</font>" & "<font color=#ff0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333'>/" & Cstr(rs1.pagecount) & "</font>&nbsp;"
   Response.write "<font color=#ff0000>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333'>��/ҳ&nbsp" & "��</font>" & "<font color=#ff0000>" & Cstr(Rs1.RecordCount) & "</font>" & "<font color='#333333'>����Ϣ</font>&nbsp;&nbsp;"

response.write "&nbsp;&nbsp;&nbsp;&nbsp;"
response.write "<font color='#333333'>ת����</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
   response.write "<input type='submit'  value=' GO '  name='cndok' class='button'></span>&nbsp;&nbsp;"   
%></td>
                    </tr>
                  </form>
              </table></td>
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
