<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Hurry=request("Hurry")
Canshow=request("Canshow")
key=request("key")
key2=request("key2")
sql="select a.jid,a.cid,a.jobtype,a.jobname,a.sex,a.detailtime,a.overtime,b.companyname,a.neednum,a.degree,a.hurry,a.canshow from [01387joblist] a inner join [01387company] b on a.cid=b.cid where a.jobtype=1"
if Hurry<>"" then
sql=sql&" and a.hurry="&hurry&""
end if
if Canshow<>"" then
sql=sql&" and a.Canshow='"&Canshow&"'"
end if
if key<>"" then
sql=sql& " and a.jobname like '%"&key&"%'"
end if
if Cint(key2)<=0 then
sql=sql&" and a.publishtime='"&date()&"'"
else
sql=sql&" and a.publishtime>='"&dateadd("d",-key2,date())&"'"
end if 
sql=sql&" order by a.detailtime desc,a.id desc"
Call RsName(rs,sql,1,1)
session("httpurl")=request.ServerVariables("URL")
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
		{form1.action="JobHurry.asp?page=<%=currentpage%>";form1.submit();}
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
    <tr> 
      <td height="25" colspan="10" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�����С�ְ��λ 
          �� ��</font></strong></div></td>
    </tr>
	<form name="form2" method="post" action="JobSearch.asp">
    <tr bgcolor="#E8EEF9">
      <td height="28" colspan="11">&nbsp;ְλ������ 
        <input name="key" type="text" class="input" id="key" size="30">
        ����ʱ�䣺
        <input name="key2" type="text" class="input" id="key2" value="360" size="4" maxlength="3">
        ������ 
        <input name="Submit" type="submit" class="botton" value="����">
        ���ؼ��ֿ�Ϊ��ְλ���ƣ�</td>
    </tr>	
	</form>
    <%if request("Hurry")<>"" then%>
    <%Call RsName(rsHurry,"select jid,jobname,hurrytime from [01387joblist] where hurry=1 order by hurrytime",1,1)%>
    <tr bgcolor="#E8EEF9"> 
      <td height="28" colspan="11">ְλ�Ӽ������</td>
    </tr>
    <tr bgcolor="#E8EEF9"> 
      <td height="28" colspan="11"> <%
	  j=1
	  do while not rsHurry.eof%> <%=rsHurry(1)%>&nbsp;����ʱ�䣺<strong><font color="#FF3300" face="Geneva, Arial, Helvetica, sans-serif"><%=rsHurry(2)%></font></strong>&nbsp;���� <font color="#FF0000" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=datediff("d",date(),rsHurry(2))%></strong></font> �쵽��&nbsp; <%if rsHurry(2)<date() then response.write("<font color=red>�ѹ���</font>") else response.write("<font color=blue>��Ч</font>")%>
        || 
        <%if j mod 2=0 then%> <br> <br> <%end if%> <%
	  j=j+1
	  rsHurry.movenext
	  loop%> </td>
    </tr>
    <%
rsHurry.close
set rsHurry=nothing
%>
    <%end if%>
<form name="form1" method="post" action="">
    <tr bgcolor="#CEDBF2"> 
      <td height="28"><div align="center">ְλ����</div></td>
      <td bgcolor="#CEDBF2"><div align="center">��˾��</div></td>
      <td><div align="center">�Ա�</div></td>
      <td><div align="center">��Ƹ����</div></td>
      <td><div align="center">ѧ��Ҫ��</div></td>
      <td><div align="center"><a href="JobList.asp?Hurry=">�Ӽ�</a></div></td>
      <td><div align="center"><a href="JobList.asp?Canshow=">״̬</a></div></td>
      <td><div align="center">��������</div></td>
      <td><div align="center">��ֹ����</div></td>
      <td><div align="center">����</div></td>
    </tr>
    <%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="15%" height="28"><div align="center"><a href="ShowJobdetail.asp?Cid=<%=rs(1)%>&ChkNo=<%=rs(0)%>"><%response.Write(replace(rs(3),key,"<font color=red>"&key&"</font>"))%></a></div></td>
      <td width="24%" bgcolor="#f1f3f5"><div align="center"><a href="ShowCompany.asp?ChkNo=<%=rs(1)%>"><%=rs(7)%></a></div></td>
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
      <td width="7%"> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><strong> 
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
      <td width="7%"><div align="center"> 
          <%if rs(10)=true then response.Write("<a href='JobSearch.asp?Hurry=1&key="&key&"&key2="&key2&"'><font color=red>��</font></a>")else response.write("<a href='Jobsearch.asp?Hurry=0&key="&key&"&key2="&key2&"'><font color=blue>��</font></a>")%>
        </div></td>
      <td width="6%"> <div align="center">
          <%if rs(11)="ok" then response.Write("<a href='JobSearch.asp?Canshow=ok&key="&key&"&key2="&key2&"'><font color=blue>����</font></a>")else response.write("<a href='Jobsearch.asp?Canshow=no&key="&key&"&key2="&key2&"'><font color=red>�ر�</font></a>")%>
        </div></td>
      <td width="10%"> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=datevalue(rs(5))%></font></div></td>
      <td width="10%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(6)%></font></div></td>
      <td width="4%"><div align="center"> 
          <input type="radio" name="ChkNo" value="<%=rs(0)%>">
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="10"> <div align="right"> 
          <input type="button" name="btnShow" value="ְλ�Ӽ�" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
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
<%Call PageGo("Jobsearch","Canshow="&Canshow&"&Hurry="&Hurry&"&key="&key&"&key2="&key2&"&")%>
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