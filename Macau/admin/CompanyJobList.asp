<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
cid=request.QueryString("cid")
Call RsName(rs,"select a.jid,a.cid,a.jobtype,a.jobname,a.sex,a.detailtime,a.overtime,b.companyname,a.neednum,a.degree,a.jobtype from [01387joblist] a inner join [01387company] b on a.cid=b.cid where a.cid='"&cid&"' order by a.detailtime desc,a.id desc",1,1)
session("httpurl")=request.ServerVariables("URL")&"?cid="&cid
%>
<!--#include file="inc/Page15.inc"-->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<script language=jscript>
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnShow")
		{form1.action="ShowJobDetail.asp";form1.submit();}
	else
		{form1.action="DelJob.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="">
    <tr> 
      <td height="25" colspan="9" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
          �� ˾��ְ��λ �� ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28"><div align="center">ְλ����</div></td>
      <td bgcolor="#CEDBF2"><div align="center">��˾��</div></td>
      <td><div align="center">����</div></td>
      <td><div align="center">�Ա�</div></td>
      <td><div align="center">��Ƹ����</div></td>
      <td><div align="center">ѧ��Ҫ��</div></td>
      <td><div align="center">��������</div></td>
      <td><div align="center">��ֹ����</div></td>
      <td><div align="center">����</div></td>
    </tr>
    <%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="13%" height="28"><div align="center"><a href="ShowJobdetail.asp?Cid=<%=rs(1)%>&ChkNo=<%=rs(0)%>"><%=rs(3)%></a></div></td>
      <td width="22%" bgcolor="#f1f3f5"><div align="center"><a href="ShowCompany.asp?ChkNo=<%=rs(1)%>"><%=rs(7)%></a></div></td>
      <td width="7%"><div align="center">
	  <%
	  select case rs(10)
	  case 1
	  response.Write("<font color=blue>ȫְ</font>")
	  case 0
	  response.Write("<font color=red>��ְ</font>")
	  end select
	  %>
	  </div></td>
      <td width="7%"><div align="center"> 
          <%
						select case rs(4)
						case "1"
						response.write("��")
						case "2"
						response.write("Ů")
						case "3"
						response.write("��Ҫ��")
						end select
						%>
        </div></td>
      <td width="8%"> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><strong> 
          <%=rs(8)%> </strong>��</font></div></td>
      <td width="10%"> <div align="center"> 
          <%
select case rs(9)
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
%>
        </div></td>
      <td width="14%"> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=datevalue(rs(5))%></font></div></td>
      <td width="12%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <%=rs(6)%>
          </font></div></td>
      <td width="7%"><div align="center"> 
          <input type="radio" name="ChkNo" value="<%=rs(0)%>">
          <input type="hidden" name="cid" value="<%=rs(1)%>&">
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="9"> <div align="right"> 
          <input type="button" name="btnShow" value="�鿴��ϸ��Ϣ" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
          <input name="httpurl" type="hidden" id="httpurl" value="<%=session("httpurl")%>">
          <input type="button" name="btnDel" value="ɾ����ѡְλ(����)" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("CompanyJobList","cid="&cid&"&")%>
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