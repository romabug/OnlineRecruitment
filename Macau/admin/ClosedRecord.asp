<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Call RsName(rs,"Select a.id,a.reason,a.closed_time,a.closed_overtime,a.myaction,a.userdo,b.companyname,b.cid from [01387ClosedRecord] a inner join [01387company] b on a.cid=b.cid order by a.id desc",1,1)
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
		{form1.action="ClosedRecord_Del.asp?page=<%=currentpage%>";form1.submit();}
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
    <tr> 
      <td height="25" colspan="7" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">企 
          业 会 员 冻 结 记 录</font></strong></div></td>
    </tr>
    <tr bgcolor="#DFE4F9"> 
      <td height="25"> <div align="center"><font color="#333333"><strong>公司名</strong></font></div></td>
      <td height="25"><div align="center"><font color="#333333"><strong>冻结原因</strong></font></div></td>
      <td height="25"><div align="center"><font color="#333333"><strong>冻结/解冻时间</strong></font></div></td>
      <td height="25"><div align="center"><font color="#333333"><strong>冻结过期时间</strong></font></div></td>
      <td height="25"><div align="center"><font color="#333333"><strong>所属操作</strong></font></div></td>
      <td><div align="center"><font color="#333333"><strong>执行员</strong></font></div></td>
      <td height="25"><div align="center"><font color="#333333"><strong>操作</strong></font></div></td>
    </tr>
    <%
  i=1 
  do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="25%" height="28"><div align="center"><a href="ShowCompany.asp?ChkNo=<%=rs(7)%>"><%=rs(6)%></a></div></td>
      <td width="20%"><div align="center"><%=rs(1)%></div></td>
      <td width="16%"><div align="center"><%if rs(2)="1900-1-1" then response.write(" ") else response.write(rs(2))end if%></div></td>
      <td width="15%"><div align="center"><%if rs(3)="1900-1-1" then response.write(" ") else response.write(rs(3))end if%></div></td>
      <td width="8%"><div align="center"><%if rs(4)="冻结" then response.write("<font color=red><b>冻结</b></font>") else response.write("<font color=blue><b>解冻</b></font>")end if%></div></td>
      <td width="11%"><div align="center"><strong><font color="#666666" face="Geneva, Arial, Helvetica, sans-serif"><%=rs(5)%></font></strong></div></td>
      <td width="5%"><div align="center"> 
          <input name="id" type="checkbox" id="id" value="<%=rs(0)%>">
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do  
rs.movenext
loop%>
    <tr bgcolor="#f1f3f5"> 
      <td height="28" colspan="7"> <div align="right"> 
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
<%Call PageGo("ClosedRecord","")%>
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