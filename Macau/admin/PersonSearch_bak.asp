<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
sql="select uid,degree,birthday,sex,subcatelog,lastlogin,uname,promember,resumestatus,username,id,regtime,doneyear from [01387member]"
if request("key")<>"" then
sql=sql&" where username='"&request("key")&"' or uname='"& request("key")&"' or subcatelog like '%"& request("key")&"%'"
end if
orderby=request("orderby")
if orderby<>"" then
select case orderby
case 1
sql=sql & "order by lastlogin desc"
case 2
sql=sql & "order by regtime desc"
case 3
sql=sql & "order by doneyear desc"
case 4
sql=sql & "order by birthday"
case 5
sql=sql & "order by promember desc"
end select
else
sql=sql & "order by lastlogin desc"
orderby=1
end if
Call RsName(rs,sql,1,1)
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
	if (btnClicked.name=="btnApply")
		{form1.action="DelPerson.asp?page=<%=currentpage%>";form1.submit();}
	else
	    {form1.action="PersonPromember.asp?page=<%=currentpage%>";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td width="107%" height="25" colspan="11" background="image/admin_bg_1.gif"> 
      <div align="center"><strong><font color="#FFFFFF">�� �� �� Ա �� ��</font></strong></div></td>
  </tr>
    <tr bgcolor="#E8EEF9"> 
      <td height="28" colspan="11"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="12">
          <tr> 
		   <form name="form2" method="post" action="PersonSearch.asp">
            <td width="72%">���˻�Ա������ 
              <input name="key" type="text" class="input" id="key" size="20"> 
              <input name="Submit" type="submit" class="botton" value="����"> &nbsp;���ؼ��ֿ�Ϊ���û�������������һ����ְλ��</td></form>
			  <form name="form3" method="post" action="PersonSearch.asp">
            <td width="28%"><select name="orderby" class="input">
                <option value="1">�������¼ʱ������</option>
                <option value="2">��ע��ʱ������</option>
                <option value="3">��������������</option>
                <option value="4">����������</option>
				<option value="5">���߼��˲�����</option>
              </select> &nbsp; <input name="Submit2" type="submit" class="botton" value="����"></td></form>
          </tr>
        </table></td>
    </tr>
  <form name="form1" method="post" action="">
    <tr bgcolor="#CEDBF2"> 
      <td height="28"><div align="center">�û���</div></td>
      <td bgcolor="#CEDBF2"><div align="center">����</div></td>
      <td><div align="center">ѧ��</div></td>
      <td><div align="center">����</div></td>
      <td><div align="center">��������</div></td>
      <td><div align="center">�Ա�</div></td>
      <td><div align="center">����ְλ</div></td>
      <td><div align="center"><a href="PersonList.asp?ProMember=">�߼��˲�</a></div></td>
      <td><div align="center">����״̬</div></td>
      <td><div align="center"> 
          <%if orderby=2 then response.Write("ע��ʱ��") else response.Write("�����¼ʱ��")%>
        </div></td>
      <td><div align="center">����</div></td>
    </tr>
	<%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="12%" height="28"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(9)%></font></strong></div></td>
      <td width="7%" bgcolor="#f1f3f5"><div align="center"><a href="ShowPerson.asp?chkNO=<%=rs(0)%>"><font color="#0066CC"><%=rs(6)%></font></a></div></td>
      <td width="8%" bgcolor="#f1f3f5"><div align="center"> 
          <%
					  select case rs(1)
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
					  %>
        </div></td>
      <td width="5%"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif">
          <%if orderby=4 then response.write("<font color=red>"&datediff("yyyy",rs(2),date())&"</font>")else response.write(datediff("yyyy",rs(2),date()))%>
          </font></strong></div></td>
      <td width="7%"><div align="center"><font color="#333333" face="Geneva, Arial, Helvetica, sans-serif"><strong>
          <%if orderby=3 then response.write("<font color=red>"&rs(12)&"</font>")else response.write(rs(12))%>
          ��</strong></font></div></td>
      <td width="5%"><div align="center"> 
          <%
						select case rs(3)
						case true
						response.write("��")
						case false
						response.write("Ů")
						end select
						%>
        </div></td>
      <td width="17%"><div align="center"><%if rs(4)<>"" then response.Write(replace(rs(4),request("key"),"<font color=red>"&request("key")&"</font>"))else response.Write(rs(4))%></div></td>
      <td width="7%"><div align="center"> 
          <%if rs(7)=true then response.write("<a href='PersonList.asp?Promember=1'><font color=red><u>��</u></font></a>") else response.write("<a href='PersonList.asp?Promember=0'><u>��</u></a>")%>
        </div></td>
      <td width="7%"> <div align="center"> 
          <%if rs(8)="open" then response.write("<font color=red>����</font>") else response.write("�ر�")%>
        </div></td>
      <td width="21%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <%if orderby=2 then 
		   if datevalue(rs(11))=date() then
		   response.write("<font color=red>"&rs(11)&"</font>")
		   else response.write(rs(11))
		   end if
		   else
		   if datevalue(rs(5))=date() then
		   response.write("<font color=red>"&rs(5)&"</font>")
		   else response.write(rs(5))
		   end if
		   end if%>
          </font></div></td>
      <td width="4%"><div align="center"> 
          <input name="ChkNo" type="checkbox" id="ChkNo" value="<%=rs(0)%>">
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="11"> <div align="right"> 
          <input type="button" name="Button3" value="ȫѡ" style="font-size=12" onclick="CheckAll(this.form)">
          <input type="button" name="Button2" value="��ѡ" style="font-size=12" onclick="CheckOthers(this.form);">
          <input type="button" name="btnPromember" value="�Ƽ��߼��˲�" style="font-size=12" onClick="doSubmit(document.form1,this)">
          <input type="button" name="btnApply" value="ɾ����ѡ��Ա(����)" style="font-size=12" onClick="doSubmit(document.form1,this)">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("PersonSearch","Key="&request("key")&"&orderby="&orderby&"&")%>
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