<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"Select * from [01387feedback] where mytype=8 order by id desc",1,1)
%>
<!--#include file="inc/Page15.inc"-->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<script language="JavaScript">
function confirmdel(id){
  if (confirm("确定要删除吗?")) 
  window.location.href="Feedback_del.asp?page=<%=currentpage%>&action=CompanyReg&id="+id+""
} 
var x=0
function showMsg(msg,bl){
try{
  zb=eval('document.all.'+msg+'.style');
   
zb.display =(bl?'inline':'none')

}catch(e){}

}
</script>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td height="25" colspan="6" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">企 
        业 申 请 正 式 会 员</font></strong></div></td>
  </tr>
  <tr bgcolor="#D3DBE7"> 
    <td height="30"><div align="center">公司</div></td>
    <td><div align="center">联系人</div></td>
    <td><div align="center">该企业详细信息</div></td>
    <td><div align="center">电话</div></td>
    <td><div align="center">提交时间</div></td>
    <td><div align="center">删除</div></td>
  </tr>
  <%do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="23%" height="30"><div align="center"><a style="cursor:hand" onclick="javascript:showMsg('zb<%=rs("id")%>',x=1-x)"><u><%=rs("company")%></u></a></div></td>
    <td width="12%"><div align="center"><%=rs("uname")%></div></td>
    <td width="16%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><a href="ShowCompany.asp?ChkNo=<%=rs("cid")%>">查看</a></font></div></td>
    <td width="20%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs("tel")%></font></div></td>
    <td width="22%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs("addtime")%></font></div></td>
    <td width="7%"><div align="center"><a href='javascript:confirmdel(<%=rs("id")%>)'><font color="#FF3300">删除</font></a></div></td>
  </tr>
  <tr bgcolor="#FFFFFF" id="zb<%=rs("id")%>" style="display:none"> 
    <td height="30" colspan="6"><%=rs("content")%></td>
  </tr>
  <%rs.movenext
    loop%>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("Companyquick","")%>
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