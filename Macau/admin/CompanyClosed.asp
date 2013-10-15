<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request("ChkNo")
if chkNO="" then
Call ShowError("请选择一家企业！")
end if
if len(chkNO)<>15 then
Call ShowError("参数错误！")
end if
Call RsName(rs,"Select companyname,closed,closed_reason,closed_time,closed_overtime from [01387company] where cid='"&ChkNo&"'",1,1)
if rs(1)=true then
	response.write("<script language=javascript>if (confirm('该帐号已冻结，是否对其解冻？')){")
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
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">冻 
          结 企 业 帐 号</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">企业：</div></td>
      <td><strong><font color="#FF0000"><%=rs(0)%></font></strong></td>
    </tr>
    <tr>
      <td height="28" bgcolor="#f1f3f5"><div align="right">冻结时间：</div></td>
      <td bgcolor="#f1f3f5"><input name="howlong" type="text" class="input" id="howlong" size="4" maxlength="4">
        小时<strong><font color="#FF0000">　（时间过后，自动解冻）</font></strong></td>
    </tr>
    <tr> 
      <td width="36%" height="120" bgcolor="#f1f3f5"><div align="right">冻结原因：</div></td>
      <td width="64%" bgcolor="#f1f3f5"><div align="left"> 
          <textarea name="reason" cols="40" rows="6" class="input" id="reason"></textarea>
          <strong><font color="#FF0000">（100字以内）</font></strong></div></td>
    </tr>
    <tr> 
      <td height="26" colspan="2" bgcolor="#E6E9EC"> <div align="center"> 
          <input type="submit" name="btnPower" value="确定提交" style="font-size=12;height=26">
          <input type="button" name="btnPower2" value="返 回" onclick="location.href='CompanyList.asp'" style="font-size=12;height=26">
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