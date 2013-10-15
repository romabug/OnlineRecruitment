<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
if request("mytype")<>"" then
Call RsName(rs,"Select * from [01387feedback] where mytype="&request("mytype")&" order by id desc",1,1)
else
Call RsName(rs,"Select * from [01387feedback] where mytype<>6 and mytype<>7 and mytype<>8 order by id desc",1,1)
end if
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
  window.location.href="Feedback_del.asp?page=<%=currentpage%>&action=feedback&id="+id+""
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
    <td height="25" colspan="7" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">投 
        诉 意 见 反 馈</font></strong></div></td>
  </tr>
  <tr bgcolor="#D3DBE7"> 
    <td height="30"><div align="center">主&nbsp;&nbsp;题： </div></td>
    <td><div align="center">提交人</div></td>
    <td><div align="center">公司</div></td>
    <td><div align="center">电话</div></td>
    <td><div align="center">提交时间</div></td>
    <td><div align="center"><a href="Feedback.asp?mytype="><u>类型</u></a></div></td>
    <td><div align="center">删除</div></td>
  </tr>
  <%do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="25%" height="30"><div align="center"><a style="cursor:hand" onclick="javascript:showMsg('zb<%=rs("id")%>',x=1-x)"><u><%=rs(1)%></u></a></div></td>
    <td width="11%"><div align="center"><%=rs("uname")%></div></td>
    <td width="20%"><div align="center"><%=rs("company")%></div></td>
    <td width="16%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs("tel")%></font></div></td>
    <td width="12%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs("addtime")%></font></div></td>
    <td width="10%"><div align="center"><strong> 
        <%
	select case rs("mytype")
	case 1
	response.Write("<a href='Feedback.asp?mytype=1'>求助</a>")
	case 2
	response.Write("<a href='Feedback.asp?mytype=2'>建议</a>")
	case 3
	response.Write("<a href='Feedback.asp?mytype=3'>投诉</a>")
	case 4
	response.Write("<a href='Feedback.asp?mytype=4'>表扬</a>")
	case 5
	response.Write("<a href='Feedback.asp?mytype=5'>业务联系</a>")
	end select
	%>
        </strong></div></td>
    <td width="6%"><div align="center"><a href='javascript:confirmdel(<%=rs("id")%>)'><font color="#FF3300">删除</font></a></div></td>
  </tr>
  <tr bgcolor="#FFFFFF" id="zb<%=rs("id")%>" style="display:none"> 
    <td height="30" colspan="7"><%=rs("content")%></td>
  </tr>
  <%rs.movenext
    loop%>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("Feedback","mytype="&request("mytype")&"&")%>
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