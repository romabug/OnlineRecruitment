<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=request("id")
if id="" or isnumeric(id)=false then
	Call ShowError("��������")
end if
page=request("page")
Call RsName(rs,"Select company from [01387Feedback] where id="&id&"",1,1)
if request("action")="go" then
	conn.execute("update [01387feedback] set deal=1,dealman='"&request("dealman")&"',dealresult='"&request("dealresult")&"',dealtime='"&now()&"' where id="&request.querystring("id"))
	call ShowErrorTo("�����ɹ���","Companyquick.asp?page="&request("page"))
end if
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="QuickDeal.asp?action=go&id=<%=id%>&page=<%=page%>">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
          �� ͨ �� �� �� �� ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">��˾��</div></td>
      <td><strong><%=rs(0)%></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">�����ˣ�</div></td>
      <td><strong> 
        <input name="dealman" type="text" class="input" id="dealman" value="" size="10">
        </strong></td>
    </tr>
    <tr> 
      <td width="36%" height="120" bgcolor="#f1f3f5"><div align="right">��������</div></td>
      <td width="64%" bgcolor="#f1f3f5"><div align="left"> 
          <textarea name="dealresult" cols="40" rows="6" class="input" id="dealresult"></textarea>
        </div></td>
    </tr>
    <tr> 
      <td height="26" colspan="2" bgcolor="#E6E9EC"> <div align="center"> 
          <input type="submit" name="btnPower" value="ȷ���ύ" style="font-size=12;height=26">
          <input type="button" name="btnPower2" value="�� ��" onclick="location.href='CompanyQuick.asp?page=<%=page%>'" style="font-size=12;height=26">
        </div></td>
    </tr>
  </form>
</table>
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