<!--#include file="../conn.asp"-->
<!--#include file="inc/cookies.asp"-->
<%
set rs=server.createobject("adodb.recordset")
rs.open "select uname,regtime from [01387member] where username='"&request.cookies("01387job")("personusername")&"' and uid='"&request.cookies("01387job")("uid")&"'" ,conn,1,1
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from [01387applylist] where uid='"&request.cookies("01387job")("uid")&"' order by applytime desc,id desc" ,conn,1,1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����͹���Ƹ��-������ְ����--�����͹�/��������/�͹���Ƹ</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

<link href="../css/01387_jobs.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
	function go_url(url,height,width)
	{
		var rtvalue = showModalDialog(url,window,"dialogWidth:"+ width +"px;dialogHeight:"+ height +"px;center:yes;help:no;resizable:no;status:no");
	}
</script>
<style type="text/css">
<!--
.STYLE1 {font-weight: bold}
-->
</style>
</head>
<!--#include file="../company/inc/page.inc"-->
<script language="JavaScript" type="text/JavaScript">
function confirmdel(id){
  if (confirm("���Ҫɾ��������Ϣ?")) 
  window.location.href="Apply_del.asp?page=<%=currentpage%>&id="+id+""
} 
</script>
<body >
<!--#include file="top.asp" -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="188" valign="top" background="../images/c30.gif" bgcolor="#F8FAF8"  style="BORDER-left: #404040 1px solid;"><!--#include file="inc/left.asp"-->
    </td>
    <td valign="top" style="BORDER-left: #A9B7A9 1px solid;"><!--#include file="welcome.asp"-->
<table border="0" cellpadding="0" cellspacing="0" class="win3_update_table">
  <tr>
    <td height="22" class="win3_update_table_top">ӦƸ��ʷ��¼</td>
  </tr>
    <tr>
      <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFffff">
          <tr align="center" bgcolor="#FFEDD2">
            <td width="34%" height="20" class="jobp">��ҵ����</td>
            <td width="28%" bgcolor="#FFEDD2" class="jobp">��Ƹְλ</td>
            <td width="19%" bgcolor="#FFEDD2" class="jobp">Ͷ�ż���ʱ��</td>
                <td width="1%" bgcolor="#FFEDD2" class="jobp">&nbsp;</td>
            <td colspan="2" bgcolor="#FFEDD2" class="jobp">����</td>
          </tr>
          <%i=1
			do while not rs1.eof%>
          <tr align="center">
            <td height="26"><%set rs2=server.createobject("adodb.recordset")
                          rs2.open "select companyname from [01387company] where cid='"&rs1("cid")&"'" ,conn,1,1%>
              <a href="../jobs/ShowCompany.asp?cid=<%=rs1("cid")%>" target="_blank"><%=rs2(0)%></a></td>
            <td><span class="STYLE1">
              <%set rs3=server.createobject("adodb.recordset")
                          rs3.open "select jobname from [01387joblist] where jid='"&rs1("jid")&"'" ,conn,1,1%>
              <a href="../jobs/ShowJob.asp?jid=<%=rs1("jid")%>" target="_blank"><%=rs3(0)%></a></span></td>
            <td><font face="Geneva, Arial, Helvetica, sans-serif"><%=rs1("applytime")%></font></td>
            <td>
			<%
						' select case rs1("status")
						' case 1
						' response.Write("<font color=#333333>�ȴ��Ķ�</font>")
						' case 2
						' response.Write("<font color=#993300>���ڿ���</font>")
						' case 3
						' response.Write("<font color=#009900>��������</font>")
						' case 4
						' response.Write("<font color=#FF0000>�Ѿ�ɾ��</font>")
						' end select
						%>
            </td>
            <td width="1%">
			
		<!--	<input name="ap" type="button" value="��ְ��" class="button2" onClick="go_url('Apply_viewmessage.asp?applyid=<%=rs1("applyid")%>',250,426);"> -->
			</td>
            <td width="9%"><div align="center"><a href="javascript:confirmdel(<%=rs1("id")%>)"><font color="#00810E">ɾ��</font></a></div></td>
          </tr>
          <%i=i+1
					  if i>maxperpage then exit do
					  rs1.movenext
					  loop%>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="10" bgcolor="#FFFFFF"></td>
          </tr>
        </table>
        <%Call PageGo2("ApplyList","")%></td>
    </tr>
</table>
<table width="608" border="0" cellpadding="0" cellspacing="0"  style="margin-left:20px;margin-top:10px;">
  <tr>
    <td width="608" height="60" align="center"><div align="left" style="line-height:160%;">
    <!--  <p class="a"><strong>ӦƸ״̬˵��</strong><br />
            <font color="#333333">&nbsp;&nbsp;&nbsp;&nbsp;�ȴ��Ķ�</font>��˵����ҵ��δ�Ķ����ӦƸ����<br />
            <font color="#993300">&nbsp;&nbsp;&nbsp;&nbsp;���ڿ���</font>��˵����ҵ�Ѿ��Ķ������ӦƸ���󣬻�δ�����κβ���<br />
            <font color="#51A92E">&nbsp;&nbsp;&nbsp;&nbsp;��������</font>��˵����ҵ�Ѿ�����ظ�����鿴���<a href="Interview.asp"><font color="#51A92E">��������֪ͨ</font></a><br />
            <font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;�Ѿ�ɾ��</font>��˵����ҵ�Ѿ��ܾ����ӦƸ������Ѿ������˴�ӦƸ���������ѯ����ְλ</p>
    </div> -->
	
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
