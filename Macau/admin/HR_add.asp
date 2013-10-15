<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
types=request("types")
if types="" then
Call RsName(rs,"select A.id,A.type,A.title,A.pubtime,A.content,A.fromwhere,B.types from [01387HR_club] A inner join [01387HR_type] B on A.type=B.id order by A.id desc",1,1)
else
if types=15 then
Call RsName(rs,"select A.id,A.type,A.title,A.pubtime,A.content,A.fromwhere,B.types,A.Commend from [01387HR_club] A inner join [01387HR_type] B on A.type=B.id where A.type="&Cint(types)&" order by A.commend desc,A.id desc",1,1)
else
Call RsName(rs,"select A.id,A.type,A.title,A.pubtime,A.content,A.fromwhere,B.types,A.Commend from [01387HR_club] A inner join [01387HR_type] B on A.type=B.id where A.type="&Cint(types)&" order by A.id desc",1,1)
end if
end if
if request.querystring("commend")<>"" then
if request.querystring("commend")="1" then
conn.execute("update [01387HR_club] set Commend=0 where id="&request.querystring("id"))
else
set rsq=conn.execute("select count(id) from [01387Hr_club] where commend=1")
if rsq(0)>=8 then
Call ShowError("最多只能推荐8个下载，请先取消其他推荐挪挪位^_^")
else
conn.execute("update [01387HR_club] set Commend=1 where id="&request.querystring("id"))
end if
end if
Call ShowErrorTo("操作成功！","HR_add.asp?types=15")
end if
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%call main_top()%>
<!--#include file="inc/Page15.inc"-->
<script language="vbscript">
Function show(temp)
	If temp=1 then
		document.form1.action="Hr_upfile.asp"
		document.form1.enctype="multipart/form-data"
		document.form1.submit
	End if
End Function
</script>
<script language="JavaScript">
function confirmdel(id){
  if (confirm("确定要删除吗?")) 
  window.location.href="HR_Del.asp?id="+id+""
} 
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
  <table width="99%"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form action="HR_save_add.asp" method="post"  name="form1">
    <tr> 
      <td height="25"  background="image/admin_bg_1.gif" colspan="2" align="right"><div align="center"><strong><font color="#FFFFFF">HR 
          资 料 上 传</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="15%" align="right">标 &nbsp;&nbsp;&nbsp;题:</td>
      <td width="81%"><input name="title" type="text" class="input" id="title" <%if session("filename")<>"" then 
	  response.Write ("value=" & session("filename") )
	  end if%>></td>
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
	  rs1.open"select * from [01387HR_type]",conn,1,1
	  do while not rs1.eof %>
          <option value=<%=rs1("id")%>><%=trim(rs1("types"))%></option>
		  <%if rs1("id")=6 then%>
		  <option value=>-----------------</option>
		  <%end if%>
          <%rs1.movenext 
		loop%>
        </select> <%if session("filename")<>"" then %> <input name="Doc" type="text" class="input" id="Doc" value="<%=session("filename")%>"> 
        <% response.write "<font color=red>上传成功！</font>"
		else%> <input name="file1" type="file" class="input" id="file1"> 
        <input name="filepath" type="hidden" id="filepath" value="../news/doc/"> 
        <input type="submit" name="Submit" value="上传" onClick="show(1)" style="width=45;height=20;font-size=12"> <%end if%> </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td align="right" valign="top">内容:</td>
      <td> <textarea name="Content" cols="90" rows="10" class="input" id="Content"><%if session("filename")<>"" then
		response.Write("<a href=""doc/"&session("filename1")&""">"&session("filename")&"</a>")
		end if%></textarea> </td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td colspan="2" align="right" valign="top"><div align="center">
          <input name="submit" type="submit" id="SubMit" value="确 定 添 加" onClick="show(2)" style="width=130;height=30;font-size=12">
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
    <td height="25" colspan="6" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">HR 
        资 料 列 表</font></strong></div></td>
  </tr>
  <tr bgcolor="#DFE4F9"> 
    <td height="25"> <div align="center"><font color="#333333"><strong>类别</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>主题</strong></font></div></td>
    <td><div align="center"><font color="#333333"><strong>出处</strong></font></div></td>
    <td height="25"><div align="center"><font color="#333333"><strong>发布时间</strong></font></div></td>
	<%if types="15" then%>
    <td><div align="center"><font color="333333"><strong>推荐</strong></font></div></td>
	<%end if%>
    <td height="25"><div align="center"><font color="#999999"><font color="#333333"></font></font></div></td>
  </tr>
  <%
  i=1 
  do while not rs.eof%>
  <tr bgcolor="#f1f3f5"> 
    <td width="18%" height="30"><div align="center"><a href="HR_add.asp?types=<%=rs(1)%>"><%=rs(6)%></a></div></td>
    <td width="37%"><div align="center"><a href="../Hr_club/show.asp?id=<%=rs("id")%>" target="_blank"><font color="#0033CC" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(2)%></font></a></div></td>
    <td width="17%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(5)%></font></div></td>
    <td width="16%"><div align="center"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(3)%></font></strong></div></td>
    <%if types="15" then%>
	<td width="6%"><div align="center">
	<%select case rs(7)
	case true
	response.Write("<a href='HR_add.asp?commend=1&id="&rs(0)&"'><font color=red>是</font></a>")
	case false
	response.Write("<a href='HR_add.asp?commend=0&id="&rs(0)&"'><font color=blue>否</font></a>")
	end select
	%>
	</div></td>
	<%end if%>
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
<%Call PageGo("HR_add","types="&request("types")&"&")%>
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