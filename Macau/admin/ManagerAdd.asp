<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call PowerCheck(2)
if request.cookies("01387job")("userpower")=3 then
Call RsName(rs,"Select id,username,userpower,addtime from [01387lch_admin] where userpower<>3",1,1)
else
Call RsName(rs,"Select id,username,userpower,addtime from [01387lch_admin] where userpower=1",1,1)
end if
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<script language="JavaScript">
function confirmdel(id){
  if (confirm("ȷ��Ҫɾ����?")) 
  window.location.href="Manager_Del.asp?id="+id+""
} 
</script>
<%call main_top()%>
<!--#include file="inc/Page15.inc"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="ManagerAdd_save.asp">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
          �� �� �� Ա</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="31%" height="30"><div align="right">�ȼ���</div></td>
      <td width="69%"><%if request.cookies("01387job")("userpower")=3 then%><input type="radio" name="userpower" value="2">
        ����Ա<%end if%> 
        <input type="radio" name="userpower" value="1" <%if request.cookies("01387job")("userpower")=2 then response.write("checked")%>>
        ����Ա</td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30"><div align="right">�û����� </div></td>
      <td height="30"><input name="username" type="text" class="input" id="username" size="30">
        <font color="#FF3300"><strong>(��ʼ����Ϊ123456)</strong></font></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26" colspan="2"><div align="center"> 
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="ȷ �� �� ��">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td height="25" colspan="5" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
        Ա �� �� �� ��</font></strong></div></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="25"> <div align="center"><font color="#333333"><strong>����</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>�û���</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>��¼��¼</strong></font></div></td>
    <td><div align="center"><font color="#333333"><strong>����ʱ��</strong></font></div></td>
    <td height="25"><div align="center"><font color="#999999"><font color="#333333"></font></font></div></td>
  </tr>
  <%
  i=1 
  do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="16%" height="30"><div align="center"> 
        <%
select case rs(2)
case 2
response.Write("<font color=blue><b>����Ա</b></font>")
case 1
response.Write("<font color=#009900><b>����Ա</b></font>")
end select
%>
      </div></td>
    <td width="48%"><div align="center"><font color="#0033CC" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(1)%></font></div></td>
    <td width="12%"><div align="center"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><a href="LoginRecord.asp?id=<%=rs(0)%>">�鿴</a></font></strong></div></td>
    <td width="15%"><div align="center"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(3)%></font></strong></div></td>
    <td width="9%"><div align="center"><a href='javascript:confirmdel(<%=rs(0)%>)'><font color="#FF3300">ɾ��</font></a></div></td>
  </tr>
  <%
i=i+1
if i>MaxPerpage then exit do  
rs.movenext
loop%>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("ManagerAdd","")%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call footer()
call CloseRs()
call CloseConn()
%>
</body>
</html>