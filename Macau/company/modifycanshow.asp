<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
dim jid,canshow
jid=request.QueryString("jid")
Call IfJobOverTime(jid)
set rs=server.createobject("adodb.recordset")
rs.open"select jid,cid,canshow from [01387joblist] where jid='"&jid&"'",conn,1,1
if rs("cid")<>request.cookies("01387job")("cid") then
response.Redirect("login.asp")
response.End()
end if
if request.querystring("action")="modify" then
   canshow=request.form("canshow")
   jid=request.querystring("jid")
   set rs1=server.createobject("adodb.recordset")
   rs1.open"select canshow,jid from [01387joblist] where jid='"&jid&"'",conn,3,3
   rs1("canshow")=canshow
   rs1.update
   rs1.close
   set rs1=nothing
%>
<script language="javascript">
alert("修改成功！");
opener.location.reload();
top.close();
</script>
<%end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-企业招聘管理</title>
<meta name="description" content="澳门劳工招聘网macau69.com是澳门最权威的劳工招聘门户网站。该网站整合了澳门雇主,劳工人才,澳门法规,劳工新闻等信息。并与澳门有资质的劳务公司合作,联盟国内各大职业学校,技恔,高校等人才机构。提供劳务咨询,劳务培训,劳务输出等一条龙服务" >
<meta  name="keywords" content="澳门劳务,澳门劳工,澳门劳工人才,招聘澳门劳工,澳门工作,劳工招聘,澳门劳工证,港澳人才,澳门投资移民,广东话培训,劳工新闻,澳门租房,澳门移民,澳门就业,澳门房产,澳门博彩,威尼斯人,发牌员" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {
	color: #00CC00;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<table width="180" border="0" cellpadding="0" cellspacing="1" bgcolor="#cecece">
  <form name="form1" method="post" action="modifycanshow.asp?jid=<%=jid%>&action=modify"><tr> 
    <td width="551" height="30" bgcolor="#e0e0e0"><div align="center" class="STYLE1">修改状态</div></td>
  </tr>
  <tr> 
    <td height="30" bgcolor="f0f0f0">
        <div align="center"> 
          <input type="radio" name="canshow" value="ok" <%if rs("canshow")="ok" then%>checked<%end if%>>
          开放
          <input type="radio" name="canshow" value="no" <%if rs("canshow")="no" then%>checked<%end if%>>
          关闭 </div>
      </td>
  </tr>
  <tr> 
    <td height="30" bgcolor="f0f0f0"><div align="center"> 
        <input name="Submit" type="submit" class="button" value="修改">
          <input type="button" name="Submit2" value="关闭" class="button" onClick="window.close()">
        </div></td>
  </tr></form>
</table>
</body>
</html>
<%rs.close
set rs=nothing
conn.close%>
