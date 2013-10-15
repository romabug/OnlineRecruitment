<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
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
  <form name="form1" method="post" action="Vote_Add_Three.asp">
    <tr> 
      <td height="25" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">新增 
          网站投票</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30">本期主题：<%=Session("votetitle")%></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="30">选项个数： 
        <input name="title" type="text" class="input" id="title" size="3" maxlength="1" onblur="var e=document.getElementById('foo'),n=parseInt(value),i;e.innerHTML='';if(n)for(i=0;i<n;i++)e.innerHTML+='选项'+(i+1)+'：<input class=input size=60 name=selectitem'+i+'><br/>'"/>
<div id="foo">
</div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="26"><div align="center"> 
          <input name="Submit" type="submit" style="width=130;height=30;font-size=12px" value="确 定 提 交">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
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