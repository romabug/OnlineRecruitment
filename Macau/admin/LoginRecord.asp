<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call PowerCheck(3)
userpower=request("userpower")
if userpower="" then
Call RsName(rs,"Select a.id,a.userid,a.userpower,a.logintime,a.loginip,b.username from [01387loginrecord] a inner join [01387lch_admin] b on a.userid=b.id order by a.id desc",1,1)
else
Call RsName(rs,"Select a.id,a.userid,a.userpower,a.logintime,a.loginip,b.username from [01387loginrecord] a inner join [01387lch_admin] b on a.userid=b.id where a.userpower="&Cint(userpower)&" order by a.id desc",1,1)
end if
if request.QueryString("action")="alljobovertime" then
  conn.execute("AllJobOverTime")
  Call ShowErrorTo("操作成功！","LoginRecord.asp")
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
<!--#include file="inc/Page15.inc"-->
<script language="JavaScript">
function CheckOthers(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            if (e.checked==false)
            {
                e.checked = true;
            }
            else
            {
                e.checked = false;
            }
    }
}

function CheckAll(form)
{
    for (var i=0;i<form.elements.length;i++)
    {
        var e = form.elements[i];
            e.checked = true;
    }
}
function doSubmit(form1,btnClicked)
{
	if (btnClicked.name=="btnApply")
		{form1.action="LoginRecord_Del.asp?page=<%=currentpage%>";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="">
    <tr bgcolor="#FFFFFF">
      <td height="25" colspan="5"><div align="center"><a href="LoginRecord.asp?action=alljobovertime">全部企业所有职位过期</a></div></td>
    </tr>
    <tr> 
      <td height="25" colspan="5" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">管 
          理 登 录 记 录</font></strong></div></td>
    </tr>
    <tr bgcolor="#DFE4F9"> 
      <td height="25"> <div align="center"><font color="#333333"><strong>级别</strong></font></div></td>
      <td height="25"><div align="center"><font color="#333333"><strong>用户名</strong></font></div></td>
      <td height="25"><div align="center"><font color="#333333"><strong>登录时间</strong></font></div></td>
      <td><div align="center"><font color="#333333"><strong>登录IP</strong></font></div></td>
      <td height="25"><div align="center"><font color="#333333"><strong>操作</strong></font></div></td>
    </tr>
    <%
  i=1 
  do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="14%" height="28"><div align="center"> 
          <%
select case rs(2)
case 2
response.Write("<a href='LoginRecord.asp?userpower=2'><font color=blue><b>管理员</b></font></a>")
case 1
response.Write("<a href='LoginRecord.asp?userpower=1'><font color=#009900><b>操作员</b></font></a>")
case 3
response.Write("<a href='LoginRecord.asp?userpower=3'><font color=red><b>超级管理员</b></font></a>")
end select
%>
        </div></td>
      <td width="29%"><div align="center"><font color="#0033CC" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(5)%></font></div></td>
      <td width="28%"><div align="center"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(3)%></font></strong></div></td>
      <td width="22%"><div align="center"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(4)%></font></strong></div></td>
      <td width="7%"><div align="center"><a href='javascript:confirmdel(<%=rs(0)%>)'></a> 
          <input name="id" type="checkbox" id="id" value="<%=rs(0)%>">
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do  
rs.movenext
loop%>
    <tr bgcolor="#f1f3f5"> 
      <td height="28" colspan="5"> <div align="right"> 
          <input type="button" name="Button3" value="全选" style="font-size=12" onclick="CheckAll(this.form)">
          <input type="button" name="Button2" value="反选" style="font-size=12" onclick="CheckOthers(this.form);">
          <input type="button" name="btnApply" value="删除所选" style="font-size=12" onClick="doSubmit(document.form1,this)">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("LoginRecord","userpower="&userpower&"&")%>
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