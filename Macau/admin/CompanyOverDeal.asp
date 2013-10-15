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
companyid=request("companyid")
Call RsName(rs,"Select A.id,A.cid,A.followmen,A.followcontent,A.followstatus,B.companyname from [companyover] A,[01387company] B where A.cid=B.cid and A.id="&id&"",1,1)
if request("action")="go" then
	followcontent=request("followcontent")
	followstatus=request("followstatus")
	conn.execute("update [companyover] set followmen='"&request.cookies("01387job")("superlogin")&"',followcontent='"&followcontent&"',followstatus='"&followstatus&"' where id="&request.querystring("id"))
	call ShowErrorTo("操作成功！","CompanyOverDeal.asp?id="&request("id")&"&companyid="&request("companyid"))
end if
if Cint(request.cookies("01387job")("userpower"))<2 then
	if rs(5)<>request.cookies("01387job")("superlogin") then
		Call ShowErrorClose("无权限！")
	end if
end if
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/admin.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CAD7F7" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=yes>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
  <form name="form1" method="post" action="CompanyOverDeal.asp?action=go&id=<%=id%>&companyid=<%=companyid%>">
    <tr> 
      <td height="25" colspan="2" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">跟 
          踪 详 情</font></strong></div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">公司：</div></td>
      <td><strong><%=rs(5)%></strong></td>
    </tr>
    <%if Cint(request.cookies("01387job")("userpower"))>1 then%>
    <%end if%>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">跟踪人：</div></td>
      <td><strong><%=rs(2)%></strong></td>
    </tr>
    <tr> 
      <td width="36%" height="120" bgcolor="#f1f3f5"><div align="right">跟踪结果：</div></td>
      <td width="64%" bgcolor="#f1f3f5"><div align="left"> 
          <textarea name="followcontent" cols="40" rows="6" class="input" id="followcontent"><%=rs(3)%></textarea>
        </div></td>
    </tr>
    <tr bgcolor="#f1f3f5"> 
      <td height="28"><div align="right">跟踪状态：</div></td>
      <td><strong> 
        <input name="followstatus" type="text" class="input" id="followstatus" value="<%=rs(4)%>" size="15" maxlength="30">
        <a href="CompanyDeal.asp?id=<%=request("companyid")%>"><u>处理该会员等级</u></a> </strong></td>
    </tr>
    <tr> 
      <td height="26" colspan="2" bgcolor="#E6E9EC"> <div align="center"> 
          <input type="submit" name="btnPower" value="确定提交" style="font-size=12;height=26">
          &nbsp;&nbsp;<a href="javascript:window.close()">[关闭窗口]</a> </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%
call closers()
call CloseConn()
%>
</body>
</html>