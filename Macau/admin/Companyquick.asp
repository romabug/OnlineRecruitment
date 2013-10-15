<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"Select * from [01387feedback] where mytype=6 order by id desc",1,1)
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
  window.location.href="Feedback_del.asp?page=<%=currentpage%>&action=Companyquick&id="+id+""
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
    <td height="25" colspan="7" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">企 
        业 快 速 注 册 通 道</font></strong></div></td>
  </tr>
  <tr bgcolor="#D3DBE7"> 
    <td height="30"><div align="center">提交人</div></td>
    <td><div align="center">公司</div></td>
    <td><div align="center">电话</div></td>
    <td><div align="center">E-Mail</div></td>
    <td><div align="center">提交时间</div></td>
    <td><div align="center">状态</div></td>
    <td><div align="center">删除</div></td>
  </tr>
  <%
  i=1
  do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="12%" height="30"><div align="center"><a style="cursor:hand" onClick="javascript:showMsg('zb<%=rs("id")%>',x=1-x)"><u><%=rs(1)%></u></a></div></td>
    <td width="17%"><div align="center"><%=rs("company")%></div></td>
    <td width="18%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs("tel")%></font></div></td>
    <td width="19%"><div align="center"><%=rs("email")%></div></td>
    <td width="17%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs("addtime")%></font></div></td>
    <td width="10%"><div align="center"><%if rs("deal")=false then%><a href="QuickDeal.asp?id=<%=rs("id")%>&page=<%=currentpage%>">未处理</a><%else%><a href="QuickDealDetail.asp?id=<%=rs("id")%>&page=<%=currentpage%>"><font color=red>已处理</font></a><%end if%></div></td>
    <td width="7%"><div align="center"><a href='javascript:confirmdel(<%=rs("id")%>)'><font color="#FF3300">删除</font></a></div></td>
  </tr>
  <tr bgcolor="#FFFFFF" id="zb<%=rs("id")%>" style="display:none"> 
    <td height="30" colspan="7"><%=rs("content")%></td>
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