<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
if request("passok")="" then
Call RsName(rs,"select * from [01387applypro] order by applytime desc,id desc",1,1)
else
Call RsName(rs,"select * from [01387applypro] where passok="&request("passok")&" order by applytime desc,id desc",1,1)
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
<%call main_top()%>
<script language=jscript>
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnPass")
		{form1.action="ApplyProPass.asp";form1.submit();}
	else if (btnClicked.name=="btnCommend")
		{form1.action="ApplyProCommend.asp";form1.submit();}
    else if (btnClicked.name=="btnRefuse")
		{form1.action="ApplyProRefuse.asp";form1.submit();}
    else if (btnClicked.name=="btnFirst")
		{form1.action="ApplyProFirst.asp";form1.submit();}
	else
	    {form1.action="ApplyProDel.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="">
    <tr> 
      <td height="25" colspan="10" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">申 
          请 高 级 人 才 列 表</font></strong></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28"><div align="center">申请人姓名</div></td>
      <td><div align="center">身份证</div></td>
      <td><div align="center">留言</div></td>
      <td><div align="center">申请时间</div></td>
      <td><div align="center">审核时间</div></td>
      <td><div align="center">拒绝留言</div></td>
      <td><div align="center">首页推荐</div></td>
      <td><div align="center">内页推荐</div></td>
      <td><div align="center">状态</div></td>
      <td><div align="center">操作</div></td>
    </tr>
    <%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="12%" height="28"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <%call RsName(rs1,"select uname,pic,uid,procommend,firstcommend from [01387member] where uid='"&rs("uid")&"'",1,1)%>
          <a href="ShowPerson.asp?ChkNo=<%=rs1("uid")%>"><%=rs1("uname")%></a></font></strong></div></td>
      <td width="7%" bgcolor="#f1f3f5"><div align="center"><a href="../person/upload/<%=rs("idcardpic")%>" target=_blank>查看</a></div></td>
      <td width="17%"><div align="center"><%=rs("message")%></div></td>
      <td width="11%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs("applytime")%></font></div></td>
      <td width="10%"> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs("passtime")%></font></div></td>
      <td width="15%"><div align="center"><%=rs("refuse")%></div></td>
      <td width="8%"><div align="center"> 
          <%if rs1(4)=true then response.write("<font color=blue>是</font>")%>
          <%if rs1(4)=false then response.write("<font color=red>否</font>")%>
        </div></td>
      <td width="7%"><div align="center"> 
          <%if rs1(3)=true then response.write("<font color=blue>是</font>")%>
          <%if rs1(3)=false then response.write("<font color=red>否</font>")%>
        </div></td>
      <td width="7%"><div align="center"><strong> 
          <%if rs("passok")=3 then response.write("<a href='ApplyPro.asp?passok=3'><font color=blue>通过</font></a>")%>
          <%if rs("passok")=2 then response.write("<a href='ApplyPro.asp?passok=2'><font color=red>拒绝</font></a>")%>
          <%if rs("passok")=1 then response.write("<a href='ApplyPro.asp?passok=1'>未审核</a>")%>
          </strong></div></td>
      <td width="6%"><div align="center"> 
          <input type="radio" name="ChkNo" value="<%=rs("id")&"#"&rs("uid")%>">
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="10"> <div align="right"> 
          <input name="btnFirst" type="button" id="btnFirst" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)" value="首页推荐">
          <input name="btnCommend" type="button" id="btnCommend" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)" value="内页推荐">
          <input name="btnPass" type="button" id="btnPass" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)" value="通过审核">
          <input name="btnRefuse" type="button" id="btnRefuse" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)" value="拒绝通过">
          <input name="btnDel" type="button" id="btnRefuse2" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)" value="删除">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("ApplyPro","passok="&request("passok")&"&")%>
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