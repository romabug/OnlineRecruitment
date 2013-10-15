<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
dim chkNO
chkNO=request("chkNO")
if chkNO="" then
Call ShowError("请选择个人会员！")
end if
chkNO=split(chkNO,"#")
if request.querystring("action")="refuse" then
conn.execute("update [01387applypro] set passok=2,refuse='"&replace(replace(request.form("refuse"),chr(13),"<br>"),chr(32),"&nbsp;")&"',passtime='"&date()&"' where id="&request.querystring("ChkNo")&"")
conn.execute("update [01387member] set promember=0,procommend=0 where uid='"&request.QueryString("uid")&"'")
call ShowErrorTo("操作成功！","Applypro.asp")
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
  <form name="form1" method="post" action="ApplyProRefuse.asp?action=refuse&ChkNo=<%=ChkNo(0)%>&uid=<%=chkNO(1)%>">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">拒绝通过理由</font></strong></div></td>
    </tr>
    <tr bgcolor="#E6E9EC"> 
      <td width="26%" height="28"><div align="right">输入理由：</div></td>
      <td width="74%"> <div align="left"> 
          <textarea name="refuse" cols="60" rows="6" class="input" id="refuse">无</textarea>
        </div></td>
    </tr>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="2"> <div align="center"> 
          <input name="btnRefuse" type="submit" id="btnRefuse2" style="font-size=12;height=26" value="拒绝通过">
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
call CloseConn()
%>
</body>
</html>