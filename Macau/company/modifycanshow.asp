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
alert("�޸ĳɹ���");
opener.location.reload();
top.close();
</script>
<%end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����͹���Ƹ��-��ҵ��Ƹ����</title>
<meta name="description" content="�����͹���Ƹ��macau69.com�ǰ�����Ȩ�����͹���Ƹ�Ż���վ������վ�����˰��Ź���,�͹��˲�,���ŷ���,�͹����ŵ���Ϣ��������������ʵ�����˾����,���˹��ڸ���ְҵѧУ,���k,��У���˲Ż������ṩ������ѯ,������ѵ,���������һ��������" >
<meta  name="keywords" content="��������,�����͹�,�����͹��˲�,��Ƹ�����͹�,���Ź���,�͹���Ƹ,�����͹�֤,�۰��˲�,����Ͷ������,�㶫����ѵ,�͹�����,�����ⷿ,��������,���ž�ҵ,���ŷ���,���Ų���,����˹��,����Ա" >

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
    <td width="551" height="30" bgcolor="#e0e0e0"><div align="center" class="STYLE1">�޸�״̬</div></td>
  </tr>
  <tr> 
    <td height="30" bgcolor="f0f0f0">
        <div align="center"> 
          <input type="radio" name="canshow" value="ok" <%if rs("canshow")="ok" then%>checked<%end if%>>
          ����
          <input type="radio" name="canshow" value="no" <%if rs("canshow")="no" then%>checked<%end if%>>
          �ر� </div>
      </td>
  </tr>
  <tr> 
    <td height="30" bgcolor="f0f0f0"><div align="center"> 
        <input name="Submit" type="submit" class="button" value="�޸�">
          <input type="button" name="Submit2" value="�ر�" class="button" onClick="window.close()">
        </div></td>
  </tr></form>
</table>
</body>
</html>
<%rs.close
set rs=nothing
conn.close%>
