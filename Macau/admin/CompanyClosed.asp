<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request("ChkNo")
if chkNO="" then
Call ShowError("��ѡ��һ����ҵ��")
end if
if len(chkNO)<>15 then
Call ShowError("��������")
end if
Call RsName(rs,"Select companyname,closed,closed_reason,closed_time,closed_overtime from [01387company] where cid='"&ChkNo&"'",1,1)
if rs(1)=true then
	response.write("<script language=javascript>if (confirm('���ʺ��Ѷ��ᣬ�Ƿ����ⶳ��')){")
	response.write("location.href='CompanyOpened.asp?ChkNo="&ChkNo&"&url="&request.ServerVariables("HTTP_REFERER")&"';")
	response.write("}else{")
	response.write("location.href='"&request.ServerVariables("HTTP_REFERER")&"';")
	response.write("}</script>")
	response.End()
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
  <form name="form1" method="post" action="CompanyClosedGo.asp?ChkNo=<%=chkNo%>&url=<%=request.ServerVariables("HTTP_REFERER")%>">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">�� 
          �� �� ҵ �� ��</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">��ҵ��</div></td>
      <td><strong><font color="#FF0000"><%=rs(0)%></font></strong></td>
    </tr>
    <tr>
      <td height="28" bgcolor="#f1f3f5"><div align="right">����ʱ�䣺</div></td>
      <td bgcolor="#f1f3f5"><input name="howlong" type="text" class="input" id="howlong" size="4" maxlength="4">
        Сʱ<strong><font color="#FF0000">����ʱ������Զ��ⶳ��</font></strong></td>
    </tr>
    <tr> 
      <td width="36%" height="120" bgcolor="#f1f3f5"><div align="right">����ԭ��</div></td>
      <td width="64%" bgcolor="#f1f3f5"><div align="left"> 
          <textarea name="reason" cols="40" rows="6" class="input" id="reason"></textarea>
          <strong><font color="#FF0000">��100�����ڣ�</font></strong></div></td>
    </tr>
    <tr> 
      <td height="26" colspan="2" bgcolor="#E6E9EC"> <div align="center"> 
          <input type="submit" name="btnPower" value="ȷ���ύ" style="font-size=12;height=26">
          <input type="button" name="btnPower2" value="�� ��" onclick="location.href='CompanyList.asp'" style="font-size=12;height=26">
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