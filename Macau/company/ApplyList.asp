<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
Call PowerCheck(1)
set rs=server.createobject("adodb.recordset")
rs.open "select * from [01387company] where username='"&request.cookies("01387job")("companyusername")&"' and cid='"&request.cookies("01387job")("cid")&"' order by id desc" ,conn,1,1
set rs1=server.createobject("adodb.recordset")

rs1.open "select A.id,A.applyid,A.jid,A.cid,A.uid,A.status,A.applytime,B.jobname,C.uname,C.uid,c.Spec1,c.sex,c.Doneyear,c.id from [01387applylist] as A,[01387joblist] as B,[01387member] as C where A.jid=B.jid and A.uid=C.uid and A.cid='"&request.cookies("01387job")("cid")&"' and A.status<>4 and A.member_message is not null order by A.applytime desc,A.id desc" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="inc/page.inc"-->
<script language=jscript>
function go_url(url,height,width)
	{
		var rtvalue = showModalDialog(url,window,"dialogWidth:"+ width +"px;dialogHeight:"+ height +"px;center:yes;help:no;resizable:no;status:no");
	}

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
		{form1.action="ShowApplyPerson.asp";form1.submit();}
	else 
		{form1.action="ApplyListdel.asp?page=<%=currentpage%>";form1.submit();}
}
</script>
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c9.gif" bgcolor="#F6F9FD"  style="BORDER-left: #404040 1px solid;">
        <!--#include file="left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #9DB3C5 1px solid;"><!--#include file="welcome.asp"-->
<table width="100%"  border='0' cellpadding='0' cellspacing='0' class="jobp_table">
  <tr>
    <td colspan='2' class='jobp_table_top'>�յ�ӦƸ�����б�</td>
  </tr>
  <tr>
    <td colspan="2" ></td>
  </tr>
  <tr>
    <td height="40" colspan="2" valign="top" ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center">
        <td width="112" height="21"  class="jobp">ӦƸְλ</td>
        <td width="74" height="21" class="jobp">ӦƸ��</td>
        <td width="48" class="jobp">�Ա�</td>
        <td width="76" class="jobp">��������</td>
        <td width="50" class="jobp">רҵ</td>
        <td width="75" height="21" class="jobp">״̬</td>
        <td width="72" height="21"  class="jobp">��ְ��</td>
        <td width="87"  class="jobp">�յ�����ʱ��</td>
        <td width="42" height="21"  class="jobp">����</td>
      </tr>
      <%if rs1.eof and rs1.bof then%>
      <tr>
        <td height="24" colspan="9" align="center" bgcolor="#FFFFFF" class="p11"><strong>�����͹���Ƹ������ʱû����Ϣ��</strong></td>
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
					 <form name="form1" method="post" action="">
      <tr <%=bg%>>
        <td height="25" align="center"><a href="../jobs/showjob.asp?jid=<%=rs1(2)%>" target="_blank"><%=rs1(7)%></a></td>
        <td align="center"><a href="../person/viewdetail.asp?sid=<%=rs1(13)%>" target="_blank"><%=rs1(8)%></a></td>
        <td align="center"><%
				select case rs1("sex")
				case true
				response.write("��")
				case false
				response.write("Ů")
				end select
				%></td>
        <td align="center"><%=rs1("doneyear")%>��</td>
        <td align="center"><%=rs1("spec1")%></td>
        <td align="center"><%
						 select case rs1(5)
						 case 1
						 response.Write("<font color=#0033FF>�ȴ��Ķ�</font>")
						 case 2
						 response.Write("<font color=#993300>���ڿ���</font>")
						 case 3
						 response.Write("<font color=#009900>��֪ͨ����</font>")
						 case 4
						 response.Write("<font color=#FF0000>�Ѿ�ɾ��</font>")
						 end select
						%></td>
        <td align="center"><a href="javascript:;" onClick="go_url('Apply_view.asp?id=<%=rs1(0)%>',250,430);"><img src="../images/99.gif" width="16" height="16" border="0" align="absmiddle" />��ְ��</a></td>
        <td align="center"><font face="Geneva, Arial, Helvetica, sans-serif" color="666666"><%=rs1(6)%></font></td>
        <td align="center"><input name="chkNo" type="checkbox" value="<%=rs1(9)%>|<%=rs1(0)%>"></td>
        </tr>
    <%
					  i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop
					  %>
					  <tr>
        <td height="35" colspan="9" align="right" bgcolor="#FFFFFF" class="p11"><input type="button" name="Button3" value="ȫѡ" style="font-size=12" onClick="CheckAll(this.form)">
                            <input type="button" name="Button2" value="��ѡ" style="font-size=12" onClick="CheckOthers(this.form);">
                            <input name="btnShow" type="button" id="btnShow" style="font-size=12" onClick="doSubmit(document.form1,this)" value="��ʾ��ѡ����">
                        <input name="btnDel" type="button" id="btnDel" style="font-size=12" onClick="doSubmit(document.form1,this)" value="ɾ��">
                        &nbsp;</td>
      </tr></form>
    </table>
			<table width="100%" height="25" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#D5EDFE" bgcolor="#f0f0f0" class="f12">
			<form method="post" action='ApplyList.asp'>
            <tr>
              <td height="20" align="right" bordercolor="#f0f0f0" bgcolor="#FFFFFF"><%
   If currentpage > 1 Then
      response.write "<a href='ApplyList.asp?page="+cstr(1)+"'><font color='#ff0000'>��ҳ</font></a><font color='#333333'><b>-</b></font>"  
      Response.write "<a href='ApplyList.asp?page="+Cstr(currentpage-1)+"'><font color='#ff0000'>ǰһҳ</font></a><font color='#333333'><b>-</b></font>"
   Else
      Response.write "<font color='#333333'>��ҳ-</font>"
      Response.write "<font color='#333333'>ǰһҳ-</font>"      
   End if
   
   If currentpage < Rs1.PageCount Then
      Response.write "<a href='ApplyList.asp?page="+Cstr(currentPage+1)+"'><font color='#ff0000'>��һҳ</font></a><font color='#333333'><b>-</b></font>"
      Response.write "<a href='ApplyList.asp?page="+Cstr(Rs1.PageCount)+"'><font color='#ff0000'>βҳ</font></a>&nbsp;&nbsp;"
   Else
      Response.write "<font color='#333333'>��һҳ-</font>"
      Response.write "<font color='#333333'>βҳ</font>&nbsp;&nbsp;"       
   End if
   Response.write "<font color='#333333'>ҳ��:</font>" & "<font color=#ff0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#333333'>/" & Cstr(rs1.pagecount) & "</font>&nbsp;"
   Response.write "<font color=#ff0000>" & Cstr(MaxPerPage) & "</font>" & "<font color='#333333'>��/ҳ&nbsp" & "���յ�</font>" & "<font color=#ff0000><strong>" & Cstr(Rs1.RecordCount) & "</strong></font>" & "<font color='#333333'>��ӦƸ����</font>&nbsp;&nbsp;"

response.write "&nbsp;&nbsp;"
response.write "<font color='#333333'>ת����</font><input type='text' name='page' size=4 maxlength=4 class='Input' value="&Currentpage&">&nbsp;"
   response.write "<input type='submit'  value=' GO '  name='cndok' class='button'></span>&nbsp;&nbsp;"   
%> </td>
            </tr>
         </form>
      </table></td>
  </tr>
</table>
    </td>
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
