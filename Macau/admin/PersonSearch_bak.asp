<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
sql="select uid,degree,birthday,sex,subcatelog,lastlogin,uname,promember,resumestatus,username,id,regtime,doneyear from [01387member]"
if request("key")<>"" then
sql=sql&" where username='"&request("key")&"' or uname='"& request("key")&"' or subcatelog like '%"& request("key")&"%'"
end if
orderby=request("orderby")
if orderby<>"" then
select case orderby
case 1
sql=sql & "order by lastlogin desc"
case 2
sql=sql & "order by regtime desc"
case 3
sql=sql & "order by doneyear desc"
case 4
sql=sql & "order by birthday"
case 5
sql=sql & "order by promember desc"
end select
else
sql=sql & "order by lastlogin desc"
orderby=1
end if
Call RsName(rs,sql,1,1)
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
		{form1.action="DelPerson.asp?page=<%=currentpage%>";form1.submit();}
	else
	    {form1.action="PersonPromember.asp?page=<%=currentpage%>";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <tr> 
    <td width="107%" height="25" colspan="11" background="image/admin_bg_1.gif"> 
      <div align="center"><strong><font color="#FFFFFF">个 人 会 员 列 表</font></strong></div></td>
  </tr>
    <tr bgcolor="#E8EEF9"> 
      <td height="28" colspan="11"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="12">
          <tr> 
		   <form name="form2" method="post" action="PersonSearch.asp">
            <td width="72%">个人会员搜索： 
              <input name="key" type="text" class="input" id="key" size="20"> 
              <input name="Submit" type="submit" class="botton" value="搜索"> &nbsp;（关键字可为：用户名、姓名、第一期望职位）</td></form>
			  <form name="form3" method="post" action="PersonSearch.asp">
            <td width="28%"><select name="orderby" class="input">
                <option value="1">按最近登录时间排序</option>
                <option value="2">按注册时间排序</option>
                <option value="3">按工作经验排序</option>
                <option value="4">按年龄排序</option>
				<option value="5">按高级人才排序</option>
              </select> &nbsp; <input name="Submit2" type="submit" class="botton" value="排序"></td></form>
          </tr>
        </table></td>
    </tr>
  <form name="form1" method="post" action="">
    <tr bgcolor="#CEDBF2"> 
      <td height="28"><div align="center">用户名</div></td>
      <td bgcolor="#CEDBF2"><div align="center">姓名</div></td>
      <td><div align="center">学历</div></td>
      <td><div align="center">年龄</div></td>
      <td><div align="center">工作经验</div></td>
      <td><div align="center">性别</div></td>
      <td><div align="center">期望职位</div></td>
      <td><div align="center"><a href="PersonList.asp?ProMember=">高级人才</a></div></td>
      <td><div align="center">简历状态</div></td>
      <td><div align="center"> 
          <%if orderby=2 then response.Write("注册时间") else response.Write("最近登录时间")%>
        </div></td>
      <td><div align="center">操作</div></td>
    </tr>
	<%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="12%" height="28"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(9)%></font></strong></div></td>
      <td width="7%" bgcolor="#f1f3f5"><div align="center"><a href="ShowPerson.asp?chkNO=<%=rs(0)%>"><font color="#0066CC"><%=rs(6)%></font></a></div></td>
      <td width="8%" bgcolor="#f1f3f5"><div align="center"> 
          <%
					  select case rs(1)
					  case 0
					  response.Write("高中以下")
					  case 1
					  response.Write("高中")
					  case 2
					  response.Write("职高")
					  case 3
					  response.Write("中专")
					  case 4
					  response.Write("大专")
					  case 5
					  response.Write("本科")
					  case 6
					  response.Write("硕士")
					  case 7
					  response.Write("博士")
					  end select
					  %>
        </div></td>
      <td width="5%"><div align="center"><strong><font face="Geneva, Arial, Helvetica, sans-serif">
          <%if orderby=4 then response.write("<font color=red>"&datediff("yyyy",rs(2),date())&"</font>")else response.write(datediff("yyyy",rs(2),date()))%>
          </font></strong></div></td>
      <td width="7%"><div align="center"><font color="#333333" face="Geneva, Arial, Helvetica, sans-serif"><strong>
          <%if orderby=3 then response.write("<font color=red>"&rs(12)&"</font>")else response.write(rs(12))%>
          年</strong></font></div></td>
      <td width="5%"><div align="center"> 
          <%
						select case rs(3)
						case true
						response.write("男")
						case false
						response.write("女")
						end select
						%>
        </div></td>
      <td width="17%"><div align="center"><%if rs(4)<>"" then response.Write(replace(rs(4),request("key"),"<font color=red>"&request("key")&"</font>"))else response.Write(rs(4))%></div></td>
      <td width="7%"><div align="center"> 
          <%if rs(7)=true then response.write("<a href='PersonList.asp?Promember=1'><font color=red><u>是</u></font></a>") else response.write("<a href='PersonList.asp?Promember=0'><u>否</u></a>")%>
        </div></td>
      <td width="7%"> <div align="center"> 
          <%if rs(8)="open" then response.write("<font color=red>开放</font>") else response.write("关闭")%>
        </div></td>
      <td width="21%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"> 
          <%if orderby=2 then 
		   if datevalue(rs(11))=date() then
		   response.write("<font color=red>"&rs(11)&"</font>")
		   else response.write(rs(11))
		   end if
		   else
		   if datevalue(rs(5))=date() then
		   response.write("<font color=red>"&rs(5)&"</font>")
		   else response.write(rs(5))
		   end if
		   end if%>
          </font></div></td>
      <td width="4%"><div align="center"> 
          <input name="ChkNo" type="checkbox" id="ChkNo" value="<%=rs(0)%>">
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="11"> <div align="right"> 
          <input type="button" name="Button3" value="全选" style="font-size=12" onclick="CheckAll(this.form)">
          <input type="button" name="Button2" value="反选" style="font-size=12" onclick="CheckOthers(this.form);">
          <input type="button" name="btnPromember" value="推荐高级人才" style="font-size=12" onClick="doSubmit(document.form1,this)">
          <input type="button" name="btnApply" value="删除所选会员(慎用)" style="font-size=12" onClick="doSubmit(document.form1,this)">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("PersonSearch","Key="&request("key")&"&orderby="&orderby&"&")%>
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