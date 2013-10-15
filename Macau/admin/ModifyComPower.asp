<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
ChkNo=request("ChkNo")
if request.QueryString("action")="modify" then
dim cid,power,powertime,overtime
cid=request.querystring("cid")
power=request.form("power")
powertime=request.form("powertime")
Call RsName(rs,"select regtime,overtime from [01387company] where cid='"&cid&"'",1,1)
select case powertime
case 1
overtime=rs(0)
case 2
overtime=dateadd("m",3,now())
case 3
overtime=dateadd("m",6,now())
case 4
overtime=dateadd("yyyy",1,now())
case 5
overtime=dateadd("yyyy",2,now())
end select
conn.execute("update [01387company] set power="&power&",powertime="&powertime&",begintime='"&now()&"',overtime='"&overtime&"' where cid='"&cid&"'")
Call CloseRs()
call ShowErrorTo("操作成功！","CompanyList.asp?page="&request("page")&"")
end if
if chkNO="" then
Call ShowError("请选择一家企业！")
end if
if len(chkNO)<>15 then
Call ShowError("参数错误！")
end if
Call RsName(rs,"Select cid,companyname,power,powertime from [01387company] where cid='"&ChkNo&"'",1,1)
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<%call main_top()%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="ModifyComPower.asp?page=<%=request("page")%>&action=modify&cid=<%=chkNo%>">
    <tr> 
      <td height="25" colspan="3" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">修 
          改 企业 会 员 等 级</font></strong></div></td>
    </tr>
    <tr bgcolor="#E1E9F7"> 
      <td height="28" colspan="3"><div align="center"><a href="CompanyList.asp?power=4"><font color="#FF0000">重点推荐</font></a>　<a href="CompanyList.asp?power=3"><font color="#006600">VIP会员</font></a>　<a href="CompanyList.asp?power=2"><font color="#0000FF">正式会员</font></a>　<a href="CompanyList.asp?power=1">普通会员</a>　<a href="CompanyList.asp?power=0">待处理会员</a>　<a href="CompanyList.asp?power=">所有会员列表</a></div></td>
    </tr>
    <tr bgcolor="#CEDBF2"> 
      <td height="28" bgcolor="#CEDBF2"><div align="center">公司</div></td>
      <td><div align="center">会员等级</div></td>
      <td><div align="center">服务到期时间</div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td width="19%" height="28" bgcolor="#f1f3f5"><div align="center"><%=rs(1)%></div></td>
      <td width="60%"><div align="center"> 
          <input type="radio" name="power" value="4" <%if rs(2)=4 then response.Write("checked")%>>
          <font color="#FF0000">重点推荐 
          <input name="power" type="radio" value="3" <%if rs(2)=3 then response.Write("checked")%>>
          <font color="#006600">VIP会员</font></font> 
          <input name="power" type="radio" value="2" <%if rs(2)=2 then response.Write("checked")%>>
          <font color="#0000FF">正式会员</font> 
          <input type="radio" name="power" value="1" <%if rs(2)=1 then response.Write("checked")%>>
          普通会员</div></td>
      <td width="21%"><div align="center"> 
          <select name="powertime" class="input" id="powertime">
            <option value=1 <%if rs(3)=1 then response.write("selected")%>>免费会员(永久)</option>
            <option value=2 <%if rs(3)=2 then response.write("selected")%>>三个月</option>
            <option value=3 <%if rs(3)=3 then response.write("selected")%>>半年</option>
            <option value=4 <%if rs(3)=4 then response.write("selected")%>>一年</option>
            <option value=5 <%if rs(3)=5 then response.write("selected")%>>两年</option>
          </select>
        </div></td>
    </tr>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="3"> <div align="center"> 
          <input type="submit" name="btnPower" value="确定修改" style="font-size=12;height=26">
          <input type="button" name="btnPower2" value="返 回" onclick="location.href='CompanyList.asp'" style="font-size=12;height=26">
        </div></td>
    </tr>
  </form>
</table>
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