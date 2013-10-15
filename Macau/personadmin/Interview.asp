<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387applylist] where uid='"&request.cookies("01387job")("uid")&"' and status=3 order by applytime desc,id desc" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理--澳门劳工/澳门劳务/劳工招聘</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.a {
	font-size: 12px;
	line-height: 24px;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<!--#include file="../company/inc/page.inc"-->
<script language="JavaScript" type="text/JavaScript">
function confirmdel(id){
  if (confirm("真的要删除这条信息?")) 
  window.location.href="Apply_delview.asp?page=<%=currentpage%>&id="+id+""
} 
	function go_url(url,height,width)
	{
		var rtvalue = showModalDialog(url,window,"dialogWidth:"+ width +"px;dialogHeight:"+ height +"px;center:yes;help:no;resizable:no;status:no");
	}
</script>
<body >
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table  border="0" cellpadding="0" cellspacing="0" class="win3_update_table">
  <tr>
    <td height="22" class="win3_update_table_top">邀请面试通知列表</td>
  </tr>
  <tr>
    <td align="center">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
          <tr align="center" bgcolor="#FFEDD2">
            <td width="34%" height="20" bgcolor="#FFEDD2" class="jobp">企业名称</td>
            <td width="19%" class="jobp">招聘职位</td>
            <td width="14%" class="jobp">投放简历时间</td>
            <td colspan="2" class="jobp">操作</td>
          </tr>
          <%
					  i=1
					  do while not rs1.eof%>
          <tr align="center" >
            <td height="26" >
              <%set rs2=server.createobject("adodb.recordset")
                          rs2.open "select companyname from [01387company] where cid='"&rs1("cid")&"'" ,conn,1,1%>
            <a href="../jobs/ShowCompany.asp?cid=<%=rs1("cid")%>" target="_blank"><%=rs2(0)%></a></td>
            <td><strong>
              <%set rs3=server.createobject("adodb.recordset")
                          rs3.open "select jobname from [01387joblist] where jid='"&rs1("jid")&"'" ,conn,1,1%>
              <a href="../jobs/ShowJob.asp?jid=<%=rs1("jid")%>" target="_blank"><%=rs3(0)%></a></strong></td>
            <td><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs1("applytime")%></font></td>
            <td><input name="ap" type="button" value=" 面试通知 " class="button2" onClick="go_url('Apply_viewcompanymessage.asp?applyid=<%=rs1("applyid")%>',250,426);">
			</td>
            <td width="9%"><div align="center"><a href="javascript:confirmdel(<%=rs1("id")%>)"><font color="#00810E">删除</font></a></div></td>
          </tr>
          <%i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop%>
        </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="15" bgcolor="#FFFFFF"></td>
          </tr>
        </table>
      <%Call PageGo2("InterView","")%></td>
  </tr>
</table></td>
  </tr>
</table>
<!--#include file="bottom.asp" -->
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
conn.close
set conn=nothing
%>
