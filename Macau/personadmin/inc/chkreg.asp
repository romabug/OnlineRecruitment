<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../../conn.asp"-->
<%
set rs=server.createobject("ADODB.recordset") 
rs.Open "select username from [01387member] where username='"&request("username")&"'",conn,1,1
if rs.recordcount=1 then 
   can="not"
else
   can="yes"
end if
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�û��ʺż��</title>
<script type="text/javascript">
window.onload = function() {
	window.returnValue = window.dialogArguments;
}
</script>
<link href="../../style/591.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
button {
	color: #6D6765;
	cursor: default;
	padding-top: 2px;
	font-size: 12px;
	border:1px solid #C3C9D1;
	background-color:#FFFFFF;
	height: 20px;
}
}
-->
</style>
</head>

<body oncontextmenu="return false;" onselectstart="return false;" topmargin="5" leftmargin="5" bgcolor="#FDF7CA">

<table border="1" cellpadding="10" style="border-collapse: collapse" width="100%" height="100%" bordercolor="#CC9900" bgcolor="#FFFFFF">
	<tr>
		<td valign="top"><br>
		<div align="center">
        <%if can="not" then%>
        �û��ʺš�<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=Request("username")%></font>������ע�ᣡ������ѡ�� 
        <%else%>
        ��ϲ�����û��ʺš�<font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=Request("username")%></font>������ע�ᣡ 
        <%end if%>
      </div>
		<br><br><br><br><br><br><br><br><br><button onfocus="blur();" onclick="window.close();"><img border="0" src="../image/check.gif" align="absmiddle"> �رմ���</button></td>
	</tr>
</table>

</body>

</html>
<%
rs.close
set rs=nothing
%>