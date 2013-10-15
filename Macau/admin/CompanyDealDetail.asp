<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
id=request("id")
if id="" or isnumeric(id)=false then
	Call ShowError("参数错误！")
end if
page=request("page")
Call RsName(rs,"Select companyname,dealman,dealresult,regtime,dealtime from [01387company] where id="&id&"",1,1)
if request("action")="go" then
	conn.execute("update [01387company] set deal="&request("dealover")&",dealman='"&request("dealman")&"',dealresult='"&request("dealresult")&"',dealtime='"&now()&"' where id="&request.querystring("id"))
	call ShowErrorTo("操作成功！","CompanyList.asp?page="&request("page"))
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="CompanyDealDetail.asp?action=go&id=<%=id%>&page=<%=page%>">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">快 
          速 通 道 处 理 详 情</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">公司：</div></td>
      <td><strong><%=rs(0)%></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">提交时间：</div></td>
      <td><strong><font face="Verdana, Arial, Helvetica, sans-serif"><%=rs(3)%></font></strong></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">处理人：</div></td>
      <td><input name="dealman" type="text" class="input" id="dealman" size="10" value="<%=rs(1)%>"></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">处理时间：</div></td>
      <td><strong><font color="#FF0000" face="Verdana, Arial, Helvetica, sans-serif"><%=rs(4)%></font></strong></td>
    </tr>
    <tr> 
      <td width="23%" height="120" bgcolor="#f1f3f5"><div align="right">处理结果：</div></td>
      <td width="77%" bgcolor="#f1f3f5"><div align="left"> 
          <textarea name="dealresult" cols="40" rows="6" class="input" id="dealresult"><%=rs(2)%></textarea>
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">处理完毕：</div></td>
      <td><input name="dealover" type="radio" value="2">
        否 
        <input name="dealover" type="radio" value="3" checked>
        是</td>
    </tr>
    <tr> 
      <td height="26" colspan="2" bgcolor="#E6E9EC"> <div align="center"> 
          <input type="submit" name="btnPower" value="确定修改" style="font-size=12;height=26">
          <input type="button" name="btnPower2" value="返 回" style="font-size=12;height=26" onclick="javascript:history.go(-1)">
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