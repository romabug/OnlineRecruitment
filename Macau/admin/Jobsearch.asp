<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="../conn.asp"-->
<!--#include file="cookies.asp"-->
<!--#include file="inc/Admin_Function.asp"-->
<%
Hurry=request("Hurry")
Canshow=request("Canshow")
key=request("key")
key2=request("key2")
sql="select a.jid,a.cid,a.jobtype,a.jobname,a.sex,a.detailtime,a.overtime,b.companyname,a.neednum,a.degree,a.hurry,a.canshow from [01387joblist] a inner join [01387company] b on a.cid=b.cid where a.jobtype=1"
if Hurry<>"" then
sql=sql&" and a.hurry="&hurry&""
end if
if Canshow<>"" then
sql=sql&" and a.Canshow='"&Canshow&"'"
end if
if key<>"" then
sql=sql& " and a.jobname like '%"&key&"%'"
end if
if Cint(key2)<=0 then
sql=sql&" and a.publishtime='"&date()&"'"
else
sql=sql&" and a.publishtime>='"&dateadd("d",-key2,date())&"'"
end if 
sql=sql&" order by a.detailtime desc,a.id desc"
Call RsName(rs,sql,1,1)
session("httpurl")=request.ServerVariables("URL")
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
	if (btnClicked.name=="btnShow")
		{form1.action="JobHurry.asp?page=<%=currentpage%>";form1.submit();}
	else
		{form1.action="DelJob.asp";form1.submit();}
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="5"> </td>
  </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr> 
      <td height="25" colspan="10" background="image/admin_bg_1.gif"> <div align="center"><strong><font color="#FFFFFF">所　有　职　位 
          列 表</font></strong></div></td>
    </tr>
	<form name="form2" method="post" action="JobSearch.asp">
    <tr bgcolor="#E8EEF9">
      <td height="28" colspan="11">&nbsp;职位搜索： 
        <input name="key" type="text" class="input" id="key" size="30">
        发布时间：
        <input name="key2" type="text" class="input" id="key2" value="360" size="4" maxlength="3">
        天以内 
        <input name="Submit" type="submit" class="botton" value="搜索">
        （关键字可为：职位名称）</td>
    </tr>	
	</form>
    <%if request("Hurry")<>"" then%>
    <%Call RsName(rsHurry,"select jid,jobname,hurrytime from [01387joblist] where hurry=1 order by hurrytime",1,1)%>
    <tr bgcolor="#E8EEF9"> 
      <td height="28" colspan="11">职位加急情况：</td>
    </tr>
    <tr bgcolor="#E8EEF9"> 
      <td height="28" colspan="11"> <%
	  j=1
	  do while not rsHurry.eof%> <%=rsHurry(1)%>&nbsp;过期时间：<strong><font color="#FF3300" face="Geneva, Arial, Helvetica, sans-serif"><%=rsHurry(2)%></font></strong>&nbsp;还有 <font color="#FF0000" face="Geneva, Arial, Helvetica, sans-serif"><strong><%=datediff("d",date(),rsHurry(2))%></strong></font> 天到期&nbsp; <%if rsHurry(2)<date() then response.write("<font color=red>已过期</font>") else response.write("<font color=blue>有效</font>")%>
        || 
        <%if j mod 2=0 then%> <br> <br> <%end if%> <%
	  j=j+1
	  rsHurry.movenext
	  loop%> </td>
    </tr>
    <%
rsHurry.close
set rsHurry=nothing
%>
    <%end if%>
<form name="form1" method="post" action="">
    <tr bgcolor="#CEDBF2"> 
      <td height="28"><div align="center">职位名称</div></td>
      <td bgcolor="#CEDBF2"><div align="center">公司名</div></td>
      <td><div align="center">性别</div></td>
      <td><div align="center">招聘人数</div></td>
      <td><div align="center">学历要求</div></td>
      <td><div align="center"><a href="JobList.asp?Hurry=">加急</a></div></td>
      <td><div align="center"><a href="JobList.asp?Canshow=">状态</a></div></td>
      <td><div align="center">发布日期</div></td>
      <td><div align="center">截止日期</div></td>
      <td><div align="center">操作</div></td>
    </tr>
    <%
	i=1
	do while not rs.eof%>
    <tr bgcolor="#f1f3f5"> 
      <td width="15%" height="28"><div align="center"><a href="ShowJobdetail.asp?Cid=<%=rs(1)%>&ChkNo=<%=rs(0)%>"><%response.Write(replace(rs(3),key,"<font color=red>"&key&"</font>"))%></a></div></td>
      <td width="24%" bgcolor="#f1f3f5"><div align="center"><a href="ShowCompany.asp?ChkNo=<%=rs(1)%>"><%=rs(7)%></a></div></td>
      <td width="7%"><div align="center"> 
          <%
						select case rs(4)
						case "1"
						response.write("男")
						case "2"
						response.write("女")
						case "3"
						response.write("无要求")
						end select
						%>
        </div></td>
      <td width="7%"> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><strong> 
          <%=rs(8)%> </strong>人</font></div></td>
      <td width="10%"> <div align="center"> 
          <%
select case rs(9)
case 0
response.write("高中以下")
case 1
response.write("高中")
case 2
response.write("职高")
case 3
response.write("中专")
case 4
response.write("大专")
case 5
response.write("本科")
case 6
response.write("硕士")
case 7
response.write("博士")
end select
%>
        </div></td>
      <td width="7%"><div align="center"> 
          <%if rs(10)=true then response.Write("<a href='JobSearch.asp?Hurry=1&key="&key&"&key2="&key2&"'><font color=red>是</font></a>")else response.write("<a href='Jobsearch.asp?Hurry=0&key="&key&"&key2="&key2&"'><font color=blue>否</font></a>")%>
        </div></td>
      <td width="6%"> <div align="center">
          <%if rs(11)="ok" then response.Write("<a href='JobSearch.asp?Canshow=ok&key="&key&"&key2="&key2&"'><font color=blue>开放</font></a>")else response.write("<a href='Jobsearch.asp?Canshow=no&key="&key&"&key2="&key2&"'><font color=red>关闭</font></a>")%>
        </div></td>
      <td width="10%"> <div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=datevalue(rs(5))%></font></div></td>
      <td width="10%"><div align="center"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs(6)%></font></div></td>
      <td width="4%"><div align="center"> 
          <input type="radio" name="ChkNo" value="<%=rs(0)%>">
        </div></td>
    </tr>
    <%
i=i+1
if i>MaxPerpage then exit do
rs.movenext
loop%>
    <tr bgcolor="#E6E9EC"> 
      <td height="26" colspan="10"> <div align="right"> 
          <input type="button" name="btnShow" value="职位加急" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
          <input name="httpurl" type="hidden" id="httpurl" value="<%=session("httpurl")%>">
          <input type="button" name="btnDel" value="删除所选职位(慎用)" style="font-size=12;height=26" onClick="doSubmit(document.form1,this)">
        </div></td>
    </tr>
  </form>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"> </td>
  </tr>
</table>
<%Call PageGo("Jobsearch","Canshow="&Canshow&"&Hurry="&Hurry&"&key="&key&"&key2="&key2&"&")%>
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