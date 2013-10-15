<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->

<%
set rs=server.createobject("adodb.recordset")
rs.open "select uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select A.jid,A.cid,B.jobname,B.sex,B.publishtime,B.overtime,C.companyname,A.id from [01387favorite] as A,[01387joblist] as B,[01387company] as C where A.uid='"&request.cookies("01387job")("uid")&"' and A.jid=B.jid and A.cid=C.cid and A.mytype=2",conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>澳门劳工招聘网-个人求职管理</title>
<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
</script>
<!--#include file="inc/page15.inc"-->
<script language="JavaScript" type="text/JavaScript">
function confirmdel(id){
  if (confirm("真的要删除这条信息?")) 
  window.location.href="Myfavo_del.asp?page=<%=currentpage%>&id="+id+""
} 
	function go_url(url,height,width)
	{
		var rtvalue = showModalDialog(url,window,"dialogWidth:"+ width +"px;dialogHeight:"+ height +"px;center:yes;help:no;resizable:no;status:no");
	}

</script>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table width="600" border="0" cellpadding="0" cellspacing="0"  class="win3_update_table">
  <tr>
    <td height="22" class="win3_update_table_top">我的职位收藏</td>
  </tr>
  <tr>
    <td align="center">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr align="center" >
            <td width="25%" height="20" class="jobp">企业名称</td>
            <td width="18%" class="jobp">职位名称</td>
                <td width="1%" class="jobp">&nbsp; </td>
            <td width="13%" class="jobp">发布日期</td>
            <td width="13%" class="jobp">截止日期</td>
            <td colspan="3" class="jobp">操作</td>
          </tr>
          <%
					  i=0
					  do while not rs1.eof%>
          <tr align="center">
            <td height="26"><%=rs1(6)%></td>
            <td height="22"><a href="../jobs/ShowJob.asp?jid=<%=rs1(0)%>" target="_blank"><strong><%=rs1(2)%> </strong></a></td>
                <td height="22">&nbsp; </td>
            <td height="22"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs1(4)%></font></td>
            <td height="22"><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs1(5)%></font></td>
            <td width="10%" height="22">
			<%set rs4=server.createobject("adodb.recordset")
			sql="select uid,jid from [01387applylist] where uid='"&request.cookies("01387job")("uid")&"' and jid='"&rs1(1)&"'"
  rs4.open sql,conn,1,1%>
                <%if rs4.recordcount>=1 then%>
                <font color=#00810E>已发简历</font>
                <%else%>
              <!--  <a href="javascript:;" onClick="go_url('sendapply.asp?jid=<%=rs1(0)%>&cid=<%=rs1(1)%>',200,426);"><img src="../images/sendmailtop.gif" border="0" /> --></a>
                <%end if%>
            </td>
            <td width="6%" height="22"><a href="javascript:confirmdel(<%=rs1(7)%>)"><font color="#00810E">删除</font></a></td>
          </tr>
          <%
					  i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop%>
        </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="10" bgcolor="#FFFFFF"></td>
          </tr>
        </table>
      <%Call PageGo2("Myfavo","")%>
    </td>
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
