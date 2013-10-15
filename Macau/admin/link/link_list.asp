<!--#include file="../../conn.asp"-->
<!--#include file="../cookies.asp"-->
<!--#include file="Function.asp"-->
<% 

Set Rs=Server.CreateObject("Adodb.RecordSet")
sSql="Select * from [link] order by hist asc"
Rs.Open sSql,conn,1,1

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/01387.css" rel="stylesheet" type="text/css">
<title>无标题文档</title>
</head>
<body>
<script language="javascript">
function CheckAll()
{
 for (var i=0;i<document.search.elements.length;i++)
 {
  var e=document.search.elements[i];
  if (e.name != 'allbox')
   e.checked=true;
 }
 }</script>
<table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" bgcolor="#e0f7da" class="C">&nbsp;&nbsp;<strong><font color="#009900">友情链接管理:</font></strong></td>
  </tr>
</table>
<table width="94%" height="92" border="0" align="center" cellpadding="0" cellspacing="1">
<form name="search" method="get"  action="link_del.asp">
  <tr>
    <td width="5%" height="22" align="center" bgcolor="#DDDDDD">ID</td>
    <td width="19%" height="22" align="center" bgcolor="#DDDDDD">网站名称</td>
    <td width="25%" height="22" align="center" bgcolor="#DDDDDD">网址</td>
    <td width="15%" height="22" align="center" bgcolor="#DDDDDD">图片</td>
    <td width="10%" height="22" align="center" bgcolor="#DDDDDD">首页推荐</td>
    <td width="10%" align="center" bgcolor="#DDDDDD">显示/关闭</td>
    <td width="8%" align="center" bgcolor="#DDDDDD">排列</td>
    <td width="8%" bgcolor="#DDDDDD">&nbsp;</td>
  </tr>
  
<%
Dim iPage,iTotal
iPage=FunSql(Request.QueryString("Page"),True)
If iPage=0 Then iPage=1
Rs.PageSize=18
If Not Rs.Eof Then
	Rs.AbsOlutePage=iPage
End If
do while not rs.eof And iTotal<>Rs.PageSize
%>
  <tr>
    <td height="25" align="center" bgcolor="#F3F3F3"><%=rs("id")%></td>
    <td bgcolor="#F3F3F3">&nbsp;<%=rs("linkname")%></td>
    <td bgcolor="#F3F3F3"> &nbsp;<a href="<%=rs("url")%>" target="_blank" class="he" ><%=rs("url")%> </a></td>
    <td align="center" bgcolor="#F3F3F3">
	<%if rs("images")<>"" then 
	response.Write "<img src=../../images/linkpic/"&rs("images")&" width=88 height=31 border=1 />"
	end if
	%>	</td>
    <td align="center" bgcolor="#F3F3F3">
	<%if rs("indexlook")="0" then
	response.Write "否"
	else
	response.Write "<font color=#ff0000>推荐</font>"
	end if%></td>
    <td align="center" bgcolor="#F3F3F3">
	<%if rs("look")="1" then
	response.Write "<font color=#009900>通过</font>"
	else
	response.Write "<font color=#ff0000>关闭</font>"
	end if%>	</td>
    <td align="center" bgcolor="#F3F3F3"><%=rs("hist")%></td>
    <td align="center" bgcolor="#F3F3F3"><a href="add_link_gai.asp?id=<%=rs("id")%>" class="he">修改</a><span class="bai">
      <input name="page" type="hidden" id="page" value="<%=ipage%>" />
    </span>
    <input type='checkbox' name='selAnnounce' value='<%=cstr(rs("id"))%>' /></td>
  </tr>  <%
				iTotal=iTotal+1
				rs.movenext
				loop
				%>
  <tr><td height="12" colspan="8" align="center"><%=FunPage(Rs.pagecount,iPage,Rs.Recordcount,Rs.pagesize,"")%></td>
  </tr>
  <tr>
    <td height="12" colspan="8" align="right"><input name="checkall" type="button" id="checkall" value="全选" onClick="javascript:CheckAll();">
      <input type="submit" name="Submit3" value=" 删了 " /></td>
  </tr></form>
</table>
<br />
<br />
</body>
</html>
