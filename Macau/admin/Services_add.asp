<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
types=request("types")
if types="" then
Call RsName(rs,"select A.id,A.type,A.title,A.pubtime,A.content,A.fromwhere,B.types from [01387services_info] A inner join [01387services_type] B on A.type=B.id order by A.id desc",1,1)
else
Call RsName(rs,"select A.id,A.type,A.title,A.pubtime,A.content,A.fromwhere,B.types from [01387services_info] A inner join [01387services_type] B on A.type=B.id where A.type="&Cint(types)&" order by A.id desc",1,1)
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%call main_top()%>
<!--#include file="inc/Page15.inc"-->
<script language="JavaScript">
function confirmdel(id){
  if (confirm("确定要删除吗?")) 
  window.location.href="Services_Del.asp?id="+id+""
} 
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
  <table width="99%"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form action="Services_save_add.asp" method="post"  name="form1">
    <tr> 
      <td height="25"  background="image/admin_bg_1.gif" colspan="2" align="right"><div align="center"><strong><font color="#FFFFFF">服 
          务 专 区 资 料 上 传</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="15%" align="right">标 &nbsp;&nbsp;&nbsp;题:</td>
      <td width="81%"><input name="title" type="text" class="input" id="title"></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td align="right">发布时间:</td>
      <td><span class="style8"> 
        <input name="pubtime" type="text" class="input" id="pubtime" value=<%response.Write(now())%>>
        </span></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td align="right">文章来源:</td>
      <td><input name="fromwhere" type="text" class="input" id="fromwhere"></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td align="right">所属类别:</td>
      <td> <select name="types" class="input" id="types">
          <%dim rs1 
	  set rs1=server.CreateObject("ADODB.Recordset")
	  rs1.open"select * from [01387services_type]",conn,1,1
	  do while not rs1.eof %>
          <option value=<%=rs1("id")%>><%=trim(rs1("types"))%></option>
		  <%if rs1("id")=4 or rs1("id")=9 or rs1("id")=17 then%>
		  <option value=>------------------------</option>
		  <%end if%>
          <%rs1.movenext 
		loop%>
        </select></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td align="right" valign="top">内容:</td>
      <td> <textarea name="Content" cols="90" rows="10" class="input" id="Content"></textarea></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td colspan="2" align="right" valign="top"><div align="center">
          <input name="submit" type="submit" id="SubMit" value="确 定 添 加" style="width=130;height=30;font-size=12">
          <input type="reset" name="Submit2" value="全 部 重 置" style="width=130;height=30;font-size=12">
        </div></td>
    </tr></form>
  </table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td height="25" colspan="5" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">服 
        务 专 区 资 料 列 表</font></strong></div></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="25"> <div align="center"><font color="#333333"><strong>类别</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>主题</strong></font></div></td>
    <td><div align="center"><font color="#333333"><strong>出处</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>发布时间</strong></font></div></td>
    <td height="25"><div align="center"><font color="#999999"><font color="#333333"></font></font></div></td>
  </tr>
  <%
  i=1 
  do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="19%" height="30"><div align="center"><a href="Services_add.asp?types=<%=rs(1)%>"><%=rs(6)%></a></div></td>
    <td width="46%"><div align="center"><a href="../Services/show.asp?id=<%=rs("id")%>" target="_blank"><font color="#0033CC" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(2)%></font></a></div></td>
    <td width="16%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(5)%></font></div></td>
    <td width="13%"><div align="center"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(3)%></font></strong></div></td>
    <td width="6%"><div align="center"><a href='javascript:confirmdel(<%=rs(0)%>)'><font color="#FF3300">删除</font></a></div></td>
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
<%Call PageGo("Services_add","types="&request("types")&"&")%>
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